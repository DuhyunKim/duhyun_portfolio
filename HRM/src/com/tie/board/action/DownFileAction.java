package com.tie.board.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.board.model.dao.BoardDaoImpl;
import com.tie.util.StringCheck;

public class DownFileAction implements Action {
	
	public String getContentType() {
		return "application/octet-stream"; //占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙 占쏙옙占쏙옙占쏙옙 占싣니띰옙 占쌕울옙琯占� 占쏙옙 占쏙옙 占쌍댐옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙환占쏙옙占쏙옙.
	
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response){
		try {
			String realPath = request.getServletContext().getRealPath("/upload");
			int bbsSeq = StringCheck.nullToOne(request.getParameter("bbsSeq"));
			Map<String, String> map = BoardDaoImpl.getBoarddao().getBoardFile(bbsSeq);
			String savefolder = "";
			String fn = "";
			if(map.get("boardFileName") != null && map.get("boardFileLocation") != null){
				fn = map.get("boardFileName");
				savefolder = map.get("boardFileLocation"); 
			}
			realPath = realPath + File.separator + savefolder;
			File downFile = new File(realPath, fn);
			
			response.setContentType(getContentType());
			fn = new String(fn.getBytes("utf-8"), "iso-8859-1");
			
			response.setHeader("Content-disposition", "attachment; filename="+fn);
			FileInputStream fis = new FileInputStream(downFile);
			OutputStream out = response.getOutputStream();
			int read = 0;
			byte b[] = new byte[(int) downFile.length()];
			
			while((read = fis.read(b)) != -1 ){
				out.write(b, 0, read);
			}
			fis.close();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

}
