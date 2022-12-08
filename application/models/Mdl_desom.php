<?php


class Mdl_desom extends DT_CI_Model
{

	public function __construct()
	{
		parent::__construct();
		// Your own constructor code

	}

	public function deleteRecord($desomId = '')
	{
		$tables = array('tbl_desom');
		$this->db->where_in('desom_id', $desomId);
		$this->db->delete($tables);
		$ids = is_array($desomId) ? implode(',', $desomId) : $desomId;
		$response = array();
		if ($this->db->affected_rows()) {
			$response['success'] = true;
			logActivity('Desom Deleted [DesomID: ' . $ids . ']', $this->data['userId'], 'Desom');
		}
		return $response;
	}

	public function getData($desomId = '')
	{
		if($desomId != '') {
			$this->db->where('desom_id', $desomId);
		}
		$data = $this->db->get("tbl_desom");
		$query = $data->result_array();
		return $query;
	}

	function getDesomDD($filterParameter = '',$page = 1,$desomIdActive ,$start = 0, $limit = 10)
	{
		if($page != 1){
			$start = ($page * $limit) - $limit;
		}

		$this->db->start_cache();
		$this->db->select('desom_id as id,desom_name as text');
		$this->db->from('tbl_desom');
		if ($filterParameter != '') {
			$this->db->like('desom_name', $filterParameter, 'both');
		}
		$this->db->or_where_in('desom_id',$desomIdActive);
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
