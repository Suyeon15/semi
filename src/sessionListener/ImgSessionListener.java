package sessionListener;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import dao.FileDAO;

@WebListener
public class ImgSessionListener implements HttpSessionListener {
	
	
@Override
public void sessionCreated(HttpSessionEvent se) {
	List<String> ingFileList = new ArrayList<>();
	se.getSession().setAttribute("ingFileList", ingFileList);
	
}


@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		String filePath = (String) session.getAttribute("filePath");
		List<String> ingFileList = (List<String>) session.getAttribute("ingFileList");

		try {
		FileDAO fdao = FileDAO.getInstance();
		for(int i=0; i<ingFileList.size();i++) {
			boolean result =fdao.fileSaved(ingFileList.get(i));
			
			if(!result) {
				File targetFile = new File(filePath+"/"+ingFileList.get(i));
				targetFile.delete();
			}
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
