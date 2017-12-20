package com.tie.department.model.dao;

import java.util.List;
import java.util.Map;

import com.tie.department.model.DepartmentDto;

public interface DepartmentDao {

	List<DepartmentDto> deptList(Map<String, String> map);
	int pageCount(String word);
	List<DepartmentDto> selectDept();

}
