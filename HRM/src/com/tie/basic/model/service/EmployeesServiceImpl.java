package com.tie.basic.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tie.basic.model.EmpFileDto;
import com.tie.basic.model.EmployeesDto;
import com.tie.basic.model.EmployeesDto1;
import com.tie.basic.model.dao.EmployeesDaoImpl;
import com.tie.util.Constance;

public class EmployeesServiceImpl implements EmployeesService {

		private static EmployeesServiceImpl employeesService;
		
		
		static{
			employeesService = new EmployeesServiceImpl();
		}
		public EmployeesServiceImpl(){} 
		
		public static EmployeesServiceImpl getEmployeeService() {
			return employeesService;
		}
		

		@Override
		public int idCheck(String id) {
			// TODO Auto-generated method stub
			return EmployeesDaoImpl.getEmployeesDao().idCheck(id);
		}

		@Override
		public List<EmployeesDto1> employeesList(Map<String, String> map) {
			return EmployeesDaoImpl.getEmployeesDao().employeesList(map);
		}

		@Override
		public int modfiy(EmployeesDto employeesDto,EmpFileDto empFileDto) {
			
			return EmployeesDaoImpl.getEmployeesDao().modfiy(employeesDto, empFileDto);
		}

		@Override
		public Map<String, Object> modifyInfo(int empId) {
			
			return EmployeesDaoImpl.getEmployeesDao().modifyInfo(empId);
		}

		@Override
		public int insert(EmployeesDto employeesDto,EmpFileDto empFileDto) {
			// TODO Auto-generated method stub
			return EmployeesDaoImpl.getEmployeesDao().insert(employeesDto,empFileDto);
		}

		@Override
		public EmpFileDto delete(String id) {
			// TODO Auto-generated method stub
			return EmployeesDaoImpl.getEmployeesDao().delete(id);
		}

		@Override
		public EmpFileDto empFileDto(int empId) {
			// TODO Auto-generated method stub
			return EmployeesDaoImpl.getEmployeesDao().empFileDto(empId);
		}

		@Override
		public int totalCountList() {
			// TODO Auto-generated method stub
			return EmployeesDaoImpl.getEmployeesDao().totalCountList();
		}

		@Override
		public List<Map<String, String>> insertInfo(String param) {
			// TODO Auto-generated method stub
			return EmployeesDaoImpl.getEmployeesDao().insertInfo(param);
		}
		
		public EmployeesDto login(String id, String pass) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("userid", id);
			map.put("userpass", pass);
			return EmployeesDaoImpl.getEmployeesDao().login(map);
		}

		@Override
		public String searchDept(int deptId) {
			return EmployeesDaoImpl.getEmployeesDao().searchDept(deptId);
		}

		@Override
		public String searchJob(int jobId) {
			return EmployeesDaoImpl.getEmployeesDao().searchJob(jobId);
		}
	
		
		
		
}
