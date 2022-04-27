<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hasil Survei</title>
</head>
<body>
<?php
header("Content-type: application/vnd-ms-excel");
header("Content-Disposition: attachment; filename=Hasil-Survei.xls");
?>
<?php 
$user = '';
$user .= '<table width="100%">';
$user .= '<tr>';
$user .= '<td colspan="3" align="center"><h3>Hasil Survei</h3></td>';
$user .= '</tr>';
$user .= '<tr>';
$user .= '<td>Nama : </td>';
$user .= '<td>'.$jawaban[0]->nama_surveyor.'</td>';
$user .= '</tr>';
$user .= '<tr>';
$user .= '<td>Email : </td>';
$user .= '<td>'.$jawaban[0]->email_surveyor.'</td>';
$user .= '</tr>';
$user .= '<tr>';
$user .= '<td>Standar Pelayanan : </td>';
$user .= '<td>'.$jawaban[0]->standar_pelayanan.'</td>';
$user .= '</tr>';
$user .= '<tr>';
$user .= '</tr>';
$user .= '</table>';
echo $user;
?>
<?php
$html = '';
$html .= '<table border="1px" style="width:100%;font-size:10px;" cellspacing="0">
      <thead>
        <tr style="font-weight:bold">
          <th align="center">No</th>
          <th align="center">Pertanyaan</th>
          <th align="center">Jawaban</th>
        </tr>
      </thead>
      <tbody>';
      $no=1;
      foreach ($pertanyaan as $row) {
          $html .= '<tr nobr="true">';
          $html .= '<td align="center">' . $no++ . '</td>';
          $html .= '<td>' . $row->pertanyaan . '</td>';
          $cekJawaban = $this->db->query("SELECT * FROM survei_jawaban WHERE id_detail_survei = '$id' AND id_pertanyaan = '$row->id_pertanyaan'")->row();
          if($no == '9'){
              if($cekJawaban->jawaban == 'Ya'){
                $html .= '<td align="center">'.$cekJawaban->jawaban.'('.$cekJawaban->tambahan_keterangan.')</td>';
              }else{
                $html .= '<td align="center">'.$cekJawaban->jawaban.'</td>';
              }
          }else{
            $html .= '<td align="center">'.$cekJawaban->jawaban.'</td>';
        }
          
          $html .= '</tr>';
        }     
$html.='</tbody>';
$html.='</table><br>';
echo $html;
?>
</body>
</html>