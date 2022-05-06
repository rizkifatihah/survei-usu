<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class PenggunaModel extends CI_Model {

    function __construct()
  {
    parent::__construct();
  }

  public function getHakAkses(){
    return $this->db->query("SELECT ha.* FROM survei_hak_akses ha")->result();
  }

  public function getPengguna($hak_akses,$status_pengguna)
  {
    $this->datatables->select('*,survei_pengguna.id_pengguna as id_pengguna');
    $this->datatables->from('survei_pengguna');
    $this->datatables->add_column(
      'action',
       anchor(changeLink('panel/masterData/updatePengguna/$1'), '<i class="fa fa-edit"> Edit</i>', array('class' => 'btn btn-warning btn-xs','style' => 'margin-top:5px;')) . ' '
      . anchor(changeLink('panel/masterData/deletePengguna/$1'), '<i class="fa fa-times"> Delete</i>', array('class' => 'btn btn-danger btn-xs','style' => 'margin-top:5px;', "onclick" => "return confirm('Are you sure you want to delete the user?')")),
      'id_pengguna'
    );
    if (!empty($hak_akses)) {
      $this->datatables->where("hak_akses = '$hak_akses'");
    }
    if ($status_pengguna!='') {
      $this->datatables->where("status_pengguna = '$status_pengguna'");
    }
    return print_r($this->datatables->generate('json'));
  }

}
