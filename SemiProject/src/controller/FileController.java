package controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
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
import dao.BoardDAO;
import dao.FileDAO;


@WebServlet("*.file")
public class FileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		
		String cmd = uri.substring(ctxPath.length());
		
		BoardDAO dao = BoardDAO.getInstance();
		FileDAO fdao = FileDAO.getInstance();
		
		try {
		if(cmd.contentEquals("/download.file")) {
			String oriName = request.getParameter("oriName");
			String sysName = request.getParameter("sysName");
			String filePath = request.getServletContext().getRealPath("files");
			
			File targetFile = new File(filePath+"/"+sysName);
			
			FileInputStream fis = new FileInputStream(targetFile);
			DataInputStream dis = new DataInputStream(fis);
			DataOutputStream dos = new DataOutputStream(response.getOutputStream());
			
			byte[] fileSpace = new byte[(int)targetFile.length()];
			dis.readFully(fileSpace);
			
			oriName = new String(oriName.getBytes("utf-8"),"iso-8859-1");
			
			response.reset();
			response.setContentType("application/octet-stream");
			response.setHeader("content-disposition","attachment; filename=\""+oriName+"\"");
			
			dos.write(fileSpace);
			dos.flush();
			
			
		}else if(cmd.contentEquals("/upload.file")) {
			String filePath = request.getServletContext().getRealPath("files");
			File fileFolder = new File(filePath);
			
			if(!fileFolder.exists()) {fileFolder.mkdir();}
		
			MultipartRequest multi = new MultipartRequest(request, filePath, FileConfig.uploadMaxSize,"utf-8",new DefaultFileRenamePolicy());
			
			
			String oriName = multi.getOriginalFileName("file");
			String sysName = multi.getFilesystemName("file");
			
			
			
			//fdao.summerWrite(new FileDTO(0,oriName,sysName,null,0));
			
			String returnPath = "/files/"+sysName;
			
			JsonObject obj = new JsonObject();
			obj.addProperty("returnPath", returnPath);
			obj.addProperty("oriName", oriName);
			obj.addProperty("sysName", sysName);
			
			//response.getWriter().append(returnPath);
			
			// 서버에 올라간 미아 이미지 파일들 session 에 담기
			List<String> ingFileList =(List<String>) request.getSession().getAttribute("ingFileList");
			ingFileList.add(sysName);
   		    request.getSession().setAttribute("filePath",filePath);

			
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
		}
		
		
		
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
