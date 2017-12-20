package com.tie.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tie.board.model.BoardCommentDto;
import com.tie.board.model.BoardDto;
import com.tie.board.model.BoardFileDto;
import com.tie.util.DB.DBClose;
import com.tie.util.DB.DBConnection;

public class BoardDaoImpl implements BoardDao {
	
	private static BoardDao boarddao;
	
	static{
		boarddao = new BoardDaoImpl();
	}
	
	private BoardDaoImpl(){}
		
	public static BoardDao getBoarddao() {
		return boarddao;
	}
	@Override
	public List<BoardDto> boardList(Map<String, String> map) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("select r, b.* \n");
		sql.append("from  \n");
		sql.append("( \n");
		sql.append("	select rownum r, a.* \n");
		sql.append("	from \n");
		sql.append("	( \n");
		sql.append("		select bbsseq, bbsdate, bbsvc, bbsename, bbstitle, bbscontent, \n");
		sql.append("		(select count(*) cnt from boardcomment c \n");
		sql.append("		 where c.bbsseq = b.bbsseq) commentcnt \n");
		sql.append("		 from board b \n");
		sql.append("		 where bbsformnum = 1 \n");
		String word = map.get("word");
		if(!word.isEmpty())
			sql.append("and bbstitle like '%'||?||'%' or bbscontent like '%'||?||'%' \n");
		sql.append("		order by bbsseq desc \n");
		sql.append("	) a \n");
		sql.append("	where rownum <= ? \n");
		sql.append(") b \n");
		sql.append("where r > ?");
		int idx = 0;
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			if(!word.isEmpty()){
				pstmt.setString(++idx, word);
				pstmt.setString(++idx, word);
			}
			pstmt.setString(++idx, map.get("end"));
			pstmt.setString(++idx, map.get("start"));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardDto boardDto = new BoardDto();				
				boardDto.setBbsSeq(rs.getInt("bbsseq"));
				boardDto.setBbsDate(rs.getString("bbsdate"));
				boardDto.setBbsVc(rs.getString("bbsvc"));
				boardDto.setBbsEname(rs.getString("bbsename"));
				boardDto.setBbsTitle(rs.getString("bbstitle"));
				boardDto.setBbsContent(rs.getString("bbscontent"));
				boardDto.setCommentCount(rs.getInt("commentcnt"));
				list.add(boardDto);
					
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public int pageCount(String word) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("select count(*) cnt \n");
		sql.append("from board \n");
		sql.append("where bbsformnum = 1 \n");
		if(!word.isEmpty())
			sql.append("and bbstitle like '%'||?||'%' or bbscontent like '%'||?||'%' ");
		int idx = 0;
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			;
			if(!word.isEmpty()){
				pstmt.setString(++idx, word);
				pstmt.setString(++idx, word);
			}
			rs = pstmt.executeQuery();
			if(rs.next()){
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		return cnt;
	}
	
	@Override
	public int boardWrite(Map<String, Object> map) {
		int cnt = 0;
		BoardDto boardDto = (BoardDto) map.get("boardDto");
		BoardFileDto boardFileDto = (BoardFileDto) map.get("boardFileDto");
		Connection conn = null;
		PreparedStatement pstmt = null;		
		StringBuffer sql = new StringBuffer();
		sql.append("insert into board \n");
		if(boardFileDto != null)
			sql.append("values(?, sysdate, 0, ?, ?, ?, ?, 1) \n");						
		else
			sql.append("values(board_seq.nextval, sysdate, 0, ?, ?, ?, ?, 1) \n");						
		
		int idx = 0;
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			if(boardFileDto != null)
				pstmt.setInt(++idx, boardFileDto.getBbsSeq());
			pstmt.setString(++idx, boardDto.getBbsEname());
			pstmt.setString(++idx, boardDto.getBbsTitle());
			pstmt.setString(++idx, boardDto.getBbsContent());
			pstmt.setInt(++idx, boardDto.getEmpId());
			cnt = pstmt.executeUpdate();
			
			if(boardFileDto.getBoardFileName() != null)
				cnt = boardFileWrite(boardFileDto);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}

	@Override
	public int boardUpdate(Map<String, String> map) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("update board \n");
		sql.append("set bbstitle = ?, bbscontent = ? \n");
		sql.append("where bbsseq = ? \n");
		sql.append("and bbsformnum = 1 \n");
		
		int idx=0;
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(++idx, map.get("bbs_title"));
			pstmt.setString(++idx, map.get("bbs_content"));
			pstmt.setString(++idx, map.get("bbs_seq"));
			cnt = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		return cnt;
	}

	@Override
	public Map<String, Object> boardSelect(int bbsSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		BoardDto boardDto = null;
		BoardFileDto boardFileDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//int cnt = isBoardFile(bbsSeq);
		Map<String, String> map2 = getBoardFile(bbsSeq);
		
		StringBuffer sql = new StringBuffer();
		sql.append("select bbsdate, bbsvc, bbsename, bbstitle, bbscontent, empid \n");
		sql.append("from board \n");
		sql.append("where bbsseq = ? \n");
		sql.append("and bbsformnum = 1 ");
		
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsSeq);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				boardDto = new BoardDto();				
				boardDto.setBbsSeq(bbsSeq);
				boardDto.setBbsDate(rs.getString("bbsdate"));
				boardDto.setBbsVc(rs.getString("bbsvc"));
				boardDto.setBbsEname(rs.getString("bbsename"));
				boardDto.setBbsTitle(rs.getString("bbstitle"));
				boardDto.setBbsContent(rs.getString("bbscontent"));
				boardDto.setEmpId(rs.getInt("empid"));
				map.put("boardDto", boardDto);
				
				if(map2.get("boardFileName") != null && map2.get("boardFileLocation") != null){
					boardFileDto = new BoardFileDto();
					boardFileDto.setBoardFileName(map2.get("boardFileName"));
					boardFileDto.setBoardFileLocation(map2.get("boardFileLocation"));
					map.put("boardFileDto", boardFileDto);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		return map;
	}

	@Override
	public int boardDelete(int bbsSeq) {
		int cnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("delete boardcomment \n");
		sql.append("where bbsseq = ?");
		
		StringBuffer sql2 = new StringBuffer();
		sql2.append("delete boardfile \n");
		sql2.append("where bbsseq = ?");
				
		StringBuffer sql3 = new StringBuffer();
		sql3.append("delete board \n");
		sql3.append("where bbsseq = ? \n");
		sql3.append("and bbsformnum = 1");
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);	
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsSeq);
			cnt = pstmt.executeUpdate();
			conn.commit();
			pstmt = conn.prepareStatement(sql2.toString());
			pstmt.setInt(1, bbsSeq);
			cnt = pstmt.executeUpdate();
			conn.commit();
			pstmt = conn.prepareStatement(sql3.toString());
			pstmt.setInt(1, bbsSeq);
			cnt = pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}

	@Override
	public int boardVc(int bbsSeq) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("update board \n");
		sql.append("set bbsvc = bbsvc + 1 \n");
		sql.append("where bbsseq = ? ");
		
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsSeq);
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}

	@Override
	public int reboardWrite(BoardCommentDto boardCommentDto) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("insert into boardcomment \n");
		sql.append("values(boardcomment_seq.nextval, ?, ?, ?, ?, sysdate)");
		
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardCommentDto.getBbsSeq());
			pstmt.setInt(2, boardCommentDto.getBbsCommentEnum());
			pstmt.setString(3, boardCommentDto.getBbsCommentEname());
			pstmt.setString(4, boardCommentDto.getBbsCommentContent());			
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}

	@Override
	public List<BoardCommentDto> boardReply(int bbsSeq) {
		List<BoardCommentDto> list = new ArrayList<BoardCommentDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("select * \n");
		sql.append("from boardcomment \n");
		sql.append("where bbsseq = ? \n");
		sql.append("order by bbscommentdate \n");
			
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsSeq);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardCommentDto boardCommentDto = new BoardCommentDto();
				boardCommentDto.setBbsCommentNum(rs.getInt("bbscommentnum"));
				boardCommentDto.setBbsCommentEnum(rs.getInt("bbscommentenum"));
				boardCommentDto.setBbsCommentEname(rs.getString("bbscommentename"));
				boardCommentDto.setBbsCommentContent(rs.getString("bbscommentcontent").replaceAll("\n", "<br>"));
				boardCommentDto.setBbsCommentDate(rs.getString("bbscommentdate"));
				
				list.add(boardCommentDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public int getBoardSeq() {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("select board_seq.nextval from dual");
			
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return cnt;
	}

	@Override
	public int boardFileUpdate(BoardFileDto boardFileDto) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("update boardfile \n");
		sql.append("set boardfilename = ?, boardfilerename = ?, \n");
		sql.append("boardfilelocation = ? \n");
		sql.append("where bbsseq = ? ");
		
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, boardFileDto.getBoardFileName());
			pstmt.setString(2, boardFileDto.getBoardFileRename());
			pstmt.setString(3, boardFileDto.getBoardFileLocation());
			pstmt.setInt(4, boardFileDto.getBbsSeq());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}

	@Override
	public int boardFileWrite(BoardFileDto boardFileDto) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("insert into boardfile \n");
		sql.append("values(boardfile_seq.nextval, ?, ?, ?, ?) \n");
		
		int idx = 0;
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());	
			pstmt.setInt(++idx, boardFileDto.getBbsSeq());
			pstmt.setString(++idx, boardFileDto.getBoardFileName());
			pstmt.setString(++idx, boardFileDto.getBoardFileRename());
			pstmt.setString(++idx, boardFileDto.getBoardFileLocation());
			
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}

	@Override
	public int reBoardUpdate(Map<String, String> map) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("update boardcomment \n");
		sql.append("set bbscommentcontent = ? \n");
		sql.append("where bbscommentnum = ? ");
		
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, map.get("commentContent"));
			pstmt.setString(2, map.get("commentSeq"));
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}

	@Override
	public int reBoardDelete(int commentSeq) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("delete boardcomment \n");
		sql.append("where bbscommentnum = ?");
		
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, commentSeq);
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}

	@Override
	public Map<String, String> getBoardFile(int bbsSeq) {
		Map<String, String> map = new HashMap<String, String>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("select boardfilename, boardfilelocation \n");
		sql.append("from boardfile \n");
		sql.append("where bbsseq = ? ");
		
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsSeq);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				map.put("boardFileName", rs.getString("boardfilename"));
				map.put("boardFileLocation", rs.getString("boardfilelocation"));
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		return map;
	}
}
