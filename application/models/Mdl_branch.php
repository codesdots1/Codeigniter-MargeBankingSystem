<?php


class Mdl_branch extends DT_CI_Model
{

	public function __construct()
	{
		parent::__construct();
		// Your own constructor code

	}

	public function deleteRecord($branchId = '')
	{
		$tables = array('tbl_branch');
		$this->db->where_in('branch_id', $branchId);
		$this->db->delete($tables);
		$ids = is_array($branchId) ? implode(',', $branchId) : $branchId;
		$response = array();
		if ($this->db->affected_rows()) {
			$response['success'] = true;
			logActivity('Branch Deleted [GenderID: ' . $ids . ']', $this->data['userId'], 'Branch');
		}
		return $response;
	}

	public function getData($branchId = '')
	{
		if($branchId != '') {
			$this->db->where('branch_id', $branchId);
		}
		$data = $this->db->get("tbl_branch");
		$query = $data->result_array();
		return $query;
	}

	function getEducationDD($filterParameter = '',$page = 1,$branchIdActive ,$start = 0, $limit = 10)
	{
		if($page != 1){
			$start = ($page * $limit) - $limit;
		}

		$this->db->start_cache();
		$this->db->select('branch_id as id,branch_name as text');
		$this->db->from('tbl_branch');
		if ($filterParameter != '') {
			$this->db->like('branch_name', $filterParameter, 'both');
		}
		$this->db->or_where_in('branch_id',$branchIdActive);
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
