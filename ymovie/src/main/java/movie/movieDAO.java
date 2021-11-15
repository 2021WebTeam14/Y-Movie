package movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import config.configLoad;

public class movieDAO {
	private String jdbcDriver = "jdbc:mysql://";
	private String jdbcDriverRear = "/ymovie?allowPublicKeyRetrieval=true&useSSL=false";
	private String dbUser;
	private String dbPass;
	
	public movieDAO() {
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

	public ArrayList<movieDTO> selectByName(String targetName)  {
		ArrayList<movieDTO> dtos = new ArrayList<movieDTO>();
		movieDTO dto;
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from movie where mov_name =\"" + targetName + ")";
		//System.out.println(query);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_name = rs.getString("mov_name");
				String mov_code = rs.getString("mov_code");
				int mov_year = rs.getInt("mov_year");
				String mov_state = rs.getString("mov_state");
				String mov_genre = rs.getString("mov_genre");

				dto = new movieDTO(mov_name, mov_code , mov_year, mov_state, mov_genre);
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
	public ArrayList<movieDTO> selectByCode(String targetCode)  {
		ArrayList<movieDTO> dtos = new ArrayList<movieDTO>();
		movieDTO dto;
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from movie where mov_code =\"" + targetCode + ")";
		//System.out.println(query);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_name = rs.getString("mov_name");
				String mov_code = rs.getString("mov_code");
				int mov_year = rs.getInt("mov_year");
				String mov_state = rs.getString("mov_state");
				String mov_genre = rs.getString("mov_genre");

				dto = new movieDTO(mov_name, mov_code , mov_year, mov_state, mov_genre);
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
	
	public int insertMovie(movieDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "replace into movie values (?, ?, ?, ?, ?)";
		int result = 0;
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getMov_name());
			pstmt.setString(2, dto.getMov_code());
			pstmt.setString(3, Integer.toString(dto.getMov_year()));
			pstmt.setString(4, dto.getMov_state());
			pstmt.setString(5, dto.getMov_genre());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}