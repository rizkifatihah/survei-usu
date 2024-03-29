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
      <div class="panel panel-inverse" data-sortable-id="form-stuff-1">
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
          <form class="form-horizontal" method="post" action="<?php echo base_url(changeLink('panel/masterData/createService/doCreate/')); ?>">
            <div class="col-md-12">
              <div class="form-group">
                <label class="col-md-2 control-label">Name Service</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" name="nama_unit_kerja" required>
  			       </div>
              </div>
            </div>
            <div class="col-md-12">
              <div class="form-group">
                <label class="col-md-2 control-label">Category</label>
                <div class="col-md-10">
                  <?php if($kategori_unit): ?>
                    <input type="text" class="form-control" name="kategori_unit" value="<?php echo $this->input->get('category')?>" readonly>
                  <?php else: ?>
                    <select class="form-control select2" name="kategori_unit" required>
                      <option value="">-- Choose Category --</option>
                      <?php foreach($category as $k): ?>
                        <option value="<?php echo $k->nama_kategori; ?>"><?php echo $k->nama_kategori; ?></option>
                      <?php endforeach; ?>
                    </select>
                  <?php endif; ?>
  			       </div>
              </div>
            </div>
            <div class="col-md-12">
              <div class="form-group">
                <label class="col-md-2 control-label">Info Service</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" name="keterangan_standar_pelayanan">
  			       </div>
              </div>
            </div>
            <hr />
            <div class="form-group">
              <div class="col-md-12">
                <button type="submit" class="btn btn-sm btn-success  pull-right" style="margin-left:10px">Save</button>
                <?php if($kategori_unit): ?>
                <a href="<?php echo base_url(changeLink('panel/masterData/services?category=').$this->input->get('category')); ?>" class="btn btn-sm btn-danger pull-right">Cancel</a>
                <?php else: ?>
                <a href="<?php echo base_url(changeLink('panel/masterData/services')); ?>" class="btn btn-sm btn-danger pull-right">Cancel</a>
                <?php endif; ?>
              </div>
            </div>
        </div>
        </form>
      </div>
    </div>
  </div>
  <!-- end col-12 -->
</div>
<!-- end row -->
</div>
<!-- end #content -->