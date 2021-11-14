package director;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import config.configLoad;

public class directorDAO {
	
	private String jdbcDriver = "jdbc:mysql://";
	private String jdbcDriverRear = "/ymovie?allowPublicKeyRetrieval=true&useSSL=false";
	private String dbUser;
	private String dbPass;
	
	public directorDAO() {
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
	

	public ArrayList<directorDTO> selectAll()  {
		ArrayList<directorDTO> dtos = new ArrayList<directorDTO>();
		directorDTO dto;
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from director";
		//System.out.println(query);
		try {
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_name = rs.getString("mov_name");
				String dir_director = rs.getString("dir_director");

				dto = new directorDTO(mov_name, dir_director);
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
	
	public ArrayList<directorDTO> selectByMovie(String targetMov)  {
		ArrayList<directorDTO> dtos = new ArrayList<directorDTO>();
		directorDTO dto;
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from director where mov_name =\"" + targetMov + "\")";
		//System.out.println(query);
		try {
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_name = rs.getString("mov_name");
				String dir_director = rs.getString("dir_director");

				dto = new directorDTO(mov_name, dir_director);
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
	
	public ArrayList<directorDTO> selectBydirector(String targetDir)  {
		ArrayList<directorDTO> dtos = new ArrayList<directorDTO>();
		directorDTO dto;
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from director where dir_director =\"" + targetDir + "\")";
		//System.out.println(query);
		try {
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_name = rs.getString("mov_name");
				String dir_director = rs.getString("dir_director");

				dto = new directorDTO(mov_name, dir_director);
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
	
	public int insertdirector(directorDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "insert into director values (?, ?)";
		int result = 0;
	
		try {
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getMov_name());
			pstmt.setString(2, dto.getDir_director());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deletedirector(String targetMov, String targetDir) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "delete from director where mov_name = ? and dir_director = ?";
		int result = 0;
		try {
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, targetMov);
			pstmt.setString(2, targetDir);
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
