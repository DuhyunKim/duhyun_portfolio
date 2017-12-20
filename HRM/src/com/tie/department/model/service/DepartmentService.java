package com.tie.department.model.service;

import java.util.List;

import com.tie.department.model.DepartmentDto;

public interface DepartmentService {
	List<DepartmentDto> deptList(int pg, int deptId);
	int pageCount(String word);
	List<DepartmentDto> selectDept();
}
