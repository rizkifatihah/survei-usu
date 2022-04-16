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
		<div class="col-md-4 col-sm-4">
			<div class="widget widget-stats bg-blue">
				<div class="stats-icon stats-icon-lg"><i class="fa fa-users"></i></div>
				<div class="stats-title"><?php echo $key->kategori?></div>
				<div class="stats-number">
					<a style="cursor:pointer;color:white;" href="<?php echo base_url('panel/report/listReport?service=')?>">
						
					</a>
				</div>
			</div>
		</div>
		<?php endforeach;?>
		<!-- end col-3 -->
	</div>
</div>
<!-- end #content -->