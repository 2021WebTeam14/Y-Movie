package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import config.configLoad;

public class memberDAO {
	
	private String jdbcDriver = "jdbc:mysql://";
	private String jdbcDriverRear = "/ymovie?allowPublicKeyRetrieval=true&useSSL=false";
	private String dbUser;
	private String dbPass;
	
	public memberDAO() {
		ArrayList<String> Info = new ArrayList<String>();
		try {
			Info = configLoad.readByLine();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		jdbcDriver += Info.get(0);
		jdbcDriver += jdbcDriverRear;
		dbUser = Info.get(1);
		dbPass = Info.get(2);
	}
	
	public memberDTO selectMember(String targetId, String targetPw)  {
		memberDTO dto = new memberDTO("","","",0);
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from member where mem_id =\"" + targetId + "\" and mem_pw = " + "sha1(\"" + targetPw + "\")";
		//System.out.println(query);
		try {
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			if (rs.next()) {
				String mem_id = rs.getString("mem_id");
				String mem_nickname = rs.getString("mem_nickname");
				int mem_icon = rs.getInt("mem_icon");
				int mem_reviewCount = rs.getInt("mem_reviewCount");
				String mem_favGenre = rs.getString("mem_favGenre");
				String mem_favActor = rs.getString("mem_favActor");
				String mem_favDirector = rs.getString("mem_favDirector");

				dto = new memberDTO(mem_id, "", mem_nickname, mem_icon, mem_reviewCount, mem_favGenre, mem_favActor, mem_favDirector);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	public int insertMember(memberDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "insert into member values (?, sha1(?), ?, ?, ?, ?, ?, ?)";
		int result = 0;
	
		try {
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getMem_id());
			pstmt.setString(2, dto.getMem_pw());
			pstmt.setString(3, dto.getMem_nickname());
			pstmt.setString(4, Integer.toString(dto.getMem_icon()));
			pstmt.setString(5, Integer.toString(dto.getMem_reviewCount()));
			pstmt.setString(6, dto.getMem_favGenre());
			pstmt.setString(7, dto.getMem_favActor());
			pstmt.setString(8, dto.getMem_favDirector());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteMember(String targetId, String targerPw) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "delete from member where mem_id = ? and mem_pw = sha1(?)";
		int result = 0;
		try {
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, targetId);
			pstmt.setString(2, targerPw);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(con != null) con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}	
}