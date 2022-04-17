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
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
          </div>
          <h4 class="panel-title"><?php echo $subtitle; ?></h4>
        </div>
        <div class="panel-body">
          <?php echo $this->session->flashdata('notif'); ?>
          <form action="<?php echo base_url('panel/report/listReport'); ?>" class="form-horizontal" method="GET">
            <div class="col-md-6">
              <label for="">Unit</label>
              <select name="unit" class="form-control select2" id="unit"  onchange="cariService(this.value)">
                <option value="">-- Select Unit --</option>
                <?php foreach ($unitAll as $key) { ?>
                  <option value="<?php echo $key->nama_kategori; ?>" <?php if($this->input->get('unit') == $key->nama_kategori) { echo 'selected'; } ?>><?php echo $key->nama_kategori; ?></option>
                <?php } ?>
              </select>
            </div>
            <script>
                function cariService(val){
                  $.ajax({
                    url:'<?php echo base_url('panel/report/listReport/getService');?>',
                    type:'GET',
                    data:'kategori_unit='+val,
                    success:function(resp){
                      $('#service').html('<option value="">-- Select Service --</option>');
                      if (resp!='false') {
                        var data = JSON.parse(resp)
                        $.each(data,function(key,val){
                           $('#service').append('<option value="'+val.nama_unit_kerja+'">'+val.nama_unit_kerja+'</option>');
                        });
                      }
                    }
                  })
                }
            </script>
            <div class="col-md-6">
              <label for="">Service</label>
              <select name="service" class="form-control select2" id="service">
                <?php if($service){?>
                  <?php $idService = $this->db->query("SELECT * FROM survei_standar_pelayanan WHERE kategori_unit = '$unit'")->result();
                  foreach ($idService as $key) { ?>
                    <option value="<?php echo $key->nama_unit_kerja; ?>" <?php if($this->input->get('service') == $key->nama_unit_kerja) { echo 'selected'; } ?>><?php echo $key->nama_unit_kerja; ?></option>
                  <?php } ?>
                <?php } ?>
                <option value="">-- Select Service --</option>
              </select>
            </div>
            <div class="col-md-4">
                <label for="">Start Date</label>
              <input type="date" class="form-control" name="dari" value="<?php echo $dari; ?>">
            </div>
            <div class="col-md-4">
                <label for="">End Date</label>
              <input type="date" class="form-control" name="sampai" value="<?php echo $sampai; ?>">
            </div>
            <div class="col-md-2">
              <br>
              <button type="submit" class="btn btn-primary btn-md">Cari</button>
            </div>
          </form>
          <div class="col-md-12">
              <br>
          </div>
          <table id="table" class="table table-striped table-bordered" width="100%">
            <thead>
              <tr>
                <th>No</th>
                <th>Unit</th>
                <th>Number</th>
                <th>Start Date</th>
                <th>End Date</th>
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
        "url": '<?php echo site_url(changeLink('panel/report/listReport/cari')); ?>',
        "type": "POST",
        "data": {
          "dari": "<?php echo $dari; ?>",
          "sampai": "<?php echo $sampai; ?>",
          "unit": "<?php echo $unit; ?>",
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
          "data": "kategori",
          width: 100,
        },
        {
          "data": "jumlah_survei",
          width: 100,
        },
        {
          "data": "mulai_survei",
          width: 100,
        },
        {
          "data": "selesai_survei",
          width: 100,
        },
        {
          "data": "action",
          width: 100,
          render: function(data, type, row, meta) {
            return '<a href="<?php echo base_url(changeLink("panel/report/detailReport/")); ?>' + row.id_daftar_survei + '" class="btn btn-xs btn-primary" style="margin-top:5px;margin-right:3px;"><i class="fa fa-info-circle"></i> ';
          }
        }
      ],
    });
  });
</script>