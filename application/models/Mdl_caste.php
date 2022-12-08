<?php


class Mdl_caste extends DT_CI_Model
{

	public function __construct()
	{
		parent::__construct();
		// Your own constructor code

	}

	public function deleteRecord($casteId = '')
	{
		$tables = array('tbl_caste');
		$this->db->where_in('caste_id', $casteId);
		$this->db->delete($tables);
		$ids = is_array($casteId) ? implode(',', $casteId) : $casteId;
		$response = array();
		if ($this->db->affected_rows()) {
			$response['success'] = true;
			logActivity('Caste Deleted [CasteID: ' . $ids . ']', $this->data['userId'], 'Caste');
		}
		return $response;
	}

	public function getData($casteId = '')
	{
		if($casteId != '') {
			$this->db->where('caste_id', $casteId);
		}
		$data = $this->db->get("tbl_caste");
		$query = $data->result_array();
		return $query;
	}

	function getCasteDD($filterParameter = '',$page = 1,$religionId,$casteIdActive ,$start = 0, $limit = 10)
	{
		if($page != 1){
			$start = ($page * $limit) - $limit;
		}

		$this->db->start_cache();
		$this->db->select('caste_id as id,caste_name as text');
		$this->db->from('tbl_caste');
		if ($filterParameter != '') {
			$this->db->like('caste_name', $filterParameter, 'both');
		}
		if($religionId != '') {
			$this->db->where("religion_id", $religionId);
		}
		$this->db->or_where_in('caste_id',$casteIdActive);
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

	public function checkExistCaste($casteId = '', $religionId = '', $casteName = ''){
		$this->db->select('count(tc.caste_name) as caste');
		$this->db->from('tbl_caste as tc');
		$this->db->join('tbl_religion as tr','tr.religion_id = tc.religion_id','left');
		$this->db->where('tr.religion_id', $religionId);
		if($casteId != ''){
			$this->db->where('tc.caste_id != ',$casteId);
		}
		$this->db->where('tc.caste_name',$casteName);
		$caste = $this->db->get()->row_array();
		return isset($caste['caste']) ? $caste['caste'] : 0;
	}
}
