package com.tie.document.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tie.document.model.DocumentDto;
import com.tie.document.model.SettlementDto;
import com.tie.license.model.LicenseDto;
import com.tie.util.DB.DBClose;
import com.tie.util.DB.DBConnection;

public class DocumentDaoImpl implements DocumentDao{

	private static DocumentDao documentDao;

	static{
		documentDao = new DocumentDaoImpl();
	}

	public static DocumentDao getDocumentDao() {
		return documentDao;
	}

	@Override
	public List<SettlementDto> documentList(int empId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int documentInsert(List<SettlementDto> list) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		int cnt = 0;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			conn.setAutoCommit(false);
			StringBuffer sql = new StringBuffer();

			sql.append("select document_seq.nextval from dual\n");

			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			int nextNum = 0;

			if(rs.next()){
				nextNum = rs.getInt(1);
			}
			conn.commit();
			
			if(list != null){
				sql = new StringBuffer();
				sql.append("insert into document\n");
				sql.append("(docid, empid, doctypeid, stateseq, docname, docdate, doccontent, docddate)\n");
				sql.append("values(?,?,?,?,?,sysdate,?,?)\n");

				int idx = 0;

				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(++idx, nextNum);
				pstmt.setInt(++idx, list.get(0).getEmpId());
				pstmt.setInt(++idx, list.get(0).getDocTypeId());
				pstmt.setInt(++idx, 0);
				pstmt.setString(++idx, list.get(0).getDocName());
				pstmt.setString(++idx, list.get(0).getDocContent());
				pstmt.setString(++idx, list.get(0).getDocDDate());
				cnt = pstmt.executeUpdate();

				conn.commit();

				if(cnt != 0){
					for(SettlementDto i:list){
						sql = new StringBuffer();
						sql.append("insert into settlement\n");
						sql.append("(SIGNSTATE, DOCID, EMPID, SIGNSTEP)\n");
						sql.append("values(?,?,?,?)\n");
						
						pstmt = conn.prepareStatement(sql.toString());
						
						pstmt.setInt(1, 0);
						pstmt.setInt(2, nextNum);
						pstmt.setInt(3, i.getPersonId());
						pstmt.setInt(4, i.getSignStep());

						cnt = pstmt.executeUpdate();

						conn.commit();
					}
				}
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
	public int documentUpdate(int docId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int documentDelete(int docId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, String>> personSearch(Map<String, String> map) {
		// TODO Auto-generated method stub
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();

			String key = map.get("key");
			String word = map.get("word");
			System.out.println("=====DB personList=====");
			StringBuffer sql = new StringBuffer();
			sql.append("select b.empid, b.empname, d.deptname, j.jobname \n");
			sql.append("from basic b, department d, jobs j \n");
			sql.append("where b.deptid = d.deptid \n");
			sql.append("and b.jobid = j.jobid \n");
			if(word != ""){
				if("이름".equals(key)){
					sql.append("and b.empname like '%'||?||'%' \n");
				}else if("부서".equals(key)){
					sql.append("and d.deptname like '%'||?||'%' \n");
				}else if("직급".equals(key)){
					sql.append("and j.jobname like '%'||?||'%' \n");
				}
			}
			sql.append("order by b.empid desc \n");
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 0;
			if(word != ""){
				pstmt.setString(++idx, word);
			}
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Map<String, String> person = new HashMap<String, String>();
				person.put("empid", rs.getString("empid"));
				person.put("empname", rs.getString("empname"));
				person.put("deptname", rs.getString("deptname"));
				person.put("jobname", rs.getString("jobname"));
				list.add(person);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
			System.out.println("=====DB personList=====");
		}

		return list;
	}
}
