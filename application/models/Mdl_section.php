<?php


class Mdl_section extends DT_CI_Model
{

	public function __construct()
	{
		parent::__construct();
		// Your own constructor code

	}

	public function deleteRecord($sectionId = '')
	{
		$tables = array('tbl_section');
		$this->db->where_in('section_id', $sectionId);
		$this->db->delete($tables);
		$ids = is_array($sectionId) ? implode(',', $sectionId) : $sectionId;
		$response = array();
		if ($this->db->affected_rows()) {
			$response['success'] = true;
			logActivity('Section Deleted [SectionID: ' . $ids . ']', $this->data['userId'], 'Section');
		}
		return $response;
	}

	public function getData($sectionId = '')
	{
		if($sectionId != '') {
			$this->db->where('section_id', $sectionId);
		}
		$data = $this->db->get("tbl_section");
		$query = $data->result_array();
		return $query;
	}

	function getSectionDD($filterParameter = '',$page = 1,$sectionIdActive ,$start = 0, $limit = 10)
	{
		if($page != 1){
			$start = ($page * $limit) - $limit;
		}

		$this->db->start_cache();
		$this->db->select('section_id as id,section_name as text');
		$this->db->from('tbl_section');
		if ($filterParameter != '') {
			$this->db->like('section_name', $filterParameter, 'both');
		}
		$this->db->or_where_in('section_id',$sectionIdActive);
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
