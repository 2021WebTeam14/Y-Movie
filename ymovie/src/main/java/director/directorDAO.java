package director;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class directorDAO {	

	public ArrayList<directorDTO> selectAll(Connection con)  {
		ArrayList<directorDTO> dtos = new ArrayList<directorDTO>();
		directorDTO dto;

		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from director";
		//System.out.println(query);
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_code = rs.getString("mov_code");
				String dir_director = rs.getString("dir_director");

				dto = new directorDTO(mov_code, dir_director);
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
	
	public ArrayList<directorDTO> selectByMovie(Connection con, String targetMov)  {
		ArrayList<directorDTO> dtos = new ArrayList<directorDTO>();
		directorDTO dto;
		
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from director where mov_code =\"" + targetMov + "\"";
		//System.out.println(query);
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_code = rs.getString("mov_code");
				String dir_director = rs.getString("dir_director");

				dto = new directorDTO(mov_code, dir_director);
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
	
	public ArrayList<directorDTO> selectByDirector(Connection con, String targetDir)  {
		ArrayList<directorDTO> dtos = new ArrayList<directorDTO>();
		directorDTO dto;
		
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from director where dir_director =\"" + targetDir + "\"";
		//System.out.println(query);
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_code = rs.getString("mov_code");
				String dir_director = rs.getString("dir_director");

				dto = new directorDTO(mov_code, dir_director);
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
	
	public int insertDirector(Connection con, directorDTO dto) {
		PreparedStatement pstmt = null;
		String query = "insert ignore into director values (?, ?)";
		int result = 0;
	
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getMov_code());
			pstmt.setString(2, dto.getDir_director());
			
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deletedirector(Connection con, String targetMov, String targetDir) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "delete from director where mov_code = ? and dir_director = ?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, targetMov);
			pstmt.setString(2, targetDir);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}	
}
