<?php


class Mdl_cost_center extends DT_CI_Model
{

	public function __construct()
	{
		parent::__construct();
		// Your own constructor code

	}

	public function deleteRecord($costCenterId = '')
	{
		$tables = array('tbl_cost_center');
		$this->db->where_in('cost_center_id', $costCenterId);
		$this->db->delete($tables);
		$ids = is_array($costCenterId) ? implode(',', $costCenterId) : $costCenterId;
		$response = array();
		if ($this->db->affected_rows()) {
			$response['success'] = true;
			logActivity('Cost Center Deleted [CostCenterID: ' . $ids . ']', $this->data['userId'], 'CostCenter');
		}
		return $response;
	}

	public function getData($costCenterId = '')
	{
		if($costCenterId != '') {
			$this->db->where('cost_center_id', $costCenterId);
		}
		$data = $this->db->get("tbl_cost_center");
		$query = $data->result_array();
		return $query;
	}

	function getCostCenterDD($filterParameter = '',$page = 1,$costCenterIdActive ,$start = 0, $limit = 10)
	{
		if($page != 1){
			$start = ($page * $limit) - $limit;
		}

		$this->db->start_cache();
		$this->db->select('cost_center_id as id,cost_center_name as text');
		$this->db->from('tbl_cost_center');
		if ($filterParameter != '') {
			$this->db->like('cost_center_name', $filterParameter, 'both');
		}
		$this->db->or_where_in('cost_center_id',$costCenterIdActive);
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
