package boardfilter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

/**
 * Servlet Filter implementation class NewEncodingFilter
 */
//@WebFilter(
//		urlPatterns = { "/*" }, 
//		initParams = { 
//				@WebInitParam(name = "encoding", value = "utf-8", description = "encoding"), 
//				@WebInitParam(name = "forceEncoding", value = "true", description = "forceEncoding")
//		})
public class NewEncodingFilter implements Filter {
	
	private String encoding = ""; 
	private String forceEncoding = "false";

    public NewEncodingFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		if (null != encoding && !"".equals(encoding)) { 
			System.out.println("Apply Request Encoding"); 
			request.setCharacterEncoding(encoding); } 
		
		chain.doFilter(request, response); 
		
		if (null != encoding && "true".equalsIgnoreCase(forceEncoding)) { 
			System.out.println("Apply Response Encoding~~"); 
			response.setCharacterEncoding(encoding); }

	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		encoding = fConfig.getInitParameter("encoding") == null ? "" : fConfig.getInitParameter("encoding"); forceEncoding = fConfig.getInitParameter("forceEncoding") == null ? "false" : fConfig.getInitParameter("forceEncoding");
	}

}
