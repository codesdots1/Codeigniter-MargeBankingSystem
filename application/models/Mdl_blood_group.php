<?php


class Mdl_blood_group extends DT_CI_Model
{

	public function __construct()
	{
		parent::__construct();
		// Your own constructor code

	}

	public function deleteRecord($bloodGroupId = '')
	{
		$tables = array('tbl_blood_group');
		$this->db->where_in('blood_group_id', $bloodGroupId);
		$this->db->delete($tables);
		$ids = is_array($bloodGroupId) ? implode(',', $bloodGroupId) : $bloodGroupId;
		$response = array();
		if ($this->db->affected_rows()) {
			$response['success'] = true;
			logActivity('Blood Group Deleted [GenderID: ' . $ids . ']', $this->data['userId'], 'BloodGroup');
		}
		return $response;
	}

	public function getData($bloodGroupId = '')
	{
		if($bloodGroupId != '') {
			$this->db->where('blood_group_id', $bloodGroupId);
		}
		$data = $this->db->get("tbl_blood_group");
		$query = $data->result_array();
		return $query;
	}

	function getBloodGroupDD($filterParameter = '',$page = 1,$bloodGroupIdActive ,$start = 0, $limit = 10)
	{
		if($page != 1){
			$start = ($page * $limit) - $limit;
		}

		$this->db->start_cache();
		$this->db->select('blood_group_id as id,blood_group_name as text');
		$this->db->from('tbl_blood_group');
		if ($filterParameter != '') {
			$this->db->like('blood_group_name', $filterParameter, 'both');
		}
		$this->db->or_where_in('blood_group_id',$bloodGroupIdActive);
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
