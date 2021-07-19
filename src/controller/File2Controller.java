package controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import boardconfig.FileConfig;
import dao.Board2DAO;
import dao.File2DAO;


@WebServlet("*.file2")
public class File2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		
		String cmd = uri.substring(ctxPath.length());
		
		Board2DAO dao = Board2DAO.getInstance();
		File2DAO fdao = File2DAO.getInstance();
		
		request.setCharacterEncoding("utf-8");
		
		try {
		if(cmd.contentEquals("/download.file2")) {
			String oriName2 = request.getParameter("oriName");
			String sysName2 = request.getParameter("sysName");
			String filePath2 = request.getServletContext().getRealPath("files");
			
			File targetFile = new File(filePath2+"/"+sysName2);
			
			FileInputStream fis = new FileInputStream(targetFile);
			DataInputStream dis = new DataInputStream(fis);
			DataOutputStream dos = new DataOutputStream(response.getOutputStream());
			
			byte[] fileSpace = new byte[(int)targetFile.length()];
			dis.readFully(fileSpace);
			
			oriName2 = new String(oriName2.getBytes("utf-8"),"iso-8859-1");
			
			response.reset();
			response.setContentType("application/octet-stream");
			response.setHeader("content-disposition","attachment; filename=\""+oriName2+"\"");
			
			dos.write(fileSpace);
			dos.flush();
			
			
		}else if(cmd.contentEquals("/upload.file2")) {
			String filePath = request.getServletContext().getRealPath("files");
			File fileFolder = new File(filePath);
			System.out.println("파일저장 경로는 "+filePath);
			if(!fileFolder.exists()) {fileFolder.mkdir();}
		
			MultipartRequest multi = new MultipartRequest(request, filePath, FileConfig.uploadMaxSize,"utf-8",new DefaultFileRenamePolicy());
			
			
			String oriName = multi.getOriginalFileName("file");
			String sysName = multi.getFilesystemName("file");
			
			
			
			String returnPath = "/files/"+sysName;
			
			JsonObject obj = new JsonObject();
			obj.addProperty("returnPath", returnPath);
			obj.addProperty("oriName", oriName);
			obj.addProperty("sysName", sysName);
			
			
	
			List<String> ingFileList =(List<String>) request.getSession().getAttribute("ingFileList");
			ingFileList.add(sysName);
   		    request.getSession().setAttribute("filePath",filePath);

   		    response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append(obj.toString());
			
		}else if(cmd.contentEquals("/deleteImg.file")) {
			
			String src = request.getParameter("src");
			String[] split = src.split("/files/");
			String sysName = split[1];
					
			String filePath = request.getServletContext().getRealPath("files");
			File targetImg = new File(filePath+"/"+sysName);
			
			
			int delImgDb=0;
			if(targetImg.exists()) {
			boolean delResult = targetImg.delete();
			if(delResult) {
				delImgDb=fdao.delete(sysName);
				}			
			}
			response.getWriter().append(Integer.toString(delImgDb));
			
		}else if(cmd.contentEquals("/unload.file")) {
			List<String> ingFileList =(List<String>) request.getSession().getAttribute("ingFileList");
			String filePath = (String) request.getSession().getAttribute("filePath");
			
			for(int i=0; i<ingFileList.size();i++) {
				boolean result =fdao.fileSaved(ingFileList.get(i));
				
				if(!result) {
					File targetFile = new File(filePath+"/"+ingFileList.get(i));
					targetFile.delete();
				}
			}

			List<String> reset = new ArrayList<>();
			request.getSession().setAttribute("ingFileList", reset);
			
		}
		
		
		
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
