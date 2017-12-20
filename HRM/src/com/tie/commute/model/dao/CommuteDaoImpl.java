package com.tie.commute.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.tie.commute.model.AttendanceDto;
import com.tie.util.DB.DBClose;
import com.tie.util.DB.DBConnection;

public class CommuteDaoImpl implements CommuteDao{

	private static CommuteDao commuteDao;

	static{
		commuteDao = new CommuteDaoImpl();
	}


	public static CommuteDao getCommuteDao() {
		return commuteDao;
	}

	@Override
	public List<AttendanceDto> commuteList(String empId) {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<AttendanceDto> list = null;

		try {

			conn = DBConnection.makeConnection();
			System.out.println("연결");
			
			StringBuffer sql = new StringBuffer();
			sql.append("select * from commute where empid = ?\n");

			pstmt = conn.prepareStatement(sql.toString());
			int num = Integer.parseInt(empId);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();
			list = new ArrayList<AttendanceDto>();
			while(rs.next()){
				AttendanceDto attendanceDto = new AttendanceDto();
				attendanceDto.setAttendSeq(rs.getInt("attendseq"));
				attendanceDto.setAttendStart(rs.getString("attendstart"));
				attendanceDto.setAttendEnd(rs.getString("attendend"));
				attendanceDto.setAttendGo(rs.getString("attendgo"));
				attendanceDto.setAttendLeave(rs.getString("attendleave"));
				attendanceDto.setEmpId(rs.getInt("empid"));
				list.add(attendanceDto);	
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
	public int commuteInsert(Map<String, String> map) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			String date = map.get("date");
			String status = map.get("status");
			int empId =  Integer.parseInt(map.get("empId"));

			StringBuffer sql = new StringBuffer();

			sql.append("insert into commute\n");
			sql.append("(attendseq, attendstart, attendgo, empid)\n");
			sql.append("values(commute_seq.nextval, ?,?,?)\n");

			int idx = 0;
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(++idx, date);
			pstmt.setString(++idx, status);
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
	public int commuteUpdate(Map<String, String> map) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			String date = map.get("date");
			String status = map.get("status");
			int empId =  Integer.parseInt(map.get("empId"));

			String cp = date.substring(0, 10);

			StringBuffer sql = new StringBuffer();
			sql.append("update commute set attendend=?, attendleave=? where empid = ?\n");
			sql.append("and attendstart like '" + cp + "%'\n");
			pstmt = conn.prepareStatement(sql.toString());

			int idx = 0;

			pstmt.setString(++idx, date);
			pstmt.setString(++idx, status);
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
	public int commutsSelect(Map<String, String> map) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		int cnt= 0;

		try {

			conn = DBConnection.makeConnection();
			System.out.println("연결");
			
			String cp = map.get("date").substring(0, 10);
			String empId = map.get("empId");
			
			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) from commute where attendstart like '" + cp + "%' and empid = "+ empId +"\n");

			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			if(rs.next()){
				cnt = rs.getInt("count(*)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
			System.out.println("연결종료");
		}
		return cnt;
	}


}
