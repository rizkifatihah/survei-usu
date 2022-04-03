<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MasterDataModel extends CI_Model {

    function __construct()
  {
    parent::__construct();
  }

  public function getCategory()
  {
    $this->datatables->select('*,survei_kategori.id_kategori as id_kategori');
    $this->datatables->from('survei_kategori');
    $this->datatables->add_column(
      'action',
       anchor(changeLink('panel/masterData/updateCategory/$1'), '<i class="fa fa-edit"></i>', array('class' => 'btn btn-warning btn-xs','style' => 'margin-top:5px;')) . ' '
      . anchor(changeLink('panel/masterData/deleteCategory/$1'), '<i class="fa fa-times"></i>', array('class' => 'btn btn-danger btn-xs','style' => 'margin-top:5px;', "onclick" => "return confirm('Are you sure you want to delete category?')")),
      'id_kategori'
    );
    return print_r($this->datatables->generate('json'));
  }

  public function getService($kategori_unit)
  {
    $this->datatables->select('*,survei_standar_pelayanan.id_standar_pelayanan as id_standar_pelayanan');
    $this->datatables->from('survei_standar_pelayanan');
    $this->datatables->add_column(
      'action',
       anchor(changeLink('panel/masterData/updateService/$1'), '<i class="fa fa-edit"></i>', array('class' => 'btn btn-warning btn-xs','style' => 'margin-top:5px;')) . ' '
      . anchor(changeLink('panel/masterData/deleteService/$1'), '<i class="fa fa-times"></i>', array('class' => 'btn btn-danger btn-xs','style' => 'margin-top:5px;', "onclick" => "return confirm('Are you sure you want to delete service?')")),
      'id_standar_pelayanan'
    );
    if (!empty($kategori_unit)) {
      $this->datatables->where("kategori_unit = '$kategori_unit'");
    }
    return print_r($this->datatables->generate('json'));
  }

}
