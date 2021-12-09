package sessionServlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpSession;

import defaultConn.getConn;

public class storeSession {
	public boolean insertSession(HttpSession ses, String targetID) {
		String query = "insert into session values (?, ?)";
	
		try {
			Connection con = null;
			getConn getCon = new getConn();
			con = getCon.getConnection();
			PreparedStatement pstmt = null;
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ses.getId());
			pstmt.setString(2, targetID);
			pstmt.execute();
			pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
				return false;
			}
		return true;
	}
	public String getSession(HttpSession ses) {
		String result = "";
		String query = "select mem_id from session where ses_id = \"" + ses.getId() + "\"";

		Statement stmt = null;
		ResultSet rs = null;
		try {
			Connection con = null;
			getConn getCon = new getConn();
			con = getCon.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				result = rs.getString("mem_id");
			}
		} catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	public void deleteSession(HttpSession ses) {
		String query = "delete from session where ses_id = ? ";
	
		try {
			Connection con = null;
			getConn getCon = new getConn();
			con = getCon.getConnection();
			PreparedStatement pstmt = null;
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ses.getId());
			pstmt.execute();
			pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
	}
}