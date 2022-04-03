<!-- begin #content -->
<div id="content" class="content">
  <!-- begin breadcrumb -->
  <ol class="breadcrumb pull-right">
    <li><a href="javascript:;">Home</a></li>
    <li><a href="javascript:;"><?php echo $title; ?></a></li>
    <li class="active"><?php echo $subtitle; ?></li>
  </ol>
  <!-- end breadcrumb -->
  <!-- begin page-header -->
  <h1 class="page-header"><?php echo $title; ?></h1>
  <!-- end page-header -->

  <!-- begin row -->
  <div class="row">
    <!-- begin col-12 -->
    <div class="col-md-12">
      <!-- begin panel -->
      <div class="panel panel-inverse">
        <div class="panel-heading">
          <div class="panel-heading-btn">
          </div>
          <h4 class="panel-title"><?php echo $subtitle; ?></h4>
        </div>
        <div class="panel-body">
          <?php echo $this->session->flashdata('notif'); ?>
          <div class="col-md-4">
            <select class="form-control select2" id="hak_akses" onchange="cariHakAses(this.value)">
              <option value="">.:Select Access:.</option>
              <?php foreach ($getHakAkses as $key) : ?>
                <option value="<?php echo $key->nama_hak_akses; ?>"><?php echo $key->nama_hak_akses; ?></option>
              <?php endforeach; ?>
            </select>
          </div>
          <script type="text/javascript">
            function cariHakAses(val) {
              location.replace('<?php echo base_url(changeLink('panel/masterData/pengguna?status='.$status.'&hak_akses=')); ?>' + val)
            }
          </script>
          <script>
            $('#hak_akses').val('<?php echo $hak_akses; ?>')
          </script>
          <div class="col-md-4">
            <select class="form-control" id="status" onchange="cariStatus(this.value)">
              <option value="">.:Select Status:.</option>
              <option value="0">Nonactive</option>
              <option value="1">Active</option>
            </select>
          </div>
          <script type="text/javascript">
            function cariStatus(val) {
              location.replace('<?php echo base_url(changeLink('panel/masterData/pengguna?hak_akses='.$hak_akses.'&status=')); ?>'+val)
            }
          </script>
          <script>
            $('#status').val('<?php echo $status; ?>')
          </script>
          <a href="<?php echo base_url(changeLink('panel/masterData/createPengguna/')); ?>" class="btn btn-xs btn-primary pull-right">Add User</a>
          <br />
          <br />
          <br />
          <table id="table" class="table table-striped table-bordered" width="100%">
            <thead>
              <tr>
                <th>NO</th>
                <th>Fullname</th>
                <th>Username</th>
                <th>Access</th>
                <th>Status</th>
                <th>Last Login</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
            </tbody>
          </table>
          <?php echo $this->session->flashdata('notif'); ?>
        </div>
      </div>
      <!-- end panel -->
    </div>
    <!-- end col-12 -->
  </div>
  <!-- end row -->
</div>
<!-- end #content -->
<script type="text/javascript">
  var table;

  $(document).ready(function() {
    table = $('#table').DataTable({
      responsive: {
        breakpoints: [{
          name: 'not-desktop',
          width: Infinity
        }]
      },
      "filter": true,
      "processing": true, //Feature control the processing indicator.
      "serverSide": true, //Feature control DataTables' server-side processing mode.
      "order": [], //Initial no order.
      "pageLength": 100,
      "lengthChange": true,
      // Load data for the table's content from an Ajax source
      "ajax": {
        "url": '<?php echo site_url(changeLink('panel/masterData/pengguna/cari')); ?>',
        "type": "POST",
        "data": {
          "hak_akses": "<?php echo $hak_akses; ?>",
          "status_pengguna": "<?php echo $status; ?>"
        }
      },
      //Set column definition initialisation properties.
      "columns": [{
          "data": null,
          width: 10,
          "sortable": false,
          render: function(data, type, row, meta) {
            return meta.row + meta.settings._iDisplayStart + 1;
          }
        },
        {
          "data": "nama_lengkap",
          width: 100,
        },
        {
          "data": "username",
          width: 100
        },
        {
          "data": "hak_akses",
          width: 100
        },
        {
          "data": "status_pengguna",
          width: 100,
          render: function(data, type, row) {
            if (row.status_pengguna == '0') {
              return '<b class="text-danger">Belum aktif</b>';
            }else{
              return '<b class="text-success">Sudah aktif</b>';
            }
          }
        },
        {
          "data": "last_login",
          width: 100
        },
        {
          "data": "action",
          width: 100,
          render: function(data, type, row) {
            if (row.status_pengguna == '0') {
              var onclick = "aktifPengguna('"+row.id_pengguna+"')";
              var button = '<button class="btn btn-xs btn-success" onclick='+onclick+'><i class="fa fa-check"></i> Active</button>';
            }else{
              var onclick = "nonAktifPengguna('"+row.id_pengguna+"')";
              var button = '<button class="btn btn-xs btn-danger" onclick='+onclick+'><i class="fa fa-ban"></i> Nonactive</button>';
            }
            var onclick2 = "resetPass('"+row.id_pengguna+"')";
            var button2 = '<button class="btn btn-xs btn-primary" onclick='+onclick2+'><i class="fa fa-key"></i> Change Password</button>';
            return row.action+"<br/><br/>"+button+"<br/><br/>"+button2;
          }
        },
      ],
    });
  });
</script>

<script>
  function aktifPengguna(idPengguna){
    Swal.fire({
      title: 'Are you sure?',
      text: "Activated user can enter the application!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, activate it!'
    }).then((result) => {
      if (result.value == true) {
        Swal.fire(
          'Activated!',
          'User has been successfully activated!',
          'success'
        ).then(function(){
          location.replace('<?php echo base_url('panel/masterData/updatePengguna/aktifkan/');?>'+idPengguna);
        });
      }else{
        return false;
      }
    })
  }

  function nonAktifPengguna(idPengguna){
    Swal.fire({
      title: 'Are you sure?',
      text: "Deactivated user cannot enter the application!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, deactivate it!'
    }).then((result) => {
      if (result.value == true) {
        Swal.fire(
          'Deactivated!',
          'User successfully deactivated!',
          'success'
        ).then(function(){
          location.replace('<?php echo base_url('panel/masterData/updatePengguna/nonAktifkan/');?>'+idPengguna);
        });
      }else{
        return false;
      }
    })
  }

  function resetPass(idPengguna){
    Swal.fire({
      title: 'Are you sure?',
      text: "User password will be changed to 12345678",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, Change Password!'
    }).then((result) => {
      if (result.value == true) {
        Swal.fire(
          'Succeed!',
          'User password has been changed successfully!',
          'success'
        ).then(function(){
          location.replace('<?php echo base_url('panel/masterData/updatePengguna/resetPassword/');?>'+idPengguna);
        });
      }else{
        return false;
      }
    })
  }
</script>