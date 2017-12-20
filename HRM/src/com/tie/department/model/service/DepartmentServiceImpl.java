package com.tie.department.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tie.department.model.DepartmentDto;
import com.tie.department.model.dao.DepartmentDaoImpl;
import com.tie.util.Constance;

public class DepartmentServiceImpl implements DepartmentService {
	private static DepartmentService departmentService;
	
	static{
		departmentService = new DepartmentServiceImpl();
	}
	
	private DepartmentServiceImpl(){}

	public static DepartmentService getDepartmentService() {
		return departmentService;
	}

	@Override
	public List<DepartmentDto> deptList(int pg, int deptId) {
		Map<String, String> map = new HashMap<String, String>();
		int end = pg * Constance.LIST_SIZE;
		int start = end - Constance.LIST_SIZE;
		map.put("start", start+"");
		map.put("end", end+"");
		map.put("deptId", deptId+"");
		return DepartmentDaoImpl.getDepartmentDao().deptList(map);
	}

	@Override
	public int pageCount(String word) {
		return DepartmentDaoImpl.getDepartmentDao().pageCount(word);
	}

	@Override
	public List<DepartmentDto> selectDept() {
		return DepartmentDaoImpl.getDepartmentDao().selectDept();
	}

}
