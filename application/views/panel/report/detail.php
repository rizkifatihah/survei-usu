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
          <h4 class="panel-title"><?php echo $subtitle; ?> </h4>
        </div>
        <div class="panel-body">
          <?php echo $this->session->flashdata('notif'); ?>
          <div class="col-md-12">
              <br>
          </div>
            <h2><?php echo $report[0]->standar_pelayanan?></h2>
            <a href="<?php echo base_url(changeLink('panel/report/listReport')); ?>" class="btn btn-xs btn-danger">Back</a>
            <br>
            <br>
          <table id="table" class="table table-striped table-bordered" width="100%">
            <thead>
              <tr>
                <th>No</th>
                <th>Question</th>
                <th>Poin</th>
              </tr>
            </thead>
            <tbody>
              <?php $no = 1; foreach ($question as $key) { ?>
                <tr>
                  <td><?php echo $no; ?></td>
                  <td><?php echo $key->pertanyaan; ?></td>
                  <td>
                      <?php 
                      $id_survei = $report[0]->id_daftar_survei;
                      $cekJawaban = $this->db->query("SELECT SUM(jawaban) as jumlahJawaban FROM survei_jawaban WHERE id_pertanyaan = '$key->id_pertanyaan' AND id_survei = '$id_survei'")->result(); ?>
                      <?php echo $cekJawaban[0]->jumlahJawaban;?>
                  </td>
                </tr>
              <?php $no++; } ?>
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