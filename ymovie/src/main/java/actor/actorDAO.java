package actor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import config.*;

public class actorDAO {
	
	private String jdbcDriver = "jdbc:mysql://";
	private String jdbcDriverRear = "/ymovie?allowPublicKeyRetrieval=true&useSSL=false";
	private String dbUser;
	private String dbPass;
	
	public actorDAO() {
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
	
	public ArrayList<actorDTO> selectAll()  {
		ArrayList<actorDTO> dtos = new ArrayList<actorDTO>();
		actorDTO dto;
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from actor";
		//System.out.println(query);
		try {
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_name = rs.getString("mov_name");
				String act_actor = rs.getString("act_actor");

				dto = new actorDTO(mov_name, act_actor);
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
	
	public ArrayList<actorDTO> selectByMovie(String targetMov)  {
		ArrayList<actorDTO> dtos = new ArrayList<actorDTO>();
		actorDTO dto;
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from actor where mov_name =\"" + targetMov + "\")";
		//System.out.println(query);
		try {
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_name = rs.getString("mov_name");
				String act_actor = rs.getString("act_actor");

				dto = new actorDTO(mov_name, act_actor);
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
	
	public ArrayList<actorDTO> selectByActor(String targetAct)  {
		ArrayList<actorDTO> dtos = new ArrayList<actorDTO>();
		actorDTO dto;
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from actor where act_actor =\"" + targetAct + "\")";
		//System.out.println(query);
		try {
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_name = rs.getString("mov_name");
				String act_actor = rs.getString("act_actor");

				dto = new actorDTO(mov_name, act_actor);
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
	
	public int insertActor(actorDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "insert into actor values (?, ?)";
		int result = 0;
	
		try {
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getMov_name());
			pstmt.setString(2, dto.getAct_actor());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteActor(String targetMov, String targetAct) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "delete from actor where mov_name = ? and act_actor = ?";
		int result = 0;
		try {
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, targetMov);
			pstmt.setString(2, targetAct);
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