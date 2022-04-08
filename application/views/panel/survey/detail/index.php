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
          <div class="col-md-12">
              <br>
          </div>
          <a href="<?php echo base_url(changeLink('panel/survey/listSurvey')); ?>" class="btn btn-xs btn-danger">Back</a>
            <br />
            <br />
          <table id="table" class="table table-striped table-bordered" width="100%">
            <thead>
              <tr>
                <th>No</th>
                <th>Link Survey</th>
                <th>Status Survei</th>
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
        "url": '<?php echo site_url(changeLink('panel/survey/detailSurvey/cari')); ?>',
        "type": "POST",
        "data": {
          "id" : "<?php echo $id; ?>"
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
          "data": "kode_survei",
          width: 100,
          render: function(data, type, row, meta) {
              return '<a href="<?php echo base_url('survei?id=')?>'+row.kode_survei+'" target="_blank"><?php echo base_url('survei?id=')?>'+row.kode_survei+'</a>';
          }
        },
        {
          "data": "status",
          width: 100,
          render: function(data, type, row, meta) {
            if(row.status == 'Belum Digunakan'){
                return '<span class="label label-danger">Not Used</span>';
            }else if(row.status == 'Digunakan'){
                return '<a class="label label-success" href="<?php echo base_url('panel/survei/answerSurvei/')?>'+row.kode_survei+'">Used</a>';
            }
          }
        }
      ],
    });
  });
</script>