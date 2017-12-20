package com.tie.career.model.service;

import java.util.List;

import com.tie.career.model.CareerDto;
import com.tie.career.model.dao.CareerDaoImpl;

public class CareerServiceImpl implements CareerService {
	
	private static CareerService careerService;
	
	static {
		careerService = new CareerServiceImpl();
	}
	
	private CareerServiceImpl() {}
	
	public static CareerService getCareerService() {
		return careerService;
	}

	@Override
	public List<CareerDto> careerList(int currentPage, int empId) {
		return CareerDaoImpl.getCareerDao().careerList(currentPage, empId);
	}

	@Override
	public int delete(int seq) {
		return CareerDaoImpl.getCareerDao().delete(seq);
	}

	@Override
	public int update(CareerDto careerDto) {
		return CareerDaoImpl.getCareerDao().update(careerDto);
	}

	@Override
	public int insert(CareerDto careerDto) {
		return CareerDaoImpl.getCareerDao().insert(careerDto);
	}

	@Override
	public int totalCountList() {
		// TODO Auto-generated method stub
		return 0;
	}

}
