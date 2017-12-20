package com.tie.work.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.tie.basic.model.EmployeesDto;
import com.tie.department.model.DepartmentDto;
import com.tie.jobs.model.JobsDto;
import com.tie.util.Convert;
import com.tie.util.DB.DBClose;
import com.tie.util.DB.DBConnection;
import com.tie.work.model.AblityDto;
import com.tie.work.model.BreakDownDto;
import com.tie.work.model.EducationDto;
import com.tie.work.model.OutComeDto;
import com.tie.work.model.PeriodicDto;
import com.tie.work.model.WorkDto;

public class WorkDaoImpl implements WorkDao{

	private static WorkDao workDao;

	static {
		workDao = new WorkDaoImpl();
	}

	private WorkDaoImpl() {}

	public static WorkDao getWorkDao() {
		return workDao;
	}
	@Override
	public Map<String, List<Object>> workList(Map<String, String> map) {
		// TODO Auto-generated method stub
		Map<String, List<Object>> workList = new HashMap<String, List<Object>>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;

		try {

			conn = DBConnection.makeConnection();
			System.out.println("연결");
			StringBuffer sb = new StringBuffer();
			sb.append("select r, dutyseq, to_char(dutydate,'YYYYMMDD'), dutyyear, dutyassessor, dutystatus, deptname \n");
			sb.append("from (select rownum r, dutyseq, dutydate, dutyyear, dutyassessor, dutystatus, deptname\n");
			sb.append("from (select dutyseq, dutydate, dutyyear, dutyassessor, dutystatus, d.deptname\n");
			sb.append("from basic b, work w, department d \n");
			sb.append("where b.empid = w.empid\n");
			sb.append("and b.deptid = d.deptid\n");
			sb.append("and w.empid = ?\n");
			sb.append("order by dutydate desc))\n");
			sb.append("where r>=? and r<=?\n");

			pstmt = conn.prepareStatement(sb.toString());
			
			int idx = 0;
			pstmt.setInt(++idx, Integer.parseInt(map.get("empId")));
			pstmt.setInt(++idx, (Integer.parseInt(map.get("currentPage"))*3)-2);
			pstmt.setInt(++idx, Integer.parseInt(map.get("currentPage"))*3);

			rs = pstmt.executeQuery();

			List<Object> list = new ArrayList<Object>();
			List<Object> list2 = new ArrayList<Object>();

			while(rs.next()){
				WorkDto workDto = new WorkDto();
				DepartmentDto departmentDto = new DepartmentDto();

				workDto.setWorkSeq(rs.getInt(2));
				workDto.setWorkDate(rs.getString(3));
				workDto.setWorkYear(rs.getString(4));
				workDto.setWorkAssessor(rs.getString(5));
				workDto.setWorkStatus(rs.getString(6));
				departmentDto.setDeptName(rs.getString(7));

				list.add(workDto);
				list2.add(departmentDto);
			}

			workList.put("workDto", list);
			workList.put("departmentDto", list2);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
			System.out.println("연결종료");
		}
		return workList;
	}

	@Override
	public int workRegister(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			WorkDto workDto =  (WorkDto) map.get("workDto");
			BreakDownDto breakdownDto = (BreakDownDto) map.get("breakdownDto");
			PeriodicDto periodicDto = (PeriodicDto) map.get("periodicDto");
			OutComeDto outcomeDto = (OutComeDto)map.get("outcomeDto");
			EducationDto educationDto = (EducationDto)map.get("educationDto");
			AblityDto ablityDto = (AblityDto)map.get("ablityDto");

			StringBuffer sql = new StringBuffer();

			sql.append("insert all\n");
			sql.append("into work (dutyseq, dutydate, dutyassessor, dutystatus, dutygoal, empid, dutyyear) \n");
			sql.append("values(work_seq.nextval,sysdate,?,?,?,?,?)\n");
			sql.append("into ablity (ablitycareer, ablityacademic, academicskill, dutyseq) \n");
			sql.append("values(?,?,?,work_seq.CURRVAL)\n");

			if(breakdownDto != null){
				for(int i=0; i<breakdownDto.getBreakdownContents().length ;i++){
					sql.append("into breakdown (breakdownseq, breakdowncontents, breakdownimportant, breakdownweight, breakdownresult, breakdowncooperation, dutyseq)\n");
					sql.append("values(?,?,?,?,?,?,work_seq.CURRVAL)\n");
				}	
			}
			if(periodicDto != null){
				for(int i=0; i<periodicDto.getPeriodicContents().length;i++){
					sql.append("into periodic (periodicseq, periodicperiod, periodiccontents, periodicresult, periodiccoopration, dutyseq) \n");
					sql.append("values(?,?,?,?,?,work_seq.CURRVAL)\n");
				}
			}
			if(outcomeDto != null){
				for(int i=0; i<outcomeDto.getOutcomeCooperation().length;i++){
					sql.append("into outcome (outcomeseq, outcomeperiod, outcomework, outcomeresult, outcomecooperation, dutyseq) \n");
					sql.append("values(?,?,?,?,?,work_seq.CURRVAL)\n");
				}
			}
			if(educationDto != null){
				for(int i=0; i<educationDto.getEduContents().length;i++){
					sql.append("into education (eduseq, educontents, eduinstitution, eduunusual, dutyseq)\n");
					sql.append("values(?,?,?,?,work_seq.CURRVAL)\n");
				}
			}
			sql.append("select * from dual\n");
			pstmt = conn.prepareStatement(sql.toString());

			int idx = 0;

			pstmt.setString(++idx, workDto.getWorkAssessor());
			pstmt.setString(++idx, workDto.getWorkStatus());
			pstmt.setString(++idx, workDto.getWorkGoal());
			pstmt.setInt(++idx, workDto.getEmpId());
			pstmt.setString(++idx, workDto.getWorkYear());

			pstmt.setString(++idx, ablityDto.getAblityCareer());
			pstmt.setString(++idx, ablityDto.getAblityAcademic());
			pstmt.setString(++idx, ablityDto.getAcademicSkill());

			if(breakdownDto != null){
				for(int i=0; i<breakdownDto.getBreakdownContents().length;i++){
					pstmt.setInt(++idx, i);
					pstmt.setString(++idx, breakdownDto.getBreakdownContents()[i]);
					pstmt.setString(++idx, breakdownDto.getBreakdownImportant()[i]);
					pstmt.setString(++idx, breakdownDto.getBreakdownWeight()[i]);
					pstmt.setString(++idx, breakdownDto.getBreakdownResult()[i]);
					pstmt.setString(++idx, breakdownDto.getBreakdownCooperation()[i]);
				}
			}

			if(periodicDto != null){
				for(int i=0; i<periodicDto.getPeriodicContents().length;i++){
					pstmt.setInt(++idx, i);
					pstmt.setString(++idx, periodicDto.getPeriodicPeriod()[i]);
					pstmt.setString(++idx, periodicDto.getPeriodicContents()[i]);
					pstmt.setString(++idx, periodicDto.getPeriodicResult()[i]);
					pstmt.setString(++idx, periodicDto.getPeriodicCoopration()[i]);
				}
			}
			if(outcomeDto != null){
				for(int i=0; i<outcomeDto.getOutcomeCooperation().length;i++){
					pstmt.setInt(++idx, i);
					pstmt.setString(++idx, outcomeDto.getOutcomePeriod()[i]);// String 으로 디비 바꿔줘야함
					pstmt.setString(++idx, outcomeDto.getOutcomeWork()[i]);
					pstmt.setString(++idx, outcomeDto.getOutcomeResult()[i]);
					pstmt.setString(++idx, outcomeDto.getOutcomeCooperation()[i]);
				}
			}
			if(educationDto != null){
				for(int i=0; i<educationDto.getEduContents().length;i++){
					pstmt.setInt(++idx, i);
					pstmt.setString(++idx, educationDto.getEduContents()[i]);
					pstmt.setString(++idx, educationDto.getEduInstitution()[i]);
					pstmt.setString(++idx, educationDto.getEduUnusual()[i]);
				}
			}

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
	public int totalCountList(int empId) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		int totalCount = 0;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");
			StringBuffer sb = new StringBuffer();
			sb.append("select count(*) \n");
			sb.append("from work where empid = ?\n");
			pstmt = conn.prepareStatement(sb.toString());
			int idx = 0;
			pstmt.setInt(++idx, empId);
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
	public Map<String, String> commonFormList(int workSeq) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");
			StringBuffer sb = new StringBuffer();
			sb.append("select d.deptname, j.jobname, b.empname, b.empid, w.*, a.*\n");
			sb.append("from basic b, work w, department d ,jobs j, ablity a\n");
			sb.append("where b.empid = w.empid\n");
			sb.append("and b.deptid = d.deptid\n");
			sb.append("and b.jobid = j.jobid\n");
			sb.append("and w.dutyseq = a.dutyseq\n");
			sb.append("and w.dutyseq = ? \n");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, workSeq);
			rs = pstmt.executeQuery();

			String deptName = null;
			String jobsName = null;
			String empName = null;
			int empId = 0;

			String assessor = null;
			String date = null;
			String workYear = null;
			String goal = null;
			String status = null;

			if(rs.next()){
				deptName = rs.getString("deptname");
				jobsName = rs.getString("jobname");
				empName = rs.getString("empname");
				empId = rs.getInt("empid");

				assessor = rs.getString("dutyassessor");
				date = rs.getString("dutydate");
				workYear =  rs.getString("dutyYear");
				goal = rs.getString("dutygoal");
				status = rs.getString("dutystatus");

				map.put("deptName",deptName);
				map.put("jobsName",jobsName);
				map.put("empName",empName);	
				map.put("empId", String.valueOf(empId));
				map.put("assessor",assessor);
				map.put("date",date);
				map.put("workYear", workYear);
				map.put("goal",goal);
				map.put("status",status);
				map.put("workSeq",String.valueOf(workSeq));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
			System.out.println("연결종료");
		}
		return map;
	}

	@Override
	public List<BreakDownDto> breakDownDtoFormList(int workSeq) {
		// TODO Auto-generated method stub
		List<BreakDownDto> list = new ArrayList<BreakDownDto>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");
			StringBuffer sb = new StringBuffer();
			sb.append("select bd.* \n");
			sb.append("from work w, breakdown bd\n");
			sb.append("where w.dutyseq = bd.dutyseq\n");
			sb.append("and w.dutyseq = ?\n");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, workSeq);
			rs = pstmt.executeQuery();

			BreakDownDto dto = null;
			while(rs.next()){
				dto = new BreakDownDto();

				dto.setBreakdownContents2(rs.getString("breakdowncontents"));
				dto.setBreakdownImportant2(rs.getString("breakdownimportant"));
				dto.setBreakdownWeight2(rs.getString("breakdownweight"));
				dto.setBreakdownResult2(rs.getString("breakdownresult"));
				dto.setBreakdownCooperation2(rs.getString("breakdowncooperation"));
				dto.setBreakdownSeq2(rs.getInt("breakdownseq"));
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
			System.out.println("연결종료");
		}
		return list;
	}

	@Override
	public List<PeriodicDto> periodicDtoFormList(int workSeq) {
		// TODO Auto-generated method stub
		List<PeriodicDto> list = new ArrayList<PeriodicDto>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");
			StringBuffer sb = new StringBuffer();
			sb.append("select p.* \n");
			sb.append("from work w, periodic p\n");
			sb.append("where w.dutyseq = p.dutyseq\n");
			sb.append("and w.dutyseq = ?\n");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, workSeq);
			rs = pstmt.executeQuery();

			PeriodicDto dto = null;

			while(rs.next()){
				dto = new PeriodicDto();
				dto.setPeriodicPeriod2(rs.getString("periodicperiod"));
				dto.setPeriodicContents2(rs.getString("periodiccontents"));
				dto.setPeriodicResult2(rs.getString("periodicresult"));
				dto.setPeriodicCoopration2(rs.getString("periodiccoopration"));
				dto.setPeriodicSeq2(rs.getInt("periodicseq"));

				list.add(dto);
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
			System.out.println("연결종료");
		}
		return list;
	}

	@Override
	public List<OutComeDto> outComeDtoFormList(int workSeq) {
		// TODO Auto-generated method stub
		List<OutComeDto> list = new ArrayList<OutComeDto>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");
			StringBuffer sb = new StringBuffer();
			sb.append("select o.* \n");
			sb.append("from work w, outcome o\n");
			sb.append("where w.dutyseq = o.dutyseq\n");
			sb.append("and w.dutyseq = ?\n");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, workSeq);
			rs = pstmt.executeQuery();

			OutComeDto dto = null;

			while(rs.next()){
				dto = new OutComeDto();

				dto.setOutcomePeriod2(rs.getString("outcomeperiod"));
				dto.setOutcomeWork2(rs.getString("outcomework"));
				dto.setOutcomeResult2(rs.getString("outcomeresult"));
				dto.setOutcomeCooperation2(rs.getString("outcomecooperation"));
				dto.setOutcomeSeq2(rs.getInt("outcomeseq"));

				list.add(dto);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
			System.out.println("연결종료");
		}
		return list;
	}

	@Override


	public List<AblityDto> ablityDtoFormList(int workSeq) {
		// TODO Auto-generated method stub
		List<AblityDto> list = new ArrayList<AblityDto>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");
			StringBuffer sb = new StringBuffer();
			sb.append("select a.* \n");
			sb.append("from work w, ablity a\n");
			sb.append("where w.dutyseq = a.dutyseq\n");
			sb.append("and w.dutyseq = ?\n");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, workSeq);
			rs = pstmt.executeQuery();

			AblityDto dto = new AblityDto();

			if(rs.next()){

				dto.setAblityCareer(rs.getString("ablitycareer"));
				dto.setAblityAcademic(rs.getString("ablityacademic"));
				dto.setAcademicSkill(rs.getString("academicskill"));

				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
			System.out.println("연결종료");
		}
		return list;
	}

	@Override
	public List<EducationDto> educationDtoFormList(int workSeq) {
		// TODO Auto-generated method stub
		List<EducationDto> list = new ArrayList<EducationDto>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");
			StringBuffer sb = new StringBuffer();
			sb.append("select e.* \n");
			sb.append("from work w, education e\n");
			sb.append("where w.dutyseq = e.dutyseq\n");
			sb.append("and w.dutyseq = ?\n");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, workSeq);
			rs = pstmt.executeQuery();

			EducationDto dto = null;

			while(rs.next()){
				dto = new EducationDto();

				dto.setEduContents2(rs.getString("educontents"));
				dto.setEduInstitution2(rs.getString("eduinstitution"));
				dto.setEduUnusual2(rs.getString("eduunusual"));
				dto.setEduSeq2(rs.getInt("eduseq"));

				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
			System.out.println("연결종료");
		}
		return list;
	}

	@Override
	public int workUpdate(List<WorkDto> list, int workSeq) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			StringBuffer sql = new StringBuffer();
			sql.append("update work set DUTYSTATUS=?, DUTYGOAL=? where DUTYSEQ = ?\n");
			pstmt = conn.prepareStatement(sql.toString());

			int idx = 0;

			pstmt.setString(++idx, list.get(0).getWorkStatus());
			pstmt.setString(++idx, list.get(0).getWorkGoal());
			pstmt.setInt(++idx, workSeq);

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
	public int breakdownUpdate(List<BreakDownDto> list, int workSeq) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");
			
			conn.setAutoCommit(false);
			
			for(int i=0; i<list.size(); i++){
				StringBuffer sql = new StringBuffer();
				sql.append("update breakdown set BREAKDOWNCONTENTS=?, \n");
				sql.append("BREAKDOWNIMPORTANT=?, BREAKDOWNWEIGHT=?, BREAKDOWNRESULT=?, breakdowncooperation=?\n");
				sql.append("where breakdownseq = ? and dutyseq = ?\n");

				pstmt = conn.prepareStatement(sql.toString());
				
				pstmt.setString(1, list.get(i).getBreakdownContents2());
				pstmt.setString(2, list.get(i).getBreakdownImportant2());
				pstmt.setString(3, list.get(i).getBreakdownWeight2());
				pstmt.setString(4, list.get(i).getBreakdownResult2());
				pstmt.setString(5, list.get(i).getBreakdownCooperation2());
				pstmt.setInt(6, list.get(i).getBreakdownSeq2());
				pstmt.setInt(7, workSeq);

				sql = null;

				pstmt.executeUpdate();
				conn.commit();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return cnt;
	}

	@Override
	public int periodicUpdate(List<PeriodicDto> list, int workSeq) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			conn.setAutoCommit(false);

			for(int i=0; i<list.size();i++){
				StringBuffer sql = new StringBuffer();
				sql.append("update periodic set periodicperiod=?, \n");
				sql.append("periodiccontents=?, periodicresult=?, periodiccoopration=?\n");
				sql.append("where periodicseq = ? and dutyseq = ?\n");

				pstmt = conn.prepareStatement(sql.toString());

				pstmt.setString(1, list.get(i).getPeriodicPeriod2());
				pstmt.setString(2, list.get(i).getPeriodicContents2());
				pstmt.setString(3, list.get(i).getPeriodicResult2());
				pstmt.setString(4, list.get(i).getPeriodicCoopration2());
				pstmt.setInt(5, list.get(i).getPeriodicSeq2());
				pstmt.setInt(6, workSeq);

				sql = null;

				pstmt.executeUpdate();
				conn.commit();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}
		return cnt;
	}
	@Override
	public int outcomeUpdate(List<OutComeDto> list, int workSeq) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			conn.setAutoCommit(false);

			for(int i=0; i<list.size();i++){
				StringBuffer sql = new StringBuffer();
				sql.append("update outcome set outcomeperiod=?, \n");
				sql.append("outcomework=?, outcomeresult=?, outcomecooperation=?\n");
				sql.append("where outcomeseq = ? and dutyseq = ?\n");

				pstmt = conn.prepareStatement(sql.toString());
				
				pstmt.setString(1, list.get(i).getOutcomePeriod2());
				pstmt.setString(2, list.get(i).getOutcomeWork2());
				pstmt.setString(3, list.get(i).getOutcomeResult2());
				pstmt.setString(4, list.get(i).getOutcomeCooperation2());
				pstmt.setInt(5, list.get(i).getOutcomeSeq2());
				pstmt.setInt(6, workSeq);

				sql = null;

				pstmt.executeUpdate();
				conn.commit();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return cnt;
	}
	@Override
	public int ablityUpdate(List<AblityDto> list, int workSeq) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			StringBuffer sql = new StringBuffer();
			sql.append("update ablity set ablitycareer=?, \n");
			sql.append("ablityacademic=?, academicskill=? where dutyseq = ?\n");
			pstmt = conn.prepareStatement(sql.toString());

			int idx = 0;

			pstmt.setString(++idx, list.get(0).getAblityCareer());
			pstmt.setString(++idx, list.get(0).getAblityAcademic());
			pstmt.setString(++idx, list.get(0).getAcademicSkill());
			pstmt.setInt(++idx, workSeq);

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
	public int educationUpdate(List<EducationDto> list, int workSeq) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			conn.setAutoCommit(false);

			for(int i=0; i<list.size();i++){
				StringBuffer sql = new StringBuffer();
				sql.append("update education set educontents=?, \n");
				sql.append("eduinstitution=?, eduunusual=?\n");
				sql.append("where eduseq = ? and dutyseq = ?\n");

				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, list.get(i).getEduContents2());
				pstmt.setString(2, list.get(i).getEduInstitution2());
				pstmt.setString(3, list.get(i).getEduUnusual2());
				pstmt.setInt(4, list.get(i).getEduSeq2());
				pstmt.setInt(5, workSeq);
				
				pstmt.executeUpdate();
				conn.commit();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return cnt;
	}

	@Override
	public int workDelete(int workSeq) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			StringBuffer sql = new StringBuffer();
			sql.append("delete from work\n");
			sql.append("where dutyseq = ?\n");

			pstmt = conn.prepareStatement(sql.toString());

			int idx = 0;
			pstmt.setInt(++idx, workSeq);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return cnt;
	}

	@Override
	public int breakdownDelete(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			StringBuffer sql = new StringBuffer();
			sql.append("delete from breakdown\n");
			sql.append("where dutyseq = ?\n");
			
			if(map.get("start") != 0 && map.get("end") != 0){
				sql.append("and breakdownseq >= ?\n");
				sql.append("and breakdownseq < ?\n");
			}

			pstmt = conn.prepareStatement(sql.toString());

			int idx = 0;
			pstmt.setInt(++idx, map.get("workSeq"));
			
			if(map.get("start") != 0 && map.get("end") != 0){
				pstmt.setInt(++idx, map.get("start"));
				pstmt.setInt(++idx, map.get("end"));
			}

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return cnt;
	}

	@Override
	public int periodicDelete(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			StringBuffer sql = new StringBuffer();
			sql.append("delete from periodic\n");
			sql.append("where dutyseq = ?\n");

			if(map.get("start") != 0 && map.get("end") != 0){
				sql.append("and periodicseq >= ?\n");
				sql.append("and periodicseq < ?\n");
			}

			pstmt = conn.prepareStatement(sql.toString());

			int idx = 0;
			pstmt.setInt(++idx, map.get("workSeq"));
			
			if(map.get("start") != 0 && map.get("end") != 0){
				pstmt.setInt(++idx, map.get("start"));
				pstmt.setInt(++idx, map.get("end"));
			}

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return cnt;
	}

	@Override
	public int outcomeDelete(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			StringBuffer sql = new StringBuffer();
			sql.append("delete from outcome\n");
			sql.append("where dutyseq = ?\n");

			if(map.get("start") != 0 && map.get("end") != 0){
				sql.append("and outcomeseq >= ?\n");
				sql.append("and outcomeseq < ?\n");
			}

			pstmt = conn.prepareStatement(sql.toString());

			int idx = 0;
			pstmt.setInt(++idx, map.get("workSeq"));
			
			if(map.get("start") != 0 && map.get("end") != 0){
				pstmt.setInt(++idx, map.get("start"));
				pstmt.setInt(++idx, map.get("end"));
			}

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return cnt;
	}

	@Override
	public int ablityDelete(int workSeq) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			StringBuffer sql = new StringBuffer();
			sql.append("delete from ablity\n");
			sql.append("where dutyseq = ?\n");

			pstmt = conn.prepareStatement(sql.toString());

			int idx = 0;
			pstmt.setInt(++idx, workSeq);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return cnt;
	}

	@Override
	public int educationDelete(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			StringBuffer sql = new StringBuffer();
			sql.append("delete from education\n");
			sql.append("where dutyseq = ?\n");

			if(map.get("start") != 0 && map.get("end") != 0){
				sql.append("and eduseq >= ?\n");
				sql.append("and eduseq < ?\n");
			}

			pstmt = conn.prepareStatement(sql.toString());

			int idx = 0;
			pstmt.setInt(++idx, map.get("workSeq"));
			
			if(map.get("start") != 0 && map.get("end") != 0){
				pstmt.setInt(++idx, map.get("start"));
				pstmt.setInt(++idx, map.get("end"));
			}

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return cnt;
	}

	@Override
	public int breakdownSize(int workSeq) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) from breakdown\n");
			sql.append("where dutyseq = ?\n");

			pstmt = conn.prepareStatement(sql.toString());

			int idx = 0;
			pstmt.setInt(++idx, workSeq);

			rs = pstmt.executeQuery();

			if(rs.next()){
				result = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return result;
	}

	@Override
	public int periodicSize(int workSeq) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) from periodic\n");
			sql.append("where dutyseq = ?\n");

			pstmt = conn.prepareStatement(sql.toString());

			int idx = 0;
			pstmt.setInt(++idx, workSeq);

			rs = pstmt.executeQuery();

			if(rs.next()){
				result = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return result;
	}

	@Override
	public int outcomeSize(int workSeq) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) from outcome\n");
			sql.append("where dutyseq = ?\n");

			pstmt = conn.prepareStatement(sql.toString());

			int idx = 0;
			pstmt.setInt(++idx, workSeq);

			rs = pstmt.executeQuery();

			if(rs.next()){
				result = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return result;
	}
	
	@Override
	public int ablitySize(int workSeq) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) from ablity\n");
			sql.append("where dutyseq = ?\n");

			pstmt = conn.prepareStatement(sql.toString());

			int idx = 0;
			pstmt.setInt(++idx, workSeq);

			rs = pstmt.executeQuery();

			if(rs.next()){
				result = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return result;
	}

	@Override
	public int educationSize(int workSeq) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) from education\n");
			sql.append("where dutyseq = ?\n");

			pstmt = conn.prepareStatement(sql.toString());

			int idx = 0;
			pstmt.setInt(++idx, workSeq);

			rs = pstmt.executeQuery();

			if(rs.next()){
				result = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return result;
	}

	@Override
	public int breakdownInsert(List<BreakDownDto> list, int workSeq) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			conn.setAutoCommit(false);
			
			int idx = 0;
			
			for(int i=0; i < list.size(); i++){
				
				StringBuffer sql = new StringBuffer();
				
				sql.append("insert \n");
				sql.append("into breakdown (breakdownseq, breakdowncontents, breakdownimportant, breakdownweight, breakdownresult, breakdowncooperation, dutyseq)\n");
				sql.append("values(?,?,?,?,?,?,?)\n");
				
				pstmt = conn.prepareStatement(sql.toString());
				
				pstmt.setInt(++idx, list.get(i).getBreakdownSeq2());
				pstmt.setString(++idx, list.get(i).getBreakdownContents2());
				pstmt.setString(++idx, list.get(i).getBreakdownImportant2());
				pstmt.setString(++idx, list.get(i).getBreakdownWeight2());
				pstmt.setString(++idx, list.get(i).getBreakdownResult2());
				pstmt.setString(++idx, list.get(i).getBreakdownCooperation2());
				pstmt.setInt(++idx, workSeq);	
				
				idx = 0;

				sql = null;
				
				cnt = pstmt.executeUpdate();
				conn.commit();
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return cnt;
	}

	@Override
	public int periodicInsert(List<PeriodicDto> list, int workSeq) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			conn.setAutoCommit(false);
			int idx = 0;
			
			for(int i=0; i < list.size(); i++){
				
				StringBuffer sql = new StringBuffer();

				sql.append("insert \n");
				sql.append("into periodic (periodicseq, periodicperiod, periodiccontents, periodicresult, periodiccoopration, dutyseq) \n");
				sql.append("values(?,?,?,?,?,?)\n");
				
				pstmt = conn.prepareStatement(sql.toString());
				
				pstmt.setInt(++idx, list.get(i).getPeriodicSeq2());
				pstmt.setString(++idx, list.get(i).getPeriodicPeriod2());
				pstmt.setString(++idx, list.get(i).getPeriodicContents2());
				pstmt.setString(++idx, list.get(i).getPeriodicResult2());
				pstmt.setString(++idx, list.get(i).getPeriodicCoopration2());
				pstmt.setInt(++idx, workSeq);	
				
				idx = 0;
				sql = null;
				
				cnt = pstmt.executeUpdate();
				conn.commit();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return cnt;
	}

	@Override
	public int outcomeInsert(List<OutComeDto> list, int workSeq) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			conn.setAutoCommit(false);
			
			int idx = 0;
			
			for(int i=0; i < list.size(); i++){
				StringBuffer sql = new StringBuffer();

				sql.append("insert \n");
				sql.append("into outcome (outcomeseq, outcomeperiod, outcomework, outcomeresult, outcomecooperation, dutyseq) \n");
				sql.append("values(?,?,?,?,?,?)\n");
				
				pstmt = conn.prepareStatement(sql.toString());
				
				pstmt.setInt(++idx, list.get(i).getOutcomeSeq2());
				pstmt.setString(++idx, list.get(i).getOutcomePeriod2());
				pstmt.setString(++idx, list.get(i).getOutcomeWork2());
				pstmt.setString(++idx, list.get(i).getOutcomeResult2());
				pstmt.setString(++idx, list.get(i).getOutcomeCooperation2());
				pstmt.setInt(++idx, workSeq);	
				
				idx = 0;
				sql = null;
				
				cnt = pstmt.executeUpdate();
				conn.commit();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return cnt;
	}

	@Override
	public int ablityInsert(List<AblityDto> list, int workSeq) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			StringBuffer sql = new StringBuffer();

			sql.append("insert \n");
			sql.append("into ablity (ablitycareer, ablityacademic, academicskill, dutyseq) \n");
			sql.append("values(?,?,?,?)\n");
			
			int idx = 0;
			pstmt = conn.prepareStatement(sql.toString());
			for(int i=0; i < list.size(); i++){
				pstmt.setString(++idx, list.get(i).getAblityCareer());
				pstmt.setString(++idx, list.get(i).getAblityAcademic());
				pstmt.setString(++idx, list.get(i).getAcademicSkill());
				pstmt.setInt(++idx, workSeq);	
				
				idx = 0;
			}

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
	public int educationInsert(List<EducationDto> list, int workSeq) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			conn.setAutoCommit(false);
			
			int idx = 0;
			
			for(int i=0; i < list.size(); i++){
				
				StringBuffer sql = new StringBuffer();

				sql.append("insert \n");
				sql.append("into education (eduseq, educontents, eduinstitution, eduunusual, dutyseq)\n");
				sql.append("values(?,?,?,?,?)\n");
				
				pstmt = conn.prepareStatement(sql.toString());
				
				pstmt.setInt(++idx, list.get(i).getEduSeq2());
				pstmt.setString(++idx, list.get(i).getEduContents2());
				pstmt.setString(++idx, list.get(i).getEduInstitution2());
				pstmt.setString(++idx, list.get(i).getEduUnusual2());
				pstmt.setInt(++idx, workSeq);	
				
				idx = 0;
				sql = null;
				
				cnt = pstmt.executeUpdate();
				conn.commit();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return cnt;
	}

}
