<?php
defined('BASEPATH') or exit('No direct script access allowed');

use chriskacerguis\RestServer\RestController;

class Dashboard extends RestController
{

    function __construct()
    {
        // Construct the parent class
        parent::__construct();


    }

    public function index_get()
    {
        $this->response([
            'status' => true,
            'message' => 'Welcome to the API'
        ], 200);
    }

    public function totalSurveiASA_get()
    {
        $tahun = $this->get('tahun');
        $bulan = $this->get('bulan');
        $cekDaftarSurvei = $this->db->query("SELECT * FROM survei_daftar_survei WHERE sub_category = 'APLIKASI SATU ATAP (ASA)'")->result();
        foreach($cekDaftarSurvei as $row){
            $cekSurvei = $this->db->query("SELECT * FROM survei_detail_survei WHERE id_survei = '$row->id_daftar_survei' AND status = 'Digunakan' AND YEAR(updated_time) = '$tahun'")->result();
            
            $cekSurvei = $this->db->select("*");
            $cekSurvei = $this->db->from("survei_detail_survei");
            $cekSurvei = $this->db->where("id_survei", $row->id_daftar_survei);
            $cekSurvei = $this->db->where("status", "Digunakan");
            if($tahun != null){
                $cekSurvei = $this->db->where("YEAR(updated_time)", $tahun);
            }
            if($bulan != null){
                $cekSurvei = $this->db->where("MONTH(updated_time)", $bulan);
            }
            $cekSurvei = $this->db->get()->result();
            $totalSurvei = count($cekSurvei);
        }
        if($cekDaftarSurvei){
            $this->response([
                'status' => true,
                'message' => 'Data ditemukan',
                'data' => $totalSurvei
            ], 200);
        }else{
            $this->response([
                'status' => false,
                'message' => 'Data tidak ditemukan',
                'data' => null
            ], 200);
        }
    }

    public function totalTingkatKepuasan_get()
    {
        $tahun = $this->get('tahun');
        $bulan = $this->get('bulan');
        $cekKategori = $this->db->query("SELECT * FROM survei_kategori")->result();
        foreach($cekKategori as $row){
            $cekSurvei = $this->db->query("SELECT * FROM survei_daftar_survei WHERE kategori = '$row->nama_kategori'")->result();
            $totalJawaban1 = 0;
            $totalJawaban2 = 0;
            $totalJawaban3 = 0;
            $totalJawaban4 = 0;
            $totalJawaban = 0;
            foreach($cekSurvei as $sv){
                $cekJawaban1 = $this->db->select("COUNT(*) AS jumlah");
                $cekJawaban1 = $this->db->from("survei_jawaban");
                $cekJawaban1 = $this->db->where("id_survei", $sv->id_daftar_survei);
                if($tahun != null){
                    $cekJawaban1 = $this->db->where("YEAR(created_time)", $tahun);
                }
                if($bulan != null){
                    $cekJawaban1 = $this->db->where("MONTH(created_time)", $bulan);
                }
                $cekJawaban1 = $this->db->where("jawaban", "1");
                $cekJawaban1 = $this->db->get()->result();


                $cekJawaban2 = $this->db->select("COUNT(*) AS jumlah");
                $cekJawaban2 = $this->db->from("survei_jawaban");
                $cekJawaban2 = $this->db->where("id_survei", $sv->id_daftar_survei);
                if($tahun != null){
                    $cekJawaban2 = $this->db->where("YEAR(created_time)", $tahun);
                }
                if($bulan != null){
                    $cekJawaban2 = $this->db->where("MONTH(created_time)", $bulan);
                }
                $cekJawaban2 = $this->db->where("jawaban", "2");
                $cekJawaban2 = $this->db->get()->result();

                $cekJawaban3 = $this->db->select("COUNT(*) AS jumlah");
                $cekJawaban3 = $this->db->from("survei_jawaban");
                $cekJawaban3 = $this->db->where("id_survei", $sv->id_daftar_survei);
                if($tahun != null){
                    $cekJawaban3 = $this->db->where("YEAR(created_time)", $tahun);
                }
                if($bulan != null){
                    $cekJawaban3 = $this->db->where("MONTH(created_time)", $bulan);
                }
                $cekJawaban3 = $this->db->where("jawaban", "3");
                $cekJawaban3 = $this->db->get()->result();


                $cekJawaban4 = $this->db->select("COUNT(*) AS jumlah");
                $cekJawaban4 = $this->db->from("survei_jawaban");
                $cekJawaban4 = $this->db->where("id_survei", $sv->id_daftar_survei);
                if($tahun != null){
                    $cekJawaban4 = $this->db->where("YEAR(created_time)", $tahun);
                }
                if($bulan != null){
                    $cekJawaban4 = $this->db->where("MONTH(created_time)", $bulan);
                }
                $cekJawaban4 = $this->db->where("jawaban", "4");
                $cekJawaban4 = $this->db->get()->result();

                
                $totalJawaban1 += $cekJawaban1[0]->jumlah;
                $totalJawaban2 += $cekJawaban2[0]->jumlah;
                $totalJawaban3 += $cekJawaban3[0]->jumlah;
                $totalJawaban4 += $cekJawaban4[0]->jumlah;
                
            }
            $totalJawaban = $totalJawaban1 + $totalJawaban2 + $totalJawaban3 + $totalJawaban4;

            if($totalJawaban != 0){
                $persenJawaban1 = ($totalJawaban1 / $totalJawaban) * 100;
                $persenJawaban2 = ($totalJawaban2 / $totalJawaban) * 100;
                $persenJawaban3 = ($totalJawaban3 / $totalJawaban) * 100 ;
                $persenJawaban4 = ($totalJawaban4 / $totalJawaban) * 100;
            }else{
                $persenJawaban1 = 0;
                $persenJawaban2 = 0;
                $persenJawaban3 = 0;
                $persenJawaban4 = 0;
            }
    
            
            $data[] = array(
                'Satuan Kerja' => $row->nama_kategori,
                'Sangat Tidak Puas' => $totalJawaban1,
                'Sangat Tidak Puas (%)' => $persenJawaban1,
                'Tidak Puas' => $totalJawaban2,
                'Tidak Puas (%)' => $persenJawaban2,
                'Puas' => $totalJawaban3,
                'Puas (%)' => $persenJawaban3,
                'Sangat Puas' => $totalJawaban4,
                'Sangat Puas (%)' => $persenJawaban4,
                'Total Jawaban' => $totalJawaban
            );
        }
        if($data){
            $this->response([
                'status' => true,
                'message' => 'Data ditemukan',
                'data' => $data
            ], 200);
        }else{
            $this->response([
                'status' => false,
                'message' => 'Data tidak ditemukan',
                'data' => $data
            ], 200);
        }

    }

    public function totalSurvei_get()
    {
        $tahun = $this->get('tahun');
        $bulan = $this->get('bulan');
        $cekKategori = $this->db->query("SELECT * FROM survei_kategori")->result();
        foreach($cekKategori as $row){
            $cekSurvei = $this->db->query("SELECT * FROM survei_daftar_survei WHERE kategori = '$row->nama_kategori'")->result();
            $totalSurvei = 0;
            foreach($cekSurvei as $sv){
                $cekTotalSurvei = $this->db->query("SELECT * FROM survei_detail_survei WHERE id_survei = '$sv->id_daftar_survei' AND YEAR(updated_time) = '$tahun' AND MONTH(updated_time) = '$bulan' AND status = 'Digunakan'")->result();
                $cekTotalSurvei = $this->db->select("COUNT(*) AS jumlah");
                $cekTotalSurvei = $this->db->from("survei_detail_survei");
                $cekTotalSurvei = $this->db->where("id_survei", $sv->id_daftar_survei);
                if($tahun != null){
                    $cekTotalSurvei = $this->db->where("YEAR(updated_time)", $tahun);
                }
                if($bulan != null){
                    $cekTotalSurvei = $this->db->where("MONTH(updated_time)", $bulan);
                }
                $cekTotalSurvei = $this->db->where("status", "Digunakan");
                $cekTotalSurvei = $this->db->get()->result();
                $totalSurvei += $cekTotalSurvei[0]->jumlah;
            }
            $data[] = array(
                'Satuan Kerja' => $row->nama_kategori,
                'Total Survei' => $totalSurvei
            );
        }
        if($data){
            $this->response([
                'status' => true,
                'message' => 'Data berhasil diambil',
                'data' => $data
            ], 200);
        }else{
            $this->response([
                'status' => false,
                'message' => 'Data tidak ditemukan',
                'data' => null
            ], 200);
        }
    }

    public function totalTingkatKepuasanPertanyaan_get()
    {
        $tahun = $this->get('tahun');
        $bulan = $this->get('bulan');

        // Get pertanyaan
        $cekPertanyaan = $this->db->query("SELECT * FROM survei_pertanyaan")->result();
        $totalJawaban1 = 0;
        $totalJawaban2 = 0;
        $totalJawaban3 = 0;
        $totalJawaban4 = 0;
        $totalJawaban = 0;
        foreach($cekPertanyaan as $row){
            $cekJawaban1 = $this->db->select("COUNT(*) AS jumlah");
            $cekJawaban1 = $this->db->from("survei_jawaban");
            $cekJawaban1 = $this->db->where("id_pertanyaan", $row->id_pertanyaan);
            if($tahun != null){
                $cekJawaban1 = $this->db->where("YEAR(created_time)", $tahun);
            }
            if($bulan != null){
                $cekJawaban1 = $this->db->where("MONTH(created_time)", $bulan);
            }
            $cekJawaban1 = $this->db->where("jawaban", "1");
            $cekJawaban1 = $this->db->get()->result();

            $cekJawaban2 = $this->db->select("COUNT(*) AS jumlah");
            $cekJawaban2 = $this->db->from("survei_jawaban");
            $cekJawaban2 = $this->db->where("id_pertanyaan", $row->id_pertanyaan);
            if($tahun != null){
                $cekJawaban2 = $this->db->where("YEAR(created_time)", $tahun);
            }
            if($bulan != null){
                $cekJawaban2 = $this->db->where("MONTH(created_time)", $bulan);
            }
            $cekJawaban2 = $this->db->where("jawaban", "2");
            $cekJawaban2 = $this->db->get()->result();

            $cekJawaban3 = $this->db->select("COUNT(*) AS jumlah");
            $cekJawaban3 = $this->db->from("survei_jawaban");
            $cekJawaban3 = $this->db->where("id_pertanyaan", $row->id_pertanyaan);
            if($tahun != null){
                $cekJawaban3 = $this->db->where("YEAR(created_time)", $tahun);
            }
            if($bulan != null){
                $cekJawaban3 = $this->db->where("MONTH(created_time)", $bulan);
            }
            $cekJawaban3 = $this->db->where("jawaban", "3");
            $cekJawaban3 = $this->db->get()->result();

            $cekJawaban4 = $this->db->select("COUNT(*) AS jumlah");
            $cekJawaban4 = $this->db->from("survei_jawaban");
            $cekJawaban4 = $this->db->where("id_pertanyaan", $row->id_pertanyaan);
            if($tahun != null){
                $cekJawaban4 = $this->db->where("YEAR(created_time)", $tahun);
            }
            if($bulan != null){
                $cekJawaban4 = $this->db->where("MONTH(created_time)", $bulan);
            }
            $cekJawaban4 = $this->db->where("jawaban", "4");
            $cekJawaban4 = $this->db->get()->result();

            $totalJawaban1 += $cekJawaban1[0]->jumlah;
            $totalJawaban2 += $cekJawaban2[0]->jumlah;
            $totalJawaban3 += $cekJawaban3[0]->jumlah;
            $totalJawaban4 += $cekJawaban4[0]->jumlah;

            $totalJawaban = $totalJawaban1 + $totalJawaban2 + $totalJawaban3 + $totalJawaban4;

            if($totalJawaban != 0){
                $persen1 = ($totalJawaban1 / $totalJawaban) * 100;
                $persen2 = ($totalJawaban2 / $totalJawaban) * 100;
                $persen3 = ($totalJawaban3 / $totalJawaban) * 100;
                $persen4 = ($totalJawaban4 / $totalJawaban) * 100;
            }else{
                $persen1 = 0;
                $persen2 = 0;
                $persen3 = 0;
                $persen4 = 0;
            }

            $data[] = array(
                'Pertanyaan' => $row->pertanyaan,
                'Sangat Tidak Puas' => $cekJawaban1[0]->jumlah,
                'Sangat Tidak Puas (%)' => $persen1,
                'Tidak Puas' => $cekJawaban2[0]->jumlah,
                'Tidak Puas (%)' => $persen2,
                'Puas' => $cekJawaban3[0]->jumlah,
                'Puas (%)' => $persen3,
                'Sangat Puas' => $cekJawaban4[0]->jumlah,
                'Sangat Puas (%)' => $persen4,
                'Total' => $totalJawaban
            );
    }
        if($data){
            $this->response([
                'status' => true,
                'message' => 'Data berhasil diambil',
                'data' => $data
            ], 200);
        }else{
            $this->response([
                'status' => false,
                'message' => 'Data tidak ditemukan',
                'data' => null
            ], 200);
        }
    }
}