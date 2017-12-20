package com.tie.work.model.dao;

import java.util.List;
import java.util.Map;

import com.tie.work.model.AblityDto;
import com.tie.work.model.BreakDownDto;
import com.tie.work.model.EducationDto;
import com.tie.work.model.OutComeDto;
import com.tie.work.model.PeriodicDto;
import com.tie.work.model.WorkDto;

public interface WorkDao {

	int workRegister(Map<String, Object> map);
	Map<String, List<Object>> workList(Map<String, String> map);
	int totalCountList(int empId);
	
	Map<String, String> commonFormList(int workSeq);
	List<BreakDownDto> breakDownDtoFormList(int workSeq);
	List<PeriodicDto> periodicDtoFormList(int workSeq);
	List<OutComeDto> outComeDtoFormList(int workSeq);
	List<AblityDto> ablityDtoFormList(int workSeq);
	List<EducationDto> educationDtoFormList(int workSeq);
	
	int workUpdate(List<WorkDto> list, int workSeq);
	int breakdownUpdate(List<BreakDownDto> list, int workSeq);
	int periodicUpdate(List<PeriodicDto> list, int workSeq);
	int outcomeUpdate(List<OutComeDto> list, int workSeq);
	int ablityUpdate(List<AblityDto> list, int workSeq);
	int educationUpdate(List<EducationDto> list, int workSeq);
	
	int workDelete(int workSeq);
	int breakdownDelete(Map<String, Integer> map);
	int periodicDelete(Map<String, Integer> map);
	int outcomeDelete(Map<String, Integer> map);
	int ablityDelete(int workSeq);
	int educationDelete(Map<String, Integer> map);
	
	int breakdownSize(int workSeq); 
	int periodicSize(int workSeq);
	int outcomeSize(int workSeq);
	int ablitySize(int workSeq);
	int educationSize(int workSeq);
	
	int breakdownInsert(List<BreakDownDto> list, int workSeq);
	int periodicInsert(List<PeriodicDto> list, int workSeq);
	int outcomeInsert(List<OutComeDto> list, int workSeq);
	int ablityInsert(List<AblityDto> list, int workSeq);
	int educationInsert(List<EducationDto> list, int workSeq);

}
