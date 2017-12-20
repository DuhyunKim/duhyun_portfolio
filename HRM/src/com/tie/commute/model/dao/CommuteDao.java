package com.tie.commute.model.dao;

import java.util.List;
import java.util.Map;

import com.tie.commute.model.AttendanceDto;

public interface CommuteDao {
	
	List<AttendanceDto> commuteList(String empid);
	int commuteInsert(Map<String, String> map);
	int commuteUpdate(Map<String, String> map);
	int commutsSelect(Map<String, String> map);

}
