<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Report extends CI_Controller
{

	public $parent_modul = 'Report';
	public $title = 'Report';

	public function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('LoggedIN') == FALSE) redirect('auth/logout');
		$this->akses_controller = $this->uri->segment(3);
	}


	//--------------- REPORT BEGIN------------------//

	public function listReport($param1='',$param2='')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if($this->session->userdata('unit') == ''){
			if($param1=='cari'){
				$start_date = $this->input->post('dari');			
				$end_date = $this->input->post('sampai');
				$unit = $this->input->post('unit');
				$service = $this->input->post('service');
				return $this->SurveiModel->getListSurvei($start_date,$end_date,$unit,$service);	
			}elseif($param1 == 'getService'){
				$kategori_unit = $this->input->get('kategori_unit');
				$getService = $this->GeneralModel->get_by_id_general('survei_standar_pelayanan','kategori_unit',$kategori_unit);
				if ($getService) {
					echo json_encode($getService,JSON_PRETTY_PRINT);
				}else{
					echo 'false';
				}
			}else{
				if (!empty($this->input->get('dari')) && !empty($this->input->get('sampai'))) {
					$data['dari'] = $this->input->get('dari');
					$data['sampai'] = $this->input->get('sampai');
				}else{
					$data['dari'] = "";
					$data['sampai'] = "";
				}
				$data['title'] = $this->title;
				$data['subtitle'] = 'List Of Report';
				$data['unit'] = $this->input->get('unit');
				$data['service'] = $this->input->get('service');
				$data['unitAll'] = $this->GeneralModel->get_general('survei_kategori');
				$data['content'] = 'panel/report/index';
				$this->load->view('panel/content', $data);
			}
		}else{
			if($param1=='cari'){
				$start_date = $this->input->post('dari');			
				$end_date = $this->input->post('sampai');
				$unit = $this->session->userdata('unit');	
				$service = $this->input->post('service');
				return $this->SurveiModel->getListSurveiByUnit($start_date,$end_date,$unit,$service);	
			}else{
				if (!empty($this->input->get('dari')) && !empty($this->input->get('sampai'))) {
					$data['dari'] = $this->input->get('dari');
					$data['sampai'] = $this->input->get('sampai');
				}else{
					$data['dari'] = "";
					$data['sampai'] = "";
				}
				$data['service'] = $this->input->get('service');
				$data['title'] = $this->title;
				$data['services'] = $this->GeneralModel->get_by_id_general('survei_standar_pelayanan','kategori_unit',$this->session->userdata('unit'));
				$data['subtitle'] = 'List Of Report';
				$data['content'] = 'panel/report/unit';
				$this->load->view('panel/content', $data);
			}
		}
	}

	public function detailReport($param1='',$param2='')
	{
		$data['title'] = $this->title;
		$data['report'] = $this->GeneralModel->get_by_id_general('survei_daftar_survei','id_daftar_survei',$param1);
		$data['question'] = $this->GeneralModel->get_by_id_general('survei_pertanyaan','status','1');
		$data['detailReport'] = $this->SurveiModel->getDetailReport();
		$data['subtitle'] = 'Detail Report';
		$data['content'] = 'panel/report/detail';
		$this->load->view('panel/content', $data);
	}

}
