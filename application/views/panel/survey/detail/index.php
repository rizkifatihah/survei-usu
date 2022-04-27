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
          <a href="<?php echo base_url(changeLink('panel/survey/answerSurvei/excelAll/')); ?><?php echo $id?>" class="btn btn-xs btn-success">Download</a>
            <br />
            <br />
          <table id="table" class="table table-striped table-bordered dataex-html5-selectors" width="100%">
            <thead>
              <tr>
                <th>No</th>
                <th>Link Survey</th>
                <th>Service</th>
                <th>Poin</th>
                <th>Status Survei</th>
              </tr>
            </thead>
            <tbody>
              <?php $no=1; foreach($detailSurvei as $key):?>
              <tr>
                <td> <?php echo $no++; ?> </td>
                <td> <a href="<?php echo base_url('survei?id=')?><?php echo $key->kode_survei; ?>" target="_blank"><?php echo base_url('survei?id=')?><?php echo $key->kode_survei; ?></a> </td>
                <td> <?php echo $key->standar_pelayanan; ?> </td>
                <td>
                  <?php $totalPoin = $this->db->query("SELECT SUM(jawaban) as total FROM survei_jawaban WHERE id_detail_survei = '$key->id_detail_survei'")->row(); ?>
                  <?php if($totalPoin){?>
                    <?php echo $totalPoin->total/8; ?>
                  <?php }?>
                  
                <td>
                <?php if($key->status == 'Belum Digunakan'){?>
                <span class="label label-danger">Not Used</span>
                <?php }else if($key->status == 'Digunakan'){?>
                    <a class="label label-success" href="<?php echo base_url('panel/survey/answerSurvei/')?><?php echo $key->id_detail_survei?>">Used | Detail</a>
                    <a class="label label-primary" href="<?php echo base_url(changeLink('panel/survey/answerSurvei/excel/')); ?><?php echo $key->id_detail_survei?>">Download</a>
                <?php } ?>
                </td>
              </tr>
              <?php endforeach; ?>
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
$(document).ready(function() {
    $('.dataex-html5-selectors').DataTable( {
      responsive: {
        breakpoints: [{
          name: 'not-desktop',
          width: Infinity
        }]
      },
        dom: 'Bfrtip',
        buttons: [
          {
              extend: 'excelHtml5',
              exportOptions: {
                  columns: ':visible'
              }
          },
          {
              extend: 'csvHtml5',
              exportOptions: {
                  columns: ':visible'
              }
          },
          {
                extend: 'pdfHtml5',
                download:'open',
                exportOptions: {
                    columns: ':visible'
                }
          },
          'colvis',
        ]
    } );
    $('.pagination').addClass('pull-right')
} );
</script>