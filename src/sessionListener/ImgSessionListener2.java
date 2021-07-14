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
public class ImgSessionListener2 implements HttpSessionListener {
	
	
@Override
public void sessionCreated(HttpSessionEvent se) {
	List<String> ingFileList = new ArrayList<>();
	se.getSession().setAttribute("ingFileList", ingFileList);
	
}


@Override
	public void sessionDestroyed(HttpSessionEvent se) {

	}

}