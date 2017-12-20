package com.tie.appoint.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tie.appoint.model.AppointsDto;
import com.tie.appoint.model.PersonnalDto;
import com.tie.basic.model.EmployeesDto;
import com.tie.util.DB.DBClose;
import com.tie.util.DB.DBConnection;

public class AppointDaoImpl implements AppointDao {
	
	private static AppointDao appointDao;
	
	static {
		appointDao = new AppointDaoImpl();
	}
	
	private AppointDaoImpl() {}
	
	public static AppointDao getMemberDao() {
		return appointDao;
	}

	@Override
	public Map<String,List<Object>> appointList(Map<String, String> map) {
		List<Object> list1 = new ArrayList<Object>();
		List<Object> list2 = new ArrayList<Object>();
		List<Object> list3 = new ArrayList<Object>();
		String val = map.get("val");
		int empId = Integer.parseInt(map.get("empId"));
		Map<String, List<Object>> map1 = new HashMap<String,List<Object>>();  
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			
			int currentPage = Integer.parseInt(map.get("currentPage"));
			System.out.println("currentPage: "+currentPage);
			StringBuffer sb = new StringBuffer();
			sb.append("select r, empid, personnaldate, personnalunusual, appointid, appointname, empname, personalseq\n");
			sb.append("from (select rownum r, empid, personnaldate, personnalunusual, appointid, appointname, empname, personalseq\n");
			sb.append("from (select b.empid, personnaldate, personnalunusual, d.appointid, appointname, empname, a.personalseq\n");
			sb.append("from appoint a, appointdivision d, basic b\n");
			sb.append("where b.empid = a.empid and \n");
			sb.append("d.appointid = a.appointid\n");
			if(!("전체".equals(val))) {
				sb.append("and appointname = ? \n");
			}
			if(empId > 0){
				sb.append("and b.empid = ? \n");
			}
			sb.append("order by personalseq desc))\n");
			sb.append("where r>=? and r<=?\n");
	
	
			pstmt = conn.prepareStatement(sb.toString());
			int idx = 0;
			if(!("전체".equals(val))) {
				pstmt.setString(++idx, val);
			}
			if(empId > 0){
				pstmt.setInt(++idx, empId);
			}
			pstmt.setInt(++idx, (currentPage*7)-6);
			pstmt.setInt(++idx, currentPage*7);
			rs = pstmt.executeQuery();
			
			PersonnalDto personnalDto = null;
			AppointsDto appointsDto = null;
			EmployeesDto employeesDto = null;
			
			while(rs.next()) {			
				personnalDto = new PersonnalDto();
				appointsDto = new AppointsDto();
				employeesDto = new EmployeesDto();
				
				personnalDto.setEmpId(rs.getInt("empid"));
				personnalDto.setPersonnalDate(rs.getString("personnaldate"));
				personnalDto.setPersonnalUnusual(rs.getString("personnalunusual"));
			
				personnalDto.setAppointId(rs.getString("appointid"));
				personnalDto.setPersonnalSeq(rs.getInt("personalseq"));
				
				list1.add(personnalDto);
				
				appointsDto.setAppointName(rs.getString("appointname"));
				list2.add(appointsDto);
				
				employeesDto.setEmpName(rs.getString("empname"));
				list3.add(employeesDto);
				
			}
			map1.put("list1", list1);
			map1.put("list2", list2);
			map1.put("list3", list3);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return map1;
	}

	@Override
	public int appointDelete(int seq) {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";

			sql += "delete from appoint \n";
			sql += "where personalseq = ?\n";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			
			result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBClose.close(conn,pstmt);
			}
			return result;
	}

	@Override
	public int appointUpdate(Map<String, String> map) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			
			int getAppointId = getAppointId(map.get("keysearchname"));
			
			String sql = "update appoint\n";
			sql += "set personnaldate = ?, \n";
			sql += "personnalunusual = ?, \n";
			sql += "appointid = ? \n";
			sql += "where personalseq = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, map.get("keycalender"));
			pstmt.setString(2, map.get("keycontext"));
			pstmt.setInt(3, getAppointId);
			pstmt.setString(4, map.get("keyseq"));
			//pstmt.setInt(1, seq);
		
			result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBClose.close(conn,pstmt);
			}
			return result;
	}

	@Override
	public int getAppointId(String appointName) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			//sql.append("select * from abc");
			sql.append("select appointid \n"); 
			sql.append("from appointdivision  \n"); 
			sql.append("where appointname = ? \n"); 
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, appointName);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt("appointid");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return result;
	}
	
	@Override
	public List<String> getEmpName() {
		List<String> list = new ArrayList<String>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			//sql.append("select * from abc");
			sql.append("select empname \n"); 
			sql.append("from basic  \n"); 
			
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				list.add(rs.getString("empname"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public int insert(List<String> list) {
		int result = 0;
		
		String date = list.get(0);
		String empname = list.get(1);
		int searchId = Integer.parseInt(list.get(2));
		String context = list.get(3);
		
		int getEmpId = getEmpId(empname);      // �̸����� ���Ȯ��
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "insert into appoint values(personalseq.nextval,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getEmpId);
			pstmt.setString(2, date);
			pstmt.setString(3, context);
			pstmt.setInt(4, searchId);
			System.out.println("test engus: " + searchId);
		
			result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBClose.close(conn,pstmt);
			}
		return result;
	}
	
	@Override
	public int getEmpId(String empName) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			//sql.append("select * from abc");
			sql.append("select empid \n"); 
			sql.append("from basic \n"); 
			sql.append("where empname = ? \n"); 
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, empName);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt("empid");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return result;
	}

	@Override
	public int totalCountList() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalCount = 0;
		try {
			conn = DBConnection.makeConnection();	
			StringBuffer sb = new StringBuffer();
			sb.append("select count(*) from appoint\n");

			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				totalCount = rs.getInt("count(*)");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return totalCount;
	}
}
