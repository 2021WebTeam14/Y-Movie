package sessionServlet;

import java.io.IOException;

import java.io.PrintWriter;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@SuppressWarnings("serial")
public class loginSession extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(true);

		if(session !=null) session.setAttribute("name", "홍길동");		
		resp.setContentType("text/html;charset=utf-8");

		PrintWriter out = resp.getWriter();
		out.println("<html><body>");
		out.println("session id : " + session.getId());
		out.println("<br/>사용자 명 : " + session.getAttribute("name")); //키 값으로 value값 탐색

		session.removeAttribute("name"); 
		out.println("<br/>세션 삭제 후 사용자 명 : " + session.getAttribute("name")); //키 값으로 value값 탐색

		session.invalidate();
		out.println("</body></html>");
		out.close();
	}
	
	public String setSession(HttpServletRequest req, HttpServletResponse resp, String ID) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");

		HttpSession session = req.getSession(true);

		if(session !=null) session.setAttribute("ID", ID);		

		return session.getId();
	}
}