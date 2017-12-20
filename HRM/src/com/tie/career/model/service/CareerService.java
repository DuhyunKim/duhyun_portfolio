package com.tie.career.model.service;

import java.util.List;
import java.util.Map;

import com.tie.career.model.CareerDto;

public interface CareerService {
	List<CareerDto> careerList(int currentPage, int empId);
	int delete(int seq);
	int update(CareerDto careerDto);
	int insert(CareerDto careerDto);
	int totalCountList();
}
