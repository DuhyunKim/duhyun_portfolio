package com.tie.basic.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tie.basic.model.EmpFileDto;
import com.tie.basic.model.EmployeesDto;
import com.tie.basic.model.EmployeesDto1;
import com.tie.department.model.DepartmentDto;
import com.tie.util.DB.DBClose;
import com.tie.util.DB.DBConnection;

public class EmployeesDaoImpl implements EmployeesDao {

	private static EmployeesDao employeesDao;

	static {
		employeesDao = new EmployeesDaoImpl();
	}

	private EmployeesDaoImpl() {
	}

	public static EmployeesDao getEmployeesDao() {
		return employeesDao;
	}

	
	
	@Override
	public int idCheck(String id) {
		int cnt = 1;  
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int empId =Integer.parseInt(id);
		try {
			System.out.println("=====DB idCheck =====");
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(empId) \n");
			sql.append("from basic \n");
			sql.append("where empId = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, empId);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn,pstmt,rs);
			System.out.println("=====DB  idCheck =====");
		}
		
		return cnt;
	}

	@Override
	public List<EmployeesDto1> employeesList(Map<String, String> map) {
		List<EmployeesDto1> list = new ArrayList<EmployeesDto1>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int currentPage = Integer.parseInt(map.get("currentPage"));
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			String word = map.get("word");
			String pageSizeString = map.get("pageSize");
			int pageSize=0;
			pageSize = Integer.parseInt(pageSizeString);
			
			System.out.println("=====DB employeesList=====");
			sql.append("SELECT  rownum r, empId,empName , deptName, hireName , \n");
			sql.append(" empFinalEdu, empHireDate ,jobName \n");
			sql.append("from (SELECT  rownum r, empId,empName , deptName, hireName , \n");
			sql.append(" empFinalEdu, empHireDate ,jobName \n");
			sql.append("from (SELECT a.empId,a.empName , b.deptName, c.hireName , \n");
			sql.append(" a.empFinalEdu, a.empHireDate ,d.jobName \n");
			sql.append("FROM basic a, department b , hire c, jobs d \n");
			sql.append("where a.deptId = b.deptId \n");
			sql.append("and a.jobId = d.jobId \n");
			sql.append("and a.hireId = c.hireId \n");
			if (word != null) {
				sql.append("and a.empName like '%'||?||'%' ");
			}
			sql.append("ORDER BY a.empId ASC )) \n");
			sql.append("where r>=? and r<=?\n");
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 0;
			if (word != null) pstmt.setString(++idx, word);
			pstmt.setInt(++idx, (currentPage*pageSize)-(pageSize-1));
	        pstmt.setInt(++idx, currentPage*pageSize);
			rs = pstmt.executeQuery();
			 
			/*sql.append("select *  \n");
			sql.append("from basic \n");
			if (!word.isEmpty()) {
				
				sql.append("where empName like '%'||?||'%' ");
			}
			pstmt = conn.prepareStatement(sql.toString());

			if (!word.isEmpty())
				pstmt.setString(1, word);
			rs = pstmt.executeQuery();*/

			while (rs.next()) {
				EmployeesDto1 employeesDto1 = new EmployeesDto1();

				employeesDto1.setEmpId(rs.getInt("empId"));
				employeesDto1.setEmpName(rs.getString("empName"));
				employeesDto1.setDeptName(rs.getString("deptName"));
				employeesDto1.setHireName(rs.getString("hireName"));
				employeesDto1.setEmpFinalEdu(rs.getString("empFinalEdu"));
				employeesDto1.setEmpHireDate(rs.getString("empHireDate"));
				employeesDto1.setJobName(rs.getString("jobName"));
				list.add(employeesDto1);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
			System.out.println("=====DB  employeesList  ====");
		}

		return list;
	}

	@Override
	public int modfiy(EmployeesDto employeesDto,EmpFileDto empFileDto) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			StringBuffer sql = new StringBuffer();
			
			System.out.println("=====DB modfiy  ");

			sql.append("UPDATE basic \n");
			sql.append("SET empName = ?, deptId = ?, \n");
			sql.append("	jobId = ? , empRegNumber = ?,empRegNumber2 = ?, \n");
			sql.append("	empPhone1=?,empPhone2=?,empPhone3=?, \n");
			sql.append("	empExtention1 = ?,empExtention2 = ?,empExtention3 = ?, \n");
			sql.append("	empEmail1 = ?,empEmail2 = ?, empBirth = ?, \n");
			sql.append("	empFinalEdu = ?,  empHireDate =?, \n");
			sql.append("	hireId =?, empDetail=?, \n");
			sql.append("    zipNo = ?, roadAddrPart1=? , jibunAddr=? ,addrDetail=? \n");
			sql.append("where empId = ? ");
				
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 0;
			pstmt.setString(++idx, employeesDto.getEmpName());
			pstmt.setInt(++idx, employeesDto.getDeptId());
			pstmt.setInt(++idx, employeesDto.getJobId());
			pstmt.setString(++idx, employeesDto.getEmpRegNumber1());
			pstmt.setString(++idx, employeesDto.getEmpRegNumber2());
			pstmt.setString(++idx, employeesDto.getEmpPhone1());
			pstmt.setString(++idx, employeesDto.getEmpPhone2());
			pstmt.setString(++idx, employeesDto.getEmpPhone3());
			pstmt.setString(++idx, employeesDto.getEmpExtention1());
			pstmt.setString(++idx, employeesDto.getEmpExtention2());
			pstmt.setString(++idx, employeesDto.getEmpExtention3());
			pstmt.setString(++idx, employeesDto.getEmpEmail1());
			pstmt.setString(++idx, employeesDto.getEmpEmail2());
			pstmt.setString(++idx, employeesDto.getEmpBirth());
			pstmt.setString(++idx, employeesDto.getEmpFinalEdu());
			pstmt.setString(++idx, employeesDto.getEmpHireDate());
			pstmt.setInt(++idx, employeesDto.getHireId());
			pstmt.setString(++idx, employeesDto.getEmpDetail());
			pstmt.setString(++idx, employeesDto.getZipNo());
			pstmt.setString(++idx, employeesDto.getRoadAddrPart1());
			pstmt.setString(++idx, employeesDto.getJibunAddr());
			pstmt.setString(++idx, employeesDto.getAddrDetail());
			pstmt.setInt(++idx, employeesDto.getEmpId());

			idx = 0;
			cnt += pstmt.executeUpdate();
			sql.setLength(0);  //sql �ʱ�ȭ
			pstmt = null;
			conn.commit();

			sql.append("UPDATE empfile \n");
			sql.append("SET  \n");
			if(empFileDto.getFaceOriginal() != "noimages.jpg"){
					sql.append("	faceOriginal=? , faceSaveName=?, \n");	
			}
			if(empFileDto.getDegreeOriginal()  != "없음"){
					sql.append("    degreeOriginal=?, degreeSaveName=? , \n");	
				
			}
			if(empFileDto.getJoinOriginal()  != "없음"){
				sql.append("    joinOriginal=?, joinSaveName=?,  \n");
			}
			sql.append("	 saveFolder=?  \n");
			sql.append("	where empId = ?  \n");
			
			 pstmt = conn.prepareStatement(sql.toString());
			 
			if(empFileDto.getFaceOriginal() != "noimages.jpg"){
				pstmt.setString(++idx, empFileDto.getFaceOriginal());
				pstmt.setString(++idx, empFileDto.getFaceSaveName());
			}
			if(empFileDto.getDegreeOriginal() != "없음"){
				pstmt.setString(++idx, empFileDto.getDegreeOriginal());
				pstmt.setString(++idx, empFileDto.getDegreeSaveName());
			}
			if(empFileDto.getJoinOriginal() != "없음"){
				pstmt.setString(++idx, empFileDto.getJoinOriginal());
				pstmt.setString(++idx, empFileDto.getJoinSaveName());
			}
			pstmt.setString(++idx, empFileDto.getSaveFolder());
			pstmt.setInt(++idx, empFileDto.getEmpId());

			cnt += pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("=====DB modfiy =====");
		}

		return cnt;
	}

	@Override
	public Map<String, Object> modifyInfo(int empId) {
		EmployeesDto employeesDto = null;
		EmpFileDto empFileDto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Map<String , Object> map = new HashMap<String ,Object>();
		
		try {
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			System.out.println("=====DB modifyInfo =====");
			
			sql.append("SELECT * \n");
			sql.append("FROM basic a, department b , hire c, jobs d,empfile e \n");
			sql.append("where a.deptId = b.deptId  \n");
			sql.append("and a.jobId = d.jobId  \n");
			sql.append("and a.hireId = c.hireId  \n");
			sql.append("and a.empId = e.empId \n");
			sql.append("and a.empId = ? \n");
			
			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setInt(1, empId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				employeesDto = new EmployeesDto();
				empFileDto = new EmpFileDto();
				employeesDto.setEmpId(rs.getInt("empId"));
				employeesDto.setEmpPw(rs.getString("empPw"));
				employeesDto.setEmpName(rs.getString("empName"));
				employeesDto.setEmpRegNumber1(rs.getString("empRegNumber"));
				employeesDto.setEmpRegNumber2(rs.getString("empRegNumber2"));
				employeesDto.setEmpPhone1(rs.getString("empPhone1"));
				employeesDto.setEmpPhone2(rs.getString("empPhone2"));
				employeesDto.setEmpPhone3(rs.getString("empPhone3"));
				employeesDto.setEmpExtention1(rs.getString("empExtention1"));
				employeesDto.setEmpExtention2(rs.getString("empExtention2"));
				employeesDto.setEmpExtention3(rs.getString("empExtention3"));
				employeesDto.setEmpEmail1(rs.getString("empEmail1"));
				employeesDto.setEmpEmail2(rs.getString("empEmail2"));
				employeesDto.setEmpBirth(rs.getString("empBirth"));
				employeesDto.setEmpFinalEdu(rs.getString("empFinalEdu"));
				employeesDto.setEmpHireDate(rs.getString("empHireDate"));
				employeesDto.setEmpDetail(rs.getString("empDetail"));
				employeesDto.setEmpDeptName(rs.getString("deptName"));
				employeesDto.setEmpDeptHighName(rs.getString("highDept"));
				employeesDto.setEmpJobName(rs.getString("jobName"));
				employeesDto.setEmpHireName(rs.getString("hireName"));
				employeesDto.setZipNo(rs.getString("zipNo"));
				employeesDto.setRoadAddrPart1(rs.getString("roadAddrPart1"));
				employeesDto.setJibunAddr(rs.getString("jibunAddr"));
				employeesDto.setAddrDetail(rs.getString("addrDetail"));
				
				employeesDto.setDeptId(rs.getInt("deptId"));
				employeesDto.setJobId(rs.getInt("jobId"));
				employeesDto.setHireId(rs.getInt("hireId"));
				
				empFileDto.setEmpId(rs.getInt("empId"));
				empFileDto.setFaceOriginal(rs.getString("faceOriginal"));
				empFileDto.setFaceSaveName(rs.getString("faceSaveName"));
				empFileDto.setDegreeOriginal(rs.getString("degreeOriginal"));
				empFileDto.setDegreeSaveName(rs.getString("degreeSaveName"));
				empFileDto.setJoinOriginal(rs.getString("joinOriginal"));
				empFileDto.setJoinSaveName(rs.getString("joinSaveName"));
				empFileDto.setSaveFolder(rs.getString("saveFolder"));
				//employeesDto.setCareerDate(rs.getInt("career_period1"));
				map.put("employeesDto", employeesDto);
				map.put("empFileDto",empFileDto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
			System.out.println("=====DB modifyInfo =====");
		}

		return map;
	}

	@Override
	public int insert(EmployeesDto employeesDto, EmpFileDto empFileDto) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			StringBuffer sql = new StringBuffer();
			System.out.println("=====DB insert  =====");
			/*sql.append("insert ALL \n");
			sql.append("INTO basic VALUES (?,?,?,?,?,?,?,?,?,?,   \n");
			sql.append("                   ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)  \n");
			sql.append("INTO empfile VALUES (?,?,?,?,?,?,?,?)  \n");
			sql.append("select *   \n");
			sql.append("from dual \n");*/
			
			sql.append("insert INTO basic \n");
			sql.append("VALUES (?,?,?,?,?,?,?,?,?,?,   \n");
			sql.append("        ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)  \n");
			
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 0;
			pstmt.setInt(++idx, employeesDto.getEmpId());
			pstmt.setString(++idx, employeesDto.getEmpPw());
			pstmt.setString(++idx, employeesDto.getEmpName());
			pstmt.setInt(++idx, employeesDto.getDeptId());
			pstmt.setInt(++idx, employeesDto.getJobId());
			pstmt.setString(++idx, employeesDto.getEmpRegNumber1());
			pstmt.setString(++idx, employeesDto.getEmpRegNumber2());
			pstmt.setString(++idx, employeesDto.getEmpPhone1());
			pstmt.setString(++idx, employeesDto.getEmpPhone2());
			pstmt.setString(++idx, employeesDto.getEmpPhone3());
			pstmt.setString(++idx, employeesDto.getEmpExtention1());
			pstmt.setString(++idx, employeesDto.getEmpExtention2());
			pstmt.setString(++idx, employeesDto.getEmpExtention3());
			pstmt.setString(++idx, employeesDto.getEmpEmail1());
			pstmt.setString(++idx, employeesDto.getEmpEmail2());
			pstmt.setString(++idx, employeesDto.getEmpBirth());
			pstmt.setString(++idx, employeesDto.getEmpFinalEdu());
			pstmt.setString(++idx, employeesDto.getEmpHireDate());
			pstmt.setInt(++idx, employeesDto.getHireId());
			pstmt.setString(++idx, employeesDto.getEmpDetail());
			pstmt.setInt(++idx, employeesDto.getAppointId());
			pstmt.setInt(++idx, employeesDto.getAnniId());
			pstmt.setString(++idx, employeesDto.getZipNo());
			pstmt.setString(++idx, employeesDto.getRoadAddrPart1());
			pstmt.setString(++idx, employeesDto.getJibunAddr());
			pstmt.setString(++idx, employeesDto.getAddrDetail());
			
			cnt += pstmt.executeUpdate();
			//pstmt = null;		
			sql.setLength(0);  
			conn.commit();		
			
			sql.append("insert INTO empfile VALUES (?,?,?,?,?,?,?,?)  \n");
			pstmt = conn.prepareStatement(sql.toString());
			idx = 0;
			
			pstmt.setInt(++idx, empFileDto.getEmpId());
			pstmt.setString(++idx, empFileDto.getFaceOriginal());
			pstmt.setString(++idx, empFileDto.getFaceSaveName());
			pstmt.setString(++idx, empFileDto.getDegreeOriginal());
			pstmt.setString(++idx, empFileDto.getDegreeSaveName());
			pstmt.setString(++idx, empFileDto.getJoinOriginal());
			pstmt.setString(++idx, empFileDto.getJoinSaveName());
			if(empFileDto.getFaceOriginal() == "noimages.jpg"){
				pstmt.setString(++idx, "");
			}else{
				pstmt.setString(++idx,empFileDto.getSaveFolder());
			}
			
			cnt += pstmt.executeUpdate();
			pstmt = null;		//pstmt �ʱ�ȭ
			sql.setLength(0);  //sql �ʱ�ȭ
			conn.commit();
			
			sql.append("insert INTO salary VALUES (?,?,?,?,?,?)  \n");
			pstmt = conn.prepareStatement(sql.toString());
			idx = 0;
			pstmt.setInt(++idx, employeesDto.getEmpId());
			pstmt.setInt(++idx, 0);
			pstmt.setInt(++idx, 0);
			pstmt.setInt(++idx, 0);
			pstmt.setInt(++idx, 0);
			pstmt.setInt(++idx, 0);
			cnt += pstmt.executeUpdate();
			pstmt = null;		//pstmt �ʱ�ȭ
			sql.setLength(0);  //sql �ʱ�ȭ
			conn.commit();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("=====DB modfiy =====");
		}
		return cnt;
	}

	@Override
	public EmpFileDto delete(String id) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmpFileDto empFileDto = new EmpFileDto();
		int empId =Integer.parseInt(id);
		try {
			
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			StringBuffer sql = new StringBuffer();

			System.out.println("=====DB delete  =====");
			//////////////////////////////////////////////////////////////////
			sql.append("SELECT * \n");
			sql.append("FROM empfile \n");
			sql.append("WHERE empId = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, empId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				empFileDto.setEmpId(Integer.parseInt(rs.getString("empId")));
				empFileDto.setFaceOriginal(rs.getString("faceOriginal"));
				empFileDto.setFaceSaveName(rs.getString("faceSaveName"));
				empFileDto.setDegreeOriginal(rs.getString("degreeOriginal"));
				empFileDto.setDegreeSaveName(rs.getString("degreeSaveName"));
				empFileDto.setJoinOriginal(rs.getString("joinOriginal"));
				empFileDto.setJoinSaveName(rs.getString("joinSaveName"));
				empFileDto.setSaveFolder(rs.getString("saveFolder"));
			}
			sql.setLength(0);  //sql �ʱ�ȭ
			pstmt = null;
			conn.commit();
			////////////////////////////////////////////////////////
			sql.append("DELETE \n");
			sql.append("FROM empfile \n");
			sql.append("WHERE empId = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 0;
			pstmt.setInt(++idx, empId);
			cnt += pstmt.executeUpdate();
			sql.setLength(0);  //sql �ʱ�ȭ
			pstmt = null;
			conn.commit();
			////////////////////////////////////////////////////////
			sql.append("DELETE \n");
			sql.append("FROM license \n");
			sql.append("WHERE empId = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			idx = 0;
			pstmt.setInt(++idx, empId);
			cnt += pstmt.executeUpdate();
			sql.setLength(0);  //sql �ʱ�ȭ
			pstmt = null;
			conn.commit();
			/////////////////////////////////////////////////////////
			sql.append("DELETE \n");
			sql.append("FROM salary \n");
			sql.append("WHERE empId = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			idx = 0;
			pstmt.setInt(++idx, empId);
			
			cnt += pstmt.executeUpdate();
			sql.setLength(0);  //sql �ʱ�ȭ
			pstmt = null;
			conn.commit();
			//////////////////////////////////////////////////////////
			
			sql.append(" DELETE \n");
			sql.append("FROM basic \n");
			sql.append("WHERE empId = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			idx = 0;
			pstmt.setInt(++idx, empId);
			cnt += pstmt.executeUpdate();
			sql.setLength(0);  //sql �ʱ�ȭ
			pstmt = null;
			conn.commit();
			/////////////////////////////////////////////////////////////
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("=====DB delete =====");
		}

		return empFileDto;
	}

	@Override
	public EmpFileDto empFileDto(int empId) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmpFileDto empFileDto = new EmpFileDto();
		
	try {
			
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
		
			System.out.println("=====DB empFileDto  =====");

			sql.append("SELECT * \n");
			sql.append("FROM empfile \n");
			sql.append("WHERE empId = ? \n");
	
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, empId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				empFileDto.setEmpId(rs.getInt("empId"));
				empFileDto.setFaceOriginal(rs.getString("faceOriginal"));
				empFileDto.setFaceSaveName(rs.getString("faceSaveName"));
				empFileDto.setDegreeOriginal(rs.getString("degreeOriginal"));
				empFileDto.setDegreeSaveName(rs.getString("degreeSaveName"));
				empFileDto.setJoinOriginal(rs.getString("joinOriginal"));
				empFileDto.setJoinSaveName(rs.getString("joinSaveName"));
				empFileDto.setSaveFolder(rs.getString("saveFolder"));
			}
			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("=====DB empFileDto =====");
		}

		return empFileDto;
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
	       
	      }
	      return totalCount;
	   }

	@Override
	public List<Map<String, String>> insertInfo(String param) {
		List<Map<String, String>> list  = new ArrayList<Map<String, String>>();
		Map<String, String> map = null;
//		Map<String, String> map2 = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			System.out.println("=====DB insertInfo=====");
			
			if("dept".equals(param)){
				sql.append("SELECT * \n");
				sql.append("FROM department \n");
				
				pstmt = conn.prepareStatement(sql.toString());
				rs = pstmt.executeQuery();
				while(rs.next()) {
					map = new HashMap<String, String>();
					map.put("highDept", rs.getString("highDept"));
					map.put("deptId", rs.getInt("deptId")+"");
					map.put("deptName", rs.getString("deptName"));
					
					list.add(map);
				}
				
			}else if("jobs".equals(param)){
				sql.append("SELECT * \n");
				sql.append("FROM jobs \n");
				pstmt = conn.prepareStatement(sql.toString());
				rs = pstmt.executeQuery();
				while(rs.next()) {
					map = new HashMap<String, String>();
					map.put("jobName", rs.getString("jobname"));
					map.put("jobId", rs.getString("jobid"));
					list.add(map);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
			System.out.println("=====DB insertInfo =====");
		}
		return list;
	}
	
	@Override
	public EmployeesDto login(Map<String, String> map) {
		EmployeesDto employeesDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select * \n");
			sql.append("from basic \n");
			sql.append("where empId = ? and empPw = ?");
			pstmt = conn.prepareStatement(sql.toString());
			int idx=0;
			pstmt.setInt(++idx, Integer.parseInt(map.get("userid")));
			pstmt.setString(++idx, map.get("userpass"));
			rs = pstmt.executeQuery();
			if(rs.next()){
				employeesDto = new EmployeesDto();	
				employeesDto.setEmpId(rs.getInt("empId"));
				employeesDto.setEmpName(rs.getString("empName"));
				employeesDto.setDeptId(rs.getInt("deptId"));
				employeesDto.setJobId(rs.getInt("jobId"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		return employeesDto;
	}

	@Override
	public String searchDept(int deptId) {
		String deptName = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select deptName \n");
			sql.append("from department \n");
			sql.append("where deptId = ?");
			pstmt = conn.prepareStatement(sql.toString());
			int idx=0;
			pstmt.setInt(++idx, deptId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				deptName = rs.getString("deptName");
			}
		} catch (SQLException e){
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		return deptName;
	}

	@Override
	public String searchJob(int jobId) {
		String jobName = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select jobName \n");
			sql.append("from jobs \n");
			sql.append("where jobId = ?");
			pstmt = conn.prepareStatement(sql.toString());
			int idx=0;
			pstmt.setInt(++idx, jobId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				jobName = rs.getString("jobName");
			}
		} catch (SQLException e){
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		return jobName;
	}
	
	

}
