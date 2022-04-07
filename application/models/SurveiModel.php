<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class SurveiModel extends CI_Model {

    function __construct()
  {
    parent::__construct();
  }

  public function getListSurvei($mulai_survei='',$selesai_survei='')
  {
    $this->datatables->select('*,survei_daftar_survei.id_daftar_survei as id_daftar_survei');
    $this->datatables->from('survei_daftar_survei');
    $this->datatables->where("status_survei = '1'");
    if (!empty($mulai_survei)) {
        $this->datatables->where("DATE_FORMAT(mulai_survei,'%Y-%m-%d') >= '$mulai_survei'");
      }
      if (!empty($selesai_survei)) {
        $this->datatables->where("DATE_FORMAT(selesai_survei,'%Y-%m-%d') <= '$selesai_survei'");
      }
    $this->datatables->add_column(
      'action',
      anchor(changeLink('panel/survey/deleteSurvey/$1'), '<i class="fa fa-times"></i>', array('class' => 'btn btn-danger btn-xs','style' => 'margin-top:5px;', "onclick" => "return confirm('Are you sure you want to delete survey?')")),
      'id_daftar_survei'
    );
    return print_r($this->datatables->generate('json'));
  }

  public function getDetailListSurvei($id)
  {
    $this->datatables->select('*,survei_detail_survei.id_survei as id_survei');
    $this->datatables->from('survei_detail_survei');
    $this->datatables->where("survei_detail_survei.id_survei = '$id'");
    return print_r($this->datatables->generate('json'));
  }
}
