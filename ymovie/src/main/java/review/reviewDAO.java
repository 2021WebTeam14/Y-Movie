package review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import config.configLoad;

public class reviewDAO {
	
	private String jdbcDriver = "jdbc:mysql://";
	private String jdbcDriverRear = "/ymovie?allowPublicKeyRetrieval=true&useSSL=false";
	private String dbUser;
	private String dbPass;
	
	public reviewDAO() {
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

	public ArrayList<reviewDTO> selectByMovie(String targetMovie)  {
		ArrayList<reviewDTO> dtos = new ArrayList<reviewDTO>();
		reviewDTO dto;
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from review where mov_name =\"" + targetMovie + ")";
		//System.out.println(query);
		try {
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				int rev_num = rs.getInt("rev_num");
				String mov_name = rs.getString("mov_name");
				String mem_id = rs.getString("mem_id");
				int rev_star = rs.getInt("rev_star");
				int rev_thumbs = rs.getInt("rev_thumbs");
				String rev_context = rs.getString("rev_context");

				dto = new reviewDTO(rev_num, mov_name, mem_id , rev_star, rev_thumbs, rev_context);
				dtos.add(dto);
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
		return dtos;
	}
	public ArrayList<reviewDTO> selectById(String targetId)  {
		ArrayList<reviewDTO> dtos = new ArrayList<reviewDTO>();
		reviewDTO dto;
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from review where mem_id =\"" + targetId + ")";
		//System.out.println(query);
		try {
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				int rev_num = rs.getInt("rev_num");
				String mov_name = rs.getString("mov_name");
				String mem_id = rs.getString("mem_id");
				int rev_star = rs.getInt("rev_star");
				int rev_thumbs = rs.getInt("rev_thumbs");
				String rev_context = rs.getString("rev_context");

				dto = new reviewDTO(rev_num, mov_name, mem_id , rev_star, rev_thumbs, rev_context);
				dtos.add(dto);
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
		return dtos;
	}
	
	public int insertReview(reviewDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "insert into review values (?, ?, ?, ?, ?)";
		int result = 0;
	
		try {
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getMov_name());
			pstmt.setString(2, dto.getMem_id());
			pstmt.setString(3, Integer.toString(dto.getRev_star()));
			pstmt.setString(4, Integer.toString(dto.getRev_thumbs()));
			pstmt.setString(5, dto.getRev_context());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}