<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Mdl_education extends DT_CI_Model
{

	public function __construct()
	{
		parent::__construct();
		// Your own constructor code

	}

	public function deleteRecord($educationId = '')
	{
		$tables = array('tbl_education');
		$this->db->where_in('education_id', $educationId);
		$this->db->delete($tables);
		$ids = is_array($educationId) ? implode(',', $educationId) : $educationId;
		$response = array();
		if ($this->db->affected_rows()) {
			$response['success'] = true;
			logActivity('Education Deleted [GenderID: ' . $ids . ']', $this->data['userId'], 'Education');
		}
		return $response;
	}

	public function getData($educationId = '')
	{
		if($educationId != '') {
			$this->db->where('education_id', $educationId);
		}
		$data = $this->db->get("tbl_education");
		$query = $data->result_array();
		return $query;
	}

	function getEducationDD($filterParameter = '',$page = 1,$educationIdActive ,$start = 0, $limit = 10)
	{
		if($page != 1){
			$start = ($page * $limit) - $limit;
		}

		$this->db->start_cache();
		$this->db->select('education_id as id,education_name as text');
		$this->db->from('tbl_education');
		if ($filterParameter != '') {
			$this->db->like('education_name', $filterParameter, 'both');
		}
		$this->db->or_where_in('education_id',$educationIdActive);
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
