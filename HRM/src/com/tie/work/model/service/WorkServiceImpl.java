package com.tie.work.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tie.work.model.AblityDto;
import com.tie.work.model.BreakDownDto;
import com.tie.work.model.EducationDto;
import com.tie.work.model.OutComeDto;
import com.tie.work.model.PeriodicDto;
import com.tie.work.model.WorkDto;
import com.tie.work.model.dao.WorkDaoImpl;

public class WorkServiceImpl implements WorkService{

	private static WorkService workService;

	static {
		workService = new WorkServiceImpl();
	}

	private WorkServiceImpl() {}


	public static WorkService getWorkService() {
		return workService;
	}

	@Override
	public Map<String, List<Object>> workList(Map<String, String> map) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().workList(map);
	}


	@Override
	public int workRegister(Map<String, Object> map) {
		// TODO Auto-generated method stub

		return WorkDaoImpl.getWorkDao().workRegister(map);
	}

	@Override
	public int totalCountList(int empId) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().totalCountList(empId);
	}


	@Override
	public Map<String, String> commonFormList(int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().commonFormList(workSeq);
	}


	@Override
	public List<BreakDownDto> breakDownDtoFormList(int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().breakDownDtoFormList(workSeq);
	}


	@Override
	public List<PeriodicDto> periodicDtoFormList(int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().periodicDtoFormList(workSeq);
	}


	@Override
	public List<OutComeDto> outComeDtoFormList(int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().outComeDtoFormList(workSeq);
	}


	@Override
	public List<AblityDto> ablityDtoFormList(int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().ablityDtoFormList(workSeq);
	}


	@Override
	public List<EducationDto> educationDtoFormList(int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().educationDtoFormList(workSeq);
	}


	@Override
	public int workUpdate(List<WorkDto> list, int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().workUpdate(list, workSeq);
	}


	@Override
	public int periodicUpdate(List<PeriodicDto> list,int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().periodicUpdate(list, workSeq);
	}


	@Override
	public int ablityUpdate(List<AblityDto> list, int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().ablityUpdate(list, workSeq);
	}


	@Override
	public int educationUpdate(List<EducationDto> list, int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().educationUpdate(list, workSeq);
	}


	@Override
	public int outcomeUpdate(List<OutComeDto> list, int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().outcomeUpdate(list, workSeq);
	}


	@Override
	public int breakdownUpdate(List<BreakDownDto> list, int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().breakdownUpdate(list, workSeq);
	}


	@Override
	public int workDelete(int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().workDelete(workSeq);
	}


	@Override
	public int breakdownDelete(int workSeq, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("workSeq", workSeq);
		map.put("start", start);
		map.put("end", end);
		return WorkDaoImpl.getWorkDao().breakdownDelete(map);
	}


	@Override
	public int periodicDelete(int workSeq, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("workSeq", workSeq);
		map.put("start", start);
		map.put("end", end);
		return WorkDaoImpl.getWorkDao().periodicDelete(map);
	}


	@Override
	public int outcomeDelete(int workSeq, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("workSeq", workSeq);
		map.put("start", start);
		map.put("end", end);
		return WorkDaoImpl.getWorkDao().outcomeDelete(map);
	}


	@Override
	public int ablityDelete(int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().ablityDelete(workSeq);
	}


	@Override
	public int educationDelete(int workSeq, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("workSeq", workSeq);
		map.put("start", start);
		map.put("end", end);
		return WorkDaoImpl.getWorkDao().educationDelete(map);
	}


	@Override
	public int breakdownSize(int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().breakdownSize(workSeq);
	}


	@Override
	public int periodicSize(int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().periodicSize(workSeq);
	}


	@Override
	public int outcomeSize(int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().outcomeSize(workSeq);
	}

	@Override
	public int ablitySize(int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().ablitySize(workSeq);
	}	
	
	@Override
	public int educationSize(int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().educationSize(workSeq);
	}

	@Override
	public int breakdownInsert(List<BreakDownDto> list, int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().breakdownInsert(list, workSeq);
	}


	@Override
	public int periodicInsert(List<PeriodicDto> list, int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().periodicInsert(list, workSeq);
	}


	@Override
	public int outcomeInsert(List<OutComeDto> list, int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().outcomeInsert(list, workSeq);
	}


	@Override
	public int ablityInsert(List<AblityDto> list, int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().ablityInsert(list, workSeq);
	}


	@Override
	public int educationInsert(List<EducationDto> list, int workSeq) {
		// TODO Auto-generated method stub
		return WorkDaoImpl.getWorkDao().educationInsert(list, workSeq);
	}
}
