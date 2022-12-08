<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Mdl_state extends DT_CI_Model {
    public function __construct()
    {
        parent::__construct();
        // Your own constructor code

    }


    public function deleteRecord($stateId)
    {
        $tables = array('tbl_state');
        $this->db->where_in('state_id',$stateId);
        $this->db->delete($tables);

        $ids = is_array($stateId) ? implode(',',$stateId) : $stateId;

        if ($this->db->affected_rows()) {

            logActivity('State Deleted [StateID: ' . $ids . ']',$this->data['userId'],'State');

            return true;
        }
        return false;
    }

    public function getData($stateId = '')
    {
        if($stateId != ''){
            $this->db->where('state_id', $stateId);
        }
        $data = $this->db->get("tbl_state");
        $query = $data->result_array();
        return $query;
    }



    function getStateDD($filterParameter = '',$page, $countryId ,$stateIdActive,$start = 0, $limit = 10)
    {
        if($page != 1){
            $start = ($page * $limit) - $limit;
        }

        $this->db->start_cache();
        $this->db->select('state_id as id,state_name as text');
        $this->db->from('tbl_state');
        if ($filterParameter != '') {
            $this->db->like('state_name', $filterParameter, 'both');
        }
        if($countryId != '') {
            $this->db->where("country_id", $countryId);
        }
        $this->db->where('is_active',1);
        $this->db->or_where('state_id',$stateIdActive);
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
	public function getStateListing($data = ''){
		$limit = DATA_LIMIT;
		$this->db->select("s.state_id,s.state_name");
		$this->db->from("tbl_state as s");
		if (isset($data['search']) && $data['search'] != '') {
			$this->db->like('s.state_name', $data['search'],'both');
		}
		if (isset($data['start'])) {
			$this->db->limit($limit, $data['start'] * $limit);
		}
		$query = $this->db->get()->result_array();
		return $query;
	}

    public function checkExistState($stateId = '', $countryId = '', $stateName = ''){
        $this->db->select('count(ts.state_name) as state');
        $this->db->from('tbl_state as ts');
        $this->db->join('tbl_country as tc','tc.country_id = ts.country_id','left');
        $this->db->where('tc.country_id', $countryId);
        if($stateId != ''){
            $this->db->where('ts.state_id != ',$stateId);
        }
        $this->db->where('ts.state_name',$stateName);
        $state = $this->db->get()->row_array();
        return isset($state['state']) ? $state['state'] : 0;
    }

}
?>

