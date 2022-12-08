<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mdl_gender extends DT_CI_Model
{
	public function __construct()
	{
		parent::__construct();
		// Your own constructor code

	}

	public function deleteRecord($genderId = '')
	{
		$tables = array('tbl_blood_group');
		$this->db->where_in('blood_group_id', $genderId);
		$this->db->delete($tables);
		$ids = is_array($genderId) ? implode(',', $genderId) : $genderId;
		$response = array();
		if ($this->db->affected_rows()) {
			$response['success'] = true;
			logActivity('Gender Deleted [GenderID: ' . $ids . ']', $this->data['userId'], 'Gender');
		}
		return $response;
	}

	public function getData($genderId = '')
	{
		if($genderId != '') {
			$this->db->where('gender_id', $genderId);
		}
		$data = $this->db->get("tbl_gender");
		$query = $data->result_array();
		return $query;
	}

	function getGenderDD($filterParameter = '',$page = 1,$genderIdActive ,$start = 0, $limit = 10)
	{
		if($page != 1){
			$start = ($page * $limit) - $limit;
		}

		$this->db->start_cache();
		$this->db->select('gender_id as id,gender_name as text');
		$this->db->from('tbl_gender');
		if ($filterParameter != '') {
			$this->db->like('gender_name', $filterParameter, 'both');
		}
		$this->db->or_where_in('gender_id',$genderIdActive);
		$this->db->stop_cache();
		$totalRows = $this->db->count_all_results();

		$this->db->limit($limit, $start);

		$query = $this->db->get();

		$result['result'] = $query->result_array();
		$result['totalRows'] = $totalRows;
		$result['page'] = $page;
		$this->db->flush_cache();

		return json_encode($result);
	}
}
