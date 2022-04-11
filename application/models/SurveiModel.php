<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class SurveiModel extends CI_Model {

    function __construct()
  {
    parent::__construct();
  }

  public function getListSurvei($mulai_survei='',$selesai_survei='',$kategori='',$standar_pelayanan='')
  {
    $this->datatables->select('*,survei_daftar_survei.id_daftar_survei as id_daftar_survei');
    $this->datatables->from('survei_daftar_survei');
    $this->datatables->where("status_survei = '1'");
    if (!empty($kategori)) {
      $this->datatables->where("kategori = '$kategori'");
    }
    if (!empty($standar_pelayanan)) {
      $this->datatables->where("standar_pelayanan = '$standar_pelayanan'");
    }
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

  public function getListSurveiByUnit($mulai_survei='',$selesai_survei='',$unit='',$nama_unit_kerja='')
  {
    $this->datatables->select('*,survei_daftar_survei.id_daftar_survei as id_daftar_survei');
    $this->datatables->from('survei_daftar_survei');
    $this->datatables->where("status_survei = '1'");
    $this->datatables->where("kategori = '$unit'");
    if (!empty($mulai_survei)) {
        $this->datatables->where("DATE_FORMAT(mulai_survei,'%Y-%m-%d') >= '$mulai_survei'");
      }
    if (!empty($selesai_survei)) {
      $this->datatables->where("DATE_FORMAT(selesai_survei,'%Y-%m-%d') <= '$selesai_survei'");
    }
    if (!empty($nama_unit_kerja)) {
      $this->datatables->where("standar_pelayanan = '$nama_unit_kerja'");
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

  public function getDetailReport()
  {
    return $this->db->query("SELECT * FROM survei_jawaban sj , survei_pertanyaan sp, survei_detail_survei sds, survei_daftar_survei sd WHERE sj.id_pertanyaan = sp.id_pertanyaan AND sj.id_detail_survei = sds.id_detail_survei AND sds.id_survei = sd.id_daftar_survei")->result();
  }
}
