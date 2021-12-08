package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import defaultConn.getConn;
import sessionServlet.storeSession;

public class reviewDAO {
	public ArrayList<reviewDTO> selectByMovie(Connection con, String targetMovie)  {
		ArrayList<reviewDTO> dtos = new ArrayList<reviewDTO>();
		reviewDTO dto;
		
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from review where mov_code =\"" + targetMovie + "\"";
		//System.out.println(query);
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_code = rs.getString("mov_code");
				String mem_id = rs.getString("mem_id");
				int rev_star = rs.getInt("rev_star");
				int rev_thumbs = rs.getInt("rev_thumbs");
				String rev_context = rs.getString("rev_context");
				int rev_num = rs.getInt("rev_num");
				dto = new reviewDTO(mov_code, mem_id , rev_star, rev_thumbs, rev_context, rev_num);
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
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
		String query = "select * from review where mem_id =\"" + targetId + "\"";
		//System.out.println(query);
		try {
			getConn getCon = new getConn();
			con = getCon.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_code = rs.getString("mov_code");
				String mem_id = rs.getString("mem_id");
				int rev_star = rs.getInt("rev_star");
				int rev_thumbs = rs.getInt("rev_thumbs");
				String rev_context = rs.getString("rev_context");
				int rev_num = rs.getInt("rev_num");
				
				dto = new reviewDTO(mov_code, mem_id , rev_star, rev_thumbs, rev_context, rev_num);
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
	}
	
	public int insertReview(Connection con, reviewDTO dto) {
		PreparedStatement pstmt = null;
		String query = "insert into review values (?, ?, ?, ?, ?)";
		int result = 0;
	
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getMov_code());
			pstmt.setString(2, dto.getMem_id());
			pstmt.setString(3, Integer.toString(dto.getRev_star()));
			pstmt.setString(4, Integer.toString(dto.getRev_thumbs()));
			pstmt.setString(5, dto.getRev_context());
			
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}