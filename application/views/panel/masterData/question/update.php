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
          <form class="form-horizontal" method="post" action="<?php echo base_url(changeLink('panel/masterData/updateQuestion/doUpdate/')); ?><?php echo $question[0]->id_pertanyaan?>">
            <div class="col-md-12">
              <div class="form-group">
                <label class="col-md-2 control-label">Name Question</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" name="pertanyaan" value="<?php echo $question[0]->pertanyaan?>" required>
  			       </div>
              </div>
            </div>
            <div class="col-md-12">
              <div class="form-group">
                <label class="col-md-2 control-label">Category</label>
                <div class="col-md-10">
                <select class="form-control select2" name="kategori_jawaban" id="kategori_jawaban" required>
                    <option value="">-- Choose Category --</option>
                    <option value="1">Sentence</option>
                    <option value="2">Number</option>
                    <option value="3">Yes or No</option>
                </select>
              </div>
                <script>
                  $('#kategori_jawaban').val('<?php echo $question[0]->kategori_jawaban; ?>')
                </script>
            </div>
            <hr />
            <div class="form-group">
              <div class="col-md-12">
                <button type="submit" class="btn btn-sm btn-success  pull-right" style="margin-left:10px">Save</button>
                <a href="<?php echo base_url(changeLink('panel/masterData/question/')); ?>" class="btn btn-sm btn-danger pull-right">Cancel</a>
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