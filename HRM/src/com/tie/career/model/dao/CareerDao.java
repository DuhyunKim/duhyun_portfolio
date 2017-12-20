package com.tie.career.model.dao;

import java.util.List;
import java.util.Map;

import com.tie.career.model.CareerDto;

public interface CareerDao {
	List<CareerDto> careerList(int currentPage, int empId);
	int delete(int seq);
	int update(CareerDto careerDto);
	int insert(CareerDto careerDto);
	int totalCountList();
}
