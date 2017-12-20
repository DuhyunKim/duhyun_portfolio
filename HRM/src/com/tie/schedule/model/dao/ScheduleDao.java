package com.tie.schedule.model.dao;

import java.util.List;
import java.util.Map;

import com.tie.schedule.model.ScheduleDto;

public interface ScheduleDao {

	List<ScheduleDto> scheduleList(int empId);
	Map<String, Integer> scheduleInsert(ScheduleDto scheduleDto);
	int scheduleUpdate(ScheduleDto scheduleDto);
	int scheduleDelete(Map<String, Integer> map);
}
