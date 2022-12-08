<?php


class Mdl_amsom extends DT_CI_Model
{

	public function __construct()
	{
		parent::__construct();
		// Your own constructor code

	}

	public function deleteRecord($amsomId = '')
	{
		$tables = array('tbl_amsom');
		$this->db->where_in('amsom_id', $amsomId);
		$this->db->delete($tables);
		$ids = is_array($amsomId) ? implode(',', $amsomId) : $amsomId;
		$response = array();
		if ($this->db->affected_rows()) {
			$response['success'] = true;
			logActivity('Amosm Deleted [AmosmID: ' . $ids . ']', $this->data['userId'], 'Amosm');
		}
		return $response;
	}

	public function getData($amsomId = '')
	{
		if($amsomId != '') {
			$this->db->where('amsom_id', $amsomId);
		}
		$data = $this->db->get("tbl_amsom");
		$query = $data->result_array();
		return $query;
	}

	function getAmsomDD($filterParameter = '',$page = 1,$amsomIdActive ,$start = 0, $limit = 10)
	{
		if($page != 1){
			$start = ($page * $limit) - $limit;
		}

		$this->db->start_cache();
		$this->db->select('amsom_id as id,amsom_name as text');
		$this->db->from('tbl_amsom');
		if ($filterParameter != '') {
			$this->db->like('amsom_name', $filterParameter, 'both');
		}
		$this->db->or_where_in('amsom_id',$amsomIdActive);
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
