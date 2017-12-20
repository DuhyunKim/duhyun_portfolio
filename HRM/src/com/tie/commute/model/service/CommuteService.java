package com.tie.commute.model.service;

import java.util.List;
import java.util.Map;

import com.tie.commute.model.AttendanceDto;

public interface CommuteService {

	List<AttendanceDto> commuteList(String empid);
	int commuteInsert(Map<String, String> map);
	int commuteUpdate(Map<String, String> map);
	int commutsSelect(Map<String, String> map);
}
