package com.tie.salary.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tie.basic.model.EmployeesDto;
import com.tie.department.model.DepartmentDto;
import com.tie.jobs.model.JobsDto;
import com.tie.salary.model.SalaryDto;
import com.tie.util.DB.DBClose;
import com.tie.util.DB.DBConnection;

public class SalaryDaoImpl implements SalaryDao{
	
	private static SalaryDao salaryDao;
	
	static{
		salaryDao = new SalaryDaoImpl();
	}
	
	private SalaryDaoImpl(){}

	
	public static SalaryDao getSalaryDao() {
		return salaryDao;
	}


	@Override
	public Map<String, List<Object>> salaryList(Map<String, String> map) {
		// TODO Auto-generated method stub
		Map<String, List<Object>> mapList = new HashMap<String, List<Object>>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;

		try {

			conn = DBConnection.makeConnection();
			System.out.println("연결");
			
			int currentPage = Integer.parseInt(map.get("currentPage"));
			String key = map.get("key");
			String word = map.get("word");
			StringBuffer sb = new StringBuffer();
			sb.append("select r, empid, empname, deptname, jobname, salarymoney, salaryincentive, salarybonus, salarybasis, salaryadd\n");
			sb.append("from (select rownum r, empid, empname, deptname, jobname, salarymoney, salaryincentive, salarybonus, salarybasis, salaryadd\n");
			sb.append("from (select b.empid, b.empname, d.deptname, j.jobname, s.salarymoney, s.salaryincentive, s.salarybonus, s.salarybasis, s.salaryadd\n");
			sb.append("from basic b, salary s, department d, jobs j\n");
			sb.append("where b.empid = s.empid\n");
			sb.append("and b.deptid = d.deptid\n");
			sb.append("and b.jobid = j.jobid\n");
			if(word != null){
				if("이름".equals(key)){
					sb.append("and b.empname like '%'||?||'%' \n");
				}else if("부서".equals(key)){
					sb.append("and d.deptname like '%'||?||'%' \n");
				}else if("직급".equals(key)){
					sb.append("and j.jobname like '%'||?||'%' \n");
				}
			}
			sb.append("order by b.empid desc))\n");
			sb.append("where r>=? and r<=?\n");

			pstmt = conn.prepareStatement(sb.toString());
			int idx = 0;
			
			if(word != null){
				pstmt.setString(++idx, word);
			}
			pstmt.setInt(++idx, (currentPage*10)-9);
			pstmt.setInt(++idx, currentPage*10);

			rs = pstmt.executeQuery();
			
			/*List<EmployeesDto> employeesDtoList = new ArrayList<EmployeesDto>();
			List<DepartmentDto> departmentDtoList = new ArrayList<DepartmentDto>();
			List<JobsDto> jobsDtoList = new ArrayList<JobsDto>();
			List<SalaryDto> salaryDtoList = new ArrayList<SalaryDto>();*/
			List<Object> employeesDtoList = new ArrayList<Object>();
			List<Object> departmentDtoList = new ArrayList<Object>();
			List<Object> jobsDtoList = new ArrayList<Object>();
			List<Object> salaryDtoList = new ArrayList<Object>();
			
			while(rs.next()){
				EmployeesDto employDto = new EmployeesDto();
				DepartmentDto departmentDto = new DepartmentDto();
				JobsDto jobsDto = new JobsDto();
				SalaryDto salaryDto = new SalaryDto();
				
				employDto.setEmpId(rs.getInt("empid"));
				employDto.setEmpName(rs.getString("empname"));
				departmentDto.setDeptName(rs.getString("deptname"));
				jobsDto.setJobName(rs.getString("jobname"));
				salaryDto.setSalaryMoney(rs.getInt("salarymoney"));
				salaryDto.setSalaryIncentive(rs.getInt("salaryincentive"));
				salaryDto.setSalaryBonus(rs.getInt("salarybonus"));
				salaryDto.setSalaryBasic(rs.getInt("salarybasis"));
				salaryDto.setSalaryAdd(rs.getInt("salaryadd"));
				
				employeesDtoList.add(employDto);
				departmentDtoList.add(departmentDto);
				jobsDtoList.add(jobsDto);
				salaryDtoList.add(salaryDto);
			}
			
			mapList.put("employeesDtoList", employeesDtoList);
			mapList.put("departmentDtoList", departmentDtoList);
			mapList.put("jobsDtoList", jobsDtoList);
			mapList.put("salaryDtoList", salaryDtoList);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
			System.out.println("연결종료");
		}
		return mapList;
	}

	@Override
	public int totalCountList() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		int totalCount = 0;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");
			StringBuffer sb = new StringBuffer();
			sb.append("select count(*) a\n");
			sb.append("from salary\n");
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			if(rs.next()){
				totalCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
			System.out.println("연결종료");
		}
		return totalCount;
	}

	@Override
	public int salaryUpdate(Map<String, String> map) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			StringBuffer sql = new StringBuffer();
			sql.append("update salary\n");
			sql.append("set salarymoney=?,salaryincentive=?, salarybonus=?, salarybasis=?, salaryadd=?\n");
			sql.append("where empid = ? \n");

			pstmt = conn.prepareStatement(sql.toString());
			
			int idx = 0;			
			int money = Integer.parseInt(map.get("money"));
			int incentive = Integer.parseInt(map.get("incentive"));
			int bonus = Integer.parseInt(map.get("bonus"));
			int basic = Integer.parseInt(map.get("basic"));
			int add = Integer.parseInt(map.get("add"));
			int empId = Integer.parseInt(map.get("empId"));
			
			pstmt.setInt(++idx, money);
			pstmt.setInt(++idx, incentive);
			pstmt.setInt(++idx, bonus);
			pstmt.setInt(++idx, basic);
			pstmt.setInt(++idx, add);
			pstmt.setInt(++idx, empId);
			
			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return cnt;
	}

	@Override
	public int salaryDelete(String empId) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			StringBuffer sql = new StringBuffer();
			sql.append("update salary\n");
			sql.append("set salarymoney=?,salaryincentive=?, salarybonus=?, salarybasis=?, salaryadd=?\n");
			sql.append("where empid = ? \n");

			pstmt = conn.prepareStatement(sql.toString());
			int idx = 0;

			pstmt.setInt(++idx, 0);
			pstmt.setInt(++idx, 0);
			pstmt.setInt(++idx, 0);
			pstmt.setInt(++idx, 0);
			pstmt.setInt(++idx, 0);
			pstmt.setInt(++idx, Integer.parseInt(empId));
			
			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return cnt;
	}

}
