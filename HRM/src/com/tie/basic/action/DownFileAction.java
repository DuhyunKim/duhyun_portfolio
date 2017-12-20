package com.tie.basic.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;

public class DownFileAction implements Action {
	public String getContentType() {
		return "application/octet-stream"; 
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
		String realPath = request.getServletContext().getRealPath("/upload");
		String savefolder = request.getParameter("location");
		realPath = realPath + File.separator + savefolder;
		String fn = request.getParameter("filename");
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