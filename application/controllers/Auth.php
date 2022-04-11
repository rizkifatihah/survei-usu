<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

	public function __construct()
  {
			parent::__construct();
  }

	public function index()
	{
		if($this->session->userdata('LoggedIN') == FALSE ){
			$this->login();
		}else{
			redirect('panel/dashboard');
		}
		
	}

  public function login($param1='',$param2=''){
		if ($param1=='do_login') {
			$username = $this->input->post('username');
			$cekUser = $this->GeneralModel->get_by_id_general('survei_pengguna','username',$username);
			if ($cekUser) {
				$password = sha1($this->input->post('password'));
				$getUser = $this->AuthModel->getAccountLogin($username,$password);
				if ($getUser) {
					foreach ($getUser as $key) {
						$dataAkun = array(
							'id_pengguna' => $key->id_pengguna,
							'nama_lengkap' => $key->nama_lengkap,
							'username' => $key->username,
							'email_pengguna' => $key->email_pengguna,
							'foto_pengguna' => $key->foto_pengguna,
							'hak_akses' => $key->hak_akses,
							'unit' => $key->unit,
							'LoggedIN' => TRUE
						);
					}

					$this->session->set_userdata($dataAkun);
					$updateLogin = array(
						'last_login' => date('Y-m-d H:i:s'),
					);
					$this->GeneralModel->update_general('survei_pengguna','id_pengguna',$dataAkun['id_pengguna'],$updateLogin);
					$this->session->set_flashdata('notif','<div class="alert alert-success">Login Berhasil</div>');
					redirect('panel/dashboard');
				}else {
					$this->session->set_flashdata('notif','<div class="alert alert-danger">Username atau password pengguna salah</div>');
					redirect('/auth/login');
				}
			}else {
				$this->session->set_flashdata('notif','<div class="alert alert-danger">Akun tidak ditemukan</div>');
					redirect('/auth/login');
			}
		}else {
			$data['appsProfile'] = $this->SettingsModel->get_profile();
			$this->load->view('login',$data);
		}
  }

	public function logout()
	{
		$updateLogin = array(
			'last_logout' => date('Y-m-d H:i:s')
		);
		$this->GeneralModel->update_general('survei_pengguna','id_pengguna',$this->session->userdata('id_pengguna'),$updateLogin);
		$this->session->sess_destroy();
		redirect(base_url('auth/login'),'refresh');
	}

	public function access_denied(){
		$data['appsProfile'] = $this->SettingsModel->get_profile();
		$data['title'] = '401';
		$this->load->view('errors/panel/unauthorized_access',$data);
	}

	public function register($param1=''){
		$data['appsProfile'] = $this->SettingsModel->get_profile();
		if ($param1=='doRegister') {
			//---------- VALIDATION -------------//
			$this->form_validation->set_rules(
					'username', 'Username',
					'required|min_length[5]|max_length[12]|is_unique[survei_pengguna.username]',
					array(
							'required'      => 'Username tidak boleh kosong',
							'is_unique'     => 'Username tidak dapat digunakan'
					)
			);
			$this->form_validation->set_rules(
					'email', 'Email',
					'required|is_unique[survei_pengguna.email]',
					array(
							'required'      => 'Email tidak boleh kosong',
							'is_unique'     => 'Email tidak dapat digunakan, pastikan email anda belum pernah didaftarkan sebelumnya'
					)
			);
			$this->form_validation->set_rules(
					'nama_lengkap', 'Nama Lengkap',
					'required',
					array(
							'required'      => 'Nama Lengkap tidak boleh kosong'
					)
			);
			$this->form_validation->set_rules(
					'no_hp', 'Nomor HP',
					'required',
					array(
							'required'      => 'Nomor HP tidak boleh kosong',
					)
			);
			$this->form_validation->set_rules(
					'password', 'Password',
					'required',
					array(
							'required'      => 'Password tidak boleh kosong',
					)
			);
			$this->form_validation->set_rules(
					're_password', 'Ulangin Password',
					'required|matches[password]',
					array(
							'required'      => 'Ulangi Password tidak boleh kosong',
							'matches'		=> 'Password dan Ulangi Password tidak sama'
					)
			);			
			//---------- END OF VALIDATION -------------//
			if ($this->form_validation->run() == FALSE) {
				$this->load->view('register',$data);
			}else{
				$dataPengguna = array(
					'username' => $this->input->post('username'),
					'nama_lengkap' => $this->input->post('nama_lengkap'),
					'email' => $this->input->post('email'),
					'no_hp' => $this->input->post('no_hp'),
					'password' => sha1($this->input->post('password')),
					'hak_akses' => 'member',
					'status_pengguna' => '0'
				);
				if ($this->GeneralModel->create_general('survei_pengguna',$dataPengguna) == TRUE) {
					sendMail('Aktivasi', '/email/activation', $this->input->post('email'),$dataPengguna);
					$this->session->set_flashdata('notif','<div class="alert alert-success">Selamat akun kamu berhasil dibuat, silahkan cek email untuk melakukan aktivasi akun kamu!. Jika email tidak masuk silahkan cek spam atau kontak admin <a href="https://wa.me/6282276526538?text=hallo admin tolong aktifasi akun dengan username '.$dataPengguna['username'].'" target="_blank">Klik disini</a></div>');					
					redirect('auth/register');
				}
			}
		}else{
			$this->load->view('register',$data);
		}
	}

	public function activate($username){
		$dataPengguna = array(
			'status_pengguna' => '1'
		);
		$this->GeneralModel->update_general('survei_pengguna','username',my_simple_crypt($username,'d'),$dataPengguna);
		$this->session->set_flashdata('notif','<div class="alert alert-success">Selamat akun kamu berhasil diaktivasi, silahkan masuk..</div>');					
		redirect('/');
	}

}