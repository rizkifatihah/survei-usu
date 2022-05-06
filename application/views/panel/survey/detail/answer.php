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
            <a href="<?php echo base_url(changeLink('panel/survey/detailSurvey/'.$detailSurvei[0]->id_survei)); ?>" class="btn btn-xs btn-danger">Back</a>

          </div>
          <h4 class="panel-title"><?php echo $subtitle; ?></h4>
        </div>
        <div class="panel-body">
          <?php echo $this->session->flashdata('notif'); ?>
          <div class="col-md-12">
              <br>
          </div>
            <br />
            <br />
            <div class="row">
            <div class="col-xs-10">
            <p align="left" style="font-size:15px;color:black">NAMA : <?php echo $jawaban[0]->nama_surveyor; ?></p>
            <p align="left" style="font-size:15px;color:black">EMAIL : <?php echo $jawaban[0]->email_surveyor; ?></p>
            <p align="left" style="font-size:15px;color:black">STANDAR PELAYANAN : <?php echo $jawaban[0]->standar_pelayanan; ?></p>
            <hr>
            </div>
            </div>
            <?php $i=1; foreach($pertanyaan as $p):?>
                <div class="row">
                <div class="col-xs-12">
                <div class="col-xs-10">
                    <p align="left" style="font-size:15px;color:black"><?php echo $i; ?>. <?php echo $p->pertanyaan; ?></p>
                    <input type="hidden" name="id_pertanyaan[]" value="<?php echo $p->id_pertanyaan; ?>">
                    <p align="left" style="color:black">Jawaban :</p> 
                    <div align="left">
                    <?php if($p->kategori_jawaban == '1'): ?>
                        <?php $jawaban = $this->db->get_where('survei_jawaban', array('id_pertanyaan' => $p->id_pertanyaan,'id_detail_survei' => $jawaban[0]->id_detail_survei))->result(); ?>
                        <?php foreach($jawaban as $j): ?>
                            <!-- <?php if($j->jawaban == '4'): ?>
                                <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="4" checked> <label style="font-size:18px;margin-right:13px;">SANGAT PUAS</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="3" disabled> <label style="font-size:18px;margin-right:13px;">PUAS</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="2" disabled> <label style="font-size:18px;margin-right:13px;">TIDAK PUAS</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="1" disabled> <label style="font-size:18px;margin-right:13px;">SANGAT TIDAK PUAS</label>    
                            <?php elseif($j->jawaban == '3'): ?>
                                <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="4" disabled> <label style="font-size:18px;margin-right:13px;">SANGAT PUAS</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="3" checked> <label style="font-size:18px;margin-right:13px;">PUAS</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="2" disabled> <label style="font-size:18px;margin-right:13px;">TIDAK PUAS</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="1" disabled> <label style="font-size:18px;margin-right:13px;">SANGAT TIDAK PUAS</label>
                            <?php elseif($j->jawaban == '2'): ?>
                                <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="4" disabled> <label style="font-size:18px;margin-right:13px;">SANGAT PUAS</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="3" disabled> <label style="font-size:18px;margin-right:13px;">PUAS</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="2" checked> <label style="font-size:18px;margin-right:13px;">TIDAK PUAS</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="1" disabled> <label style="font-size:18px;margin-right:13px;">SANGAT TIDAK PUAS</label>
                            <?php elseif($j->jawaban == '1'): ?>
                                <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="4" disabled> <label style="font-size:18px;margin-right:13px;">SANGAT PUAS</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="3" disabled> <label style="font-size:18px;margin-right:13px;">PUAS</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="2" disabled> <label style="font-size:18px;margin-right:13px;">TIDAK PUAS</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="1" checked> <label style="font-size:18px;margin-right:13px;">SANGAT TIDAK PUAS</label>
                            <?php endif; ?> -->
                            <?php if($j->jawaban == '1'): ?>
                                <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="1" checked> <label style="font-size:18px;margin-right:13px;">1</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="2" disabled> <label style="font-size:18px;margin-right:13px;">2</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="3" disabled> <label style="font-size:18px;margin-right:13px;">3</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="4" disabled> <label style="font-size:18px;margin-right:13px;">4</label>
                            <?php elseif($j->jawaban == '2'): ?>
                                <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="1" disabled> <label style="font-size:18px;margin-right:13px;">1</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="2" checked> <label style="font-size:18px;margin-right:13px;">2</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="3" disabled> <label style="font-size:18px;margin-right:13px;">3</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="4" disabled> <label style="font-size:18px;margin-right:13px;">4</label>
                            <?php elseif($j->jawaban == '3'): ?>
                                <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="1" disabled> <label style="font-size:18px;margin-right:13px;">1</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="2" disabled> <label style="font-size:18px;margin-right:13px;">2</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="3" checked> <label style="font-size:18px;margin-right:13px;">3</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="4" disabled> <label style="font-size:18px;margin-right:13px;">4</label>
                            <?php elseif($j->jawaban == '4'): ?>
                                <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="1" disabled> <label style="font-size:18px;margin-right:13px;">1</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="2" disabled> <label style="font-size:18px;margin-right:13px;">2</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="3" disabled> <label style="font-size:18px;margin-right:13px;">3</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="4" checked> <label style="font-size:18px;margin-right:13px;">4</label>
                            <?php endif; ?>
                        <?php endforeach; ?>
                    <?php elseif($p->kategori_jawaban == '2'): ?>
                        <?php $jawaban = $this->db->get_where('survei_jawaban', array('id_pertanyaan' => $p->id_pertanyaan,'id_detail_survei' => $jawaban[0]->id_detail_survei))->result(); ?>
                        <?php foreach($jawaban as $j): ?>
                            <?php if($j->jawaban == '1'): ?>
                                <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="1" checked> <label style="font-size:18px;margin-right:13px;">1</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="2" disabled> <label style="font-size:18px;margin-right:13px;">2</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="3" disabled> <label style="font-size:18px;margin-right:13px;">3</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="4" disabled> <label style="font-size:18px;margin-right:13px;">4</label>
                            <?php elseif($j->jawaban == '2'): ?>
                                <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="1" disabled> <label style="font-size:18px;margin-right:13px;">1</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="2" checked> <label style="font-size:18px;margin-right:13px;">2</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="3" disabled> <label style="font-size:18px;margin-right:13px;">3</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="4" disabled> <label style="font-size:18px;margin-right:13px;">4</label>
                            <?php elseif($j->jawaban == '3'): ?>
                                <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="1" disabled> <label style="font-size:18px;margin-right:13px;">1</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="2" disabled> <label style="font-size:18px;margin-right:13px;">2</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="3" checked> <label style="font-size:18px;margin-right:13px;">3</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="4" disabled> <label style="font-size:18px;margin-right:13px;">4</label>
                            <?php elseif($j->jawaban == '4'): ?>
                                <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="1" disabled> <label style="font-size:18px;margin-right:13px;">1</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="2" disabled> <label style="font-size:18px;margin-right:13px;">2</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="3" disabled> <label style="font-size:18px;margin-right:13px;">3</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="4" checked> <label style="font-size:18px;margin-right:13px;">4</label>
                            <?php endif; ?>
                        <?php endforeach; ?>
                    <?php elseif($p->kategori_jawaban == '3'): ?>
                        <?php $jawaban = $this->db->get_where('survei_jawaban', array('id_pertanyaan' => $p->id_pertanyaan,'id_detail_survei' => $jawaban[0]->id_detail_survei))->result();?>
                        <?php foreach($jawaban as $j): ?>
                            <?php if($j->jawaban == 'YA'): ?>
                                <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="Ya" checked> <label style="font-size:18px;margin-right:13px;">Ya</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="Tidak" disabled> <label style="font-size:18px;margin-right:13px;">Tidak</label>
                            <?php elseif($j->jawaban == 'TIDAK'): ?>
                                <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="Ya" disabled> <label style="font-size:18px;margin-right:13px;">Ya</label>
                            <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="Tidak" checked> <label style="font-size:18px;margin-right:13px;">Tidak</label>
                            <?php endif; ?>
                            <br>
                            <?php if($p->id_pertanyaan == '9'){?>
                                <?if($j->jawaban == 'YA'){?>
                                <input type="text"  value="<?php echo $j->tambahan_keterangan; ?>" class="form-control" style="width:100%;margin-top:10px;" readonly>
                                <?}?>
                            <?php } ?>
                            <?php endforeach; ?>
                    <?php endif; ?>
                    <br><br>
                    </div>
                </div>
                </div>
                </div>
                <?php $i++; endforeach; ?>
                <br />
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