<script src="<?php echo base_url('assets/'); ?>plugins/highcharts-7.1.2/code/highcharts.js"></script>
<script src="<?php echo base_url('assets/'); ?>plugins/highcharts-7.1.2/code/modules/data.js"></script>
<script src="<?php echo base_url('assets/'); ?>plugins/highcharts-7.1.2/code/modules/exporting.js"></script>
<!-- begin #content -->
<div id="content" class="content">
	<!-- begin row -->
	<div class="col-md-12">
		<div class="row">
			<?php echo $this->session->flashdata('notif'); ?>
			<h3>Good <?php echo waktu(date('H')); ?> : <b><?php echo $this->session->userdata('nama_lengkap'); ?></b><br/>
		</div>
	</div>
	<div class="row">
		<!-- begin col-3 -->
		<?php foreach($daftarSurvei as $key):?>
		<?php $getData = $this->GeneralModel->get_by_id_general('survei_daftar_survei', 'id_daftar_survei', $key->id_daftar_survei); ?>
		<?php foreach($getData as $key2):?>
		<?php $getDataUsed = $this->db->query("SELECT COUNT(*) as hitung FROM survei_detail_survei WHERE id_survei = '$key2->id_daftar_survei' AND status='Digunakan'")->row();?>
		<?php $getJumlah = $this->db->query("SELECT COUNT(*) as hitung FROM survei_detail_survei WHERE id_survei = '$key2->id_daftar_survei'")->row();?>
		<?php
			$poin = $this->db->query("SELECT SUM(jawaban) as poin FROM survei_jawaban WHERE id_survei = '$key2->id_daftar_survei'")->row();
		?>
		<a href="<?php echo base_url('panel/survey/detailSurvey/')?><?php echo $key2->id_daftar_survei?>">
		<div class="col-md-4 col-sm-4">
			<div class="widget widget-stats bg-blue">
				<div class="stats-icon stats-icon-lg"><i class="fa fa-users"></i></div>
				<div class="stats-title"><?php echo $key->kategori?><br>( <?php echo tgl_indo($key2->mulai_survei)?> - <?php echo tgl_indo($key2->selesai_survei)?>)</div>
				<div class="stats-number">
					<label style="color:white">Jumlah Survei : <?php echo $getDataUsed->hitung .'/'. $getJumlah->hitung; ?></label><br>
					<label style="color:white">Poin : 
					<?php  if($poin->poin != 0){
                      echo ($poin->poin/32*100)/$getDataUsed->hitung;
                      }else{
                        echo 0;
                      }
					?>
				</label>
				</div>
			</div>
		</div>
		</a>
		<?php endforeach; ?>
		<?php endforeach;?>
		<!-- end col-3 -->
	</div>
</div>
<!-- end #content -->