<?php


class Mdl_occupation extends DT_CI_Model
{

	public function __construct()
	{
		parent::__construct();
		// Your own constructor code

	}

	public function deleteRecord($occupationId = '')
	{
		$tables = array('tbl_occupation');
		$this->db->where_in('occupation_id', $occupationId);
		$this->db->delete($tables);
		$ids = is_array($occupationId) ? implode(',', $occupationId) : $occupationId;
		$response = array();
		if ($this->db->affected_rows()) {
			$response['success'] = true;
			logActivity('Occupation Deleted [GenderID: ' . $ids . ']', $this->data['userId'], 'Occupation');
		}
		return $response;
	}

	public function getData($occupationId = '')
	{
		if($occupationId != '') {
			$this->db->where('occupation_id', $occupationId);
		}
		$data = $this->db->get("tbl_occupation");
		$query = $data->result_array();
		return $query;
	}

	function getOccupationDD($filterParameter = '',$page = 1,$occupationIdActive ,$start = 0, $limit = 10)
	{
		if($page != 1){
			$start = ($page * $limit) - $limit;
		}

		$this->db->start_cache();
		$this->db->select('occupation_id as id,occupation_name as text');
		$this->db->from('tbl_occupation');
		if ($filterParameter != '') {
			$this->db->like('occupation_name', $filterParameter, 'both');
		}
		$this->db->or_where_in('occupation_id',$occupationIdActive);
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
