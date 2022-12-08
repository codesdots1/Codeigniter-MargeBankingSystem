<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mdl_marital_status extends DT_CI_Model
{

	public function __construct()
	{
		parent::__construct();
		// Your own constructor code

	}

	public function deleteRecord($maritalStatusId = '')
	{
		$tables = array('tbl_marital_status');
		$this->db->where_in('marital_status_id', $maritalStatusId);
		$this->db->delete($tables);
		$ids = is_array($maritalStatusId) ? implode(',', $maritalStatusId) : $maritalStatusId;
		$response = array();
		if ($this->db->affected_rows()) {
			$response['success'] = true;
			logActivity('Marital Status Deleted [GenderID: ' . $ids . ']', $this->data['userId'], 'MaritalStatus');
		}
		return $response;
	}

	public function getData($maritalStatusId = '')
	{
		if($maritalStatusId != '') {
			$this->db->where('marital_status_id', $maritalStatusId);
		}
		$data = $this->db->get("tbl_marital_status");
		$query = $data->result_array();
		return $query;
	}

	function getMaritalStatusDD($filterParameter = '',$page = 1,$maritalStatusIdActive ,$start = 0, $limit = 10)
	{
		if($page != 1){
			$start = ($page * $limit) - $limit;
		}

		$this->db->start_cache();
		$this->db->select('marital_status_id as id,marital_status_name as text');
		$this->db->from('tbl_gender');
		if ($filterParameter != '') {
			$this->db->like('marital_status_name', $filterParameter, 'both');
		}
		$this->db->or_where_in('marital_status_id',$maritalStatusIdActive);
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
