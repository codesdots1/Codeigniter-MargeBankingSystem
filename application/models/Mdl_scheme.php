<?php


class Mdl_scheme extends DT_CI_Model
{

	public function __construct()
	{
		parent::__construct();
		// Your own constructor code

	}

	public function deleteRecord($schemeId = '')
	{
		$tables = array('tbl_scheme');
		$this->db->where_in('scheme_id', $schemeId);
		$this->db->delete($tables);
		$ids = is_array($schemeId) ? implode(',', $schemeId) : $schemeId;
		$response = array();
		if ($this->db->affected_rows()) {
			$response['success'] = true;
			logActivity('Scheme Deleted [SectionID: ' . $ids . ']', $this->data['userId'], 'Scheme');
		}
		return $response;
	}

	public function getData($schemeId = '')
	{
		if($schemeId != '') {
			$this->db->where('scheme_id', $schemeId);
		}
		$data = $this->db->get("tbl_scheme");
		$query = $data->result_array();
		return $query;
	}

	function getSchemeDD($filterParameter = '',$page = 1,$schemeIdActive ,$start = 0, $limit = 10)
	{
		if($page != 1){
			$start = ($page * $limit) - $limit;
		}

		$this->db->start_cache();
		$this->db->select('scheme_id as id,scheme_name as text');
		$this->db->from('tbl_scheme');
		if ($filterParameter != '') {
			$this->db->like('scheme_name', $filterParameter, 'both');
		}
		$this->db->or_where_in('scheme_id',$schemeIdActive);
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
