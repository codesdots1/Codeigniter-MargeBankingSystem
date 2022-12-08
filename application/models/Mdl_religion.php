<?php


class Mdl_religion extends DT_CI_Model
{
	public function __construct()
	{
		parent::__construct();
		// Your own constructor code

	}

	public function deleteRecord($religionId = '')
	{
		$tables = array('tbl_religion');
		$this->db->where_in('religion_id', $religionId);
		$this->db->delete($tables);
		$ids = is_array($religionId) ? implode(',', $religionId) : $religionId;
		$response = array();
		if ($this->db->affected_rows()) {
			$response['success'] = true;
			logActivity('Religion Deleted [GenderID: ' . $ids . ']', $this->data['userId'], 'Religion');
		}
		return $response;
	}

	public function getData($religionId = '')
	{
		if($religionId != '') {
			$this->db->where('religion_id', $religionId);
		}
		$data = $this->db->get("tbl_religion");
		$query = $data->result_array();
		return $query;
	}

	function getReligionDD($filterParameter = '',$page = 1,$religionIdActive ,$start = 0, $limit = 10)
	{
		if($page != 1){
			$start = ($page * $limit) - $limit;
		}

		$this->db->start_cache();
		$this->db->select('religion_id as id,religion_name as text');
		$this->db->from('tbl_religion');
		if ($filterParameter != '') {
			$this->db->like('religion_name', $filterParameter, 'both');
		}
		$this->db->or_where_in('religion_id',$religionIdActive);
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
