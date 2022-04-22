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
$html = '';
$html .= '<table border="1px" style="width:100%;font-size:10px;" cellspacing="0">
      <thead>
        <tr style="font-weight:bold">
          <th align="center">No</th>';
          foreach ($pertanyaan as $row) {
              $html .= '<th align="center">' . $row->pertanyaan . '</th>';
          }
          '<th align="center">Jawaban</th>
        </tr>
      </thead>
      <tbody>';
      $no=1;
      $cekDetailSurvei = $this->db->query("SELECT * FROM survei_detail_survei WHERE id_survei = '$id' AND status = 'Digunakan'")->result();
      foreach($cekDetailSurvei as $row){
        $html .= '<tr nobr="true">';
        $html .= '<td align="center">' . $no++ . '</td>';
        foreach($pertanyaan as $row2){
          $cekJawaban = $this->db->query("SELECT * FROM survei_jawaban WHERE id_detail_survei = '$row->id_detail_survei' AND id_pertanyaan = '$row2->id_pertanyaan'")->row();
          if($row2->id_pertanyaan == '9'){
            if($cekJawaban->jawaban == 'YA'){
              $html .= '<td align="center">'.$cekJawaban->jawaban.'('.$cekJawaban->tambahan_keterangan.')</td>';
            }else{
              $html .= '<td align="center">'.$cekJawaban->jawaban.'</td>';
            }
          }else{
            $html .= '<td align="center">'.$cekJawaban->jawaban.'</td>';
          }
        }
        $html .= '</tr>';
      }
$html.='</tbody>';
$html.='</table><br>';
echo $html;
?>
</body>
</html>