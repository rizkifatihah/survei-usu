<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class GeneralModel extends CI_Model
{
  function __construct()
  {
    parent::__construct();
  }

  function get_general($table)
  {
    $query = $this->db->get($table);
    return $query->result();
  }

  function get_general_group_by($table,$group_by)
  {
    $query = $this->db->query("SELECT * FROM $table GROUP BY $group_by");
    return $query->result();
  }

  function get_by_id_general_group_by($table,$id,$val,$group_by)
  {
    $query = $this->db->query("SELECT * FROM $table WHERE $id = $val GROUP BY $group_by");
    return $query->result();
  }

  function get_by_id_general_limit($table,$id,$val)
  {
    $query = $this->db->query("SELECT * FROM $table WHERE $id = $val LIMIT 1");
    return $query->result();
  }

  function get_general_order_by($table,$by,$order)
  {
    return $query = $this->db->query("SELECT * FROM $table ORDER BY $by $order")->result();
  }

  function get_by_from_end_date($table,$from,$end,$col){
    return $this->db->query("SELECT * FROM $table WHERE DATe_FORMAT($col,'%Y-%m-%d') >= '$from' and DATe_FORMAT($col,'%Y-%m-%d') <= '$end'")->result();
  }

  function get_by_from_end_date_by_id($table, $from, $end, $col, $id, $val)
  {
    return $this->db->query("SELECT * FROM $table WHERE 
    DATe_FORMAT($col,'%Y-%m-%d') >= '$from' and DATe_FORMAT($col,'%Y-%m-%d') <= '$end' and $id = '$val'")->result();
  }

  function get_by_id_general_order_by($table,$id,$val,$by,$order)
  {
    return $query = $this->db->query("SELECT * FROM $table WHERE $id = $val ORDER BY $by $order")->result();
  }

  function truncate_general($table)
  {
    return $this->db->query("TRUNCATE TABLE $table");
  }

  function count_general($table)
  {
    return $this->db->query("SELECT COUNT(*) as jumlah FROM $table")->row();
  }

  function count_by_id_general($table, $id, $val)
  {
    return $this->db->query("SELECT COUNT(*) as jumlah FROM $table WHERE $id = '$val'")->row();
  }


  function count_by_multi_id_general($table, $id, $val, $id2, $val2)
  {
    return $this->db->query("SELECT COUNT(*) as jumlah FROM $table WHERE $id = '$val' and $id2 = '$val2'")->row();
  }

  function get_by_id_general($table, $id, $val)
  {
    $query = $this->db->where($id, $val)->get($table);
    return $query->result();
  }

  function get_by_multi_id_general($table, $id, $val, $id2='', $val2='')
  {
    $this->db->where($id, $val);
    if (!empty($id2) && !empty($val2)) {
      $this->db->where($id2, $val2);
    }
    return $this->db->get($table)->result();
  }

    function get_by_triple_id_general($table, $id, $val, $id2='', $val2='', $id3='', $val3='')
  {
    $this->db->where($id, $val);
    if (!empty($id2) && !empty($val2)) {
      $this->db->where($id2, $val2);
    }
    if (!empty($id3) && !empty($val3)) {
      $this->db->where($id3, $val3);
    }
    return $this->db->get($table)->result();
  }

  function get_like_general($table, $id, $val)
  {
    $query = $this->db->query("SELECT * FROM $table WHERE $id LIKE '%$val%'");
    return $query->result();
  }

  function get_like_multi_id_general($table, $id, $val, $id2, $val2)
  {
    $query = $this->db->query("SELECT * FROM $table WHERE $id LIKE '%$val%' and $id2 = '$val2'");
    return $query->result();
  }

  function create_general($table, $data)
  {
    return $this->db->insert($table, $data);
  }

  function update_general($table, $id, $val, $data)
  {
    $this->db->where($id, $val);
    return $this->db->update($table, $data);
  }
  function delete_general($table, $id, $val)
  {
    $this->db->where($id, $val);
    return $this->db->delete($table);
  }

    function delete_multi_id_general($table, $id, $val, $id2, $val2)
  {
    $this->db->where($id, $val);
    $this->db->where($id2, $val2);
    return $this->db->delete($table);
  }

  function limit_general($table, $limit)
  {
    return $this->db->query("SELECT * FROM $table LIMIT $limit")->result();
  }

  function limit_general_order_by($table, $order_by, $order ,$limit)
  {
    return $this->db->query("SELECT * FROM $table ORDER BY $order_by $order LIMIT $limit")->result();
  }

  function limit_by_id_general_order_by($table, $id, $val, $order_by, $order ,$limit)
  {
    return $this->db->query("SELECT * FROM $table WHERE $id = '$val' ORDER BY $order_by $order LIMIT $limit")->result();
  }

  function paginate_general($table,$limit,$start){
    return $this->db->get($table, $limit, $start)->result();
  }

  function paginate_order_by_general($table,$order_by,$order_type,$limit,$start){
    if (!empty($order_by) && !empty($order_type)) {
      $this->db->order_by($order_by, $order_type);
    }
    return $this->db->get($table, $limit, $start)->result();
  }

  function paginate_by_id_general($table,$id,$val,$limit,$start)
  {
    $this->db->where($id,$val);
    return $this->db->get($table, $limit, $start)->result();
  }

  function paginate_by_multi_id_general($table, $id, $val, $id2='', $val2='', $order_by='', $order_type, $limit, $start)
  {
    $this->db->where($id, $val);
    if (!empty($id2) && !empty($val2)) {
      $this->db->where($id2, $val2);
    }
    if (!empty($order_by) && !empty($order_type)) {
      $this->db->order_by($order_by, $order_type);
    }
    return $this->db->get($table, $limit, $start)->result();
  }

  function paginate_by_like_general($table, $id, $val, $limit, $start)
  {
    $this->db->like($id, $val);
    return $this->db->get($table, $limit, $start)->result();
  }

  function getRandomPostLimit($table,$id,$val,$limit){
    return $this->db->query("SELECT * FROM $table WHERE $id != '$val' ORDER BY RAND() LIMIT $limit")->result();
  }

}
