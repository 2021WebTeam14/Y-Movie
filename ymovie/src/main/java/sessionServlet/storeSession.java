package sessionServlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import defaultConn.getConn;

public class storeSession {
	public boolean insertSession(String sessionID, String targetID) {
		String query = "insert into session values (?, ?)";
	
		try {
			Connection con = null;
			getConn getCon = new getConn();
			con = getCon.getConnection();
			PreparedStatement pstmt = null;
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, sessionID);
			pstmt.setString(2, targetID);
			pstmt.execute();
			pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
				return false;
			}
		return true;
	}
	public String isSessionExist(HttpServletRequest req) {
		String result = null;
		String currID = "";
	
		Cookie[] cookies = req.getCookies(); // 모든 쿠키 가져오기
	    if(cookies!=null){
	        for (Cookie c : cookies) {
	            String name = c.getName(); // 쿠키 이름 가져오기
	            String value = c.getValue(); // 쿠키 값 가져오기
	            if (name.equals("currID")) {
	            	currID = value;
	            	break;
	            }
	        }
	    }

		String query = "select * from session where ses_id=" + "\"" + currID + "\"";
		try {
			Connection con = null;
			ResultSet rs = null;
			getConn getCon = new getConn();
			con = getCon.getConnection();
			Statement stmt = null;
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				result = rs.getString("mem_id");
			}
			
			stmt.close();
			} catch(Exception e) {
				e.printStackTrace();
				return result;
			}
		return result;
	}
}