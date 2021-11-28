package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import defaultConn.getConn;

public class movieDAO {
	public ArrayList<String> selectAllCodeActX(Connection con)  {
	    ArrayList<String> codes = new ArrayList<String>();
	    
	    Statement stmt = null;
	    ResultSet rs = null;
	    String query = "select mov_code from movie where isActorUp='X'";
	    //System.out.println(query);
	    try {
	        stmt = con.createStatement();
	        rs = stmt.executeQuery(query);
	        while (rs.next()) {
	            codes.add(rs.getString("mov_code"));
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
	    return codes;
	}
	
	public ArrayList<String> selectAllCode(Connection con)  {
	    ArrayList<String> codes = new ArrayList<String>();
	    
	    Statement stmt = null;
	    ResultSet rs = null;
	    String query = "select mov_code from movie";
	    //System.out.println(query);
	    try {
	        stmt = con.createStatement();
	        rs = stmt.executeQuery(query);
	        while (rs.next()) {
	            codes.add(rs.getString("mov_code"));
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
	    return codes;
	}
	
	public ArrayList<movieDTO> selectByName(Connection con, String targetName)  {
		ArrayList<movieDTO> dtos = new ArrayList<movieDTO>();
		movieDTO dto;
		
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from movie where mov_name =\"" + targetName + "\"";
		//System.out.println(query);
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_name = rs.getString("mov_name");
				String mov_code = rs.getString("mov_code");
				int mov_year = rs.getInt("mov_year");
				String mov_state = rs.getString("mov_state");
				String mov_genre = rs.getString("mov_genre");
				int starSum = rs.getInt("mov_genre");

				dto = new movieDTO(mov_name, mov_code , mov_year, mov_state, mov_genre, starSum);
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
	public ArrayList<movieDTO> selectByCode(Connection con, String targetCode)  {
		ArrayList<movieDTO> dtos = new ArrayList<movieDTO>();
		movieDTO dto;
		
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from movie where mov_code =\"" + targetCode + "\"";
		//System.out.println(query);
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_name = rs.getString("mov_name");
				String mov_code = rs.getString("mov_code");
				int mov_year = rs.getInt("mov_year");
				String mov_state = rs.getString("mov_state");
				String mov_genre = rs.getString("mov_genre");
				int starSum = rs.getInt("mov_genre");

				dto = new movieDTO(mov_name, mov_code , mov_year, mov_state, mov_genre, starSum);
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
	public void addStar(Connection con, String targetCode, int star)  {
		String query = "update movie set starSum = starSum + ? where mov_code= ?";
		try {
			PreparedStatement pstmt = null;
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, star);
			pstmt.setString(2, targetCode);
			pstmt.execute();
			pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
	}
	
	public String insertMovie(Connection con, ArrayList<movieDTO> dtos, int j) {
		String query = "insert ignore into movie values (?, ?, ?, ?, ?, 'X', 0)";
		
		int size = dtos.size() / 1000;
		int last = dtos.size() % 1000;
		try {
			PreparedStatement pstmt = null;
			pstmt = con.prepareStatement(query);
			String code;
			System.out.printf("Movie insertion ( %d / %d )\n", (j)*1000+1, 1000*size + last);
			for (int i = 0; i < 1000; i++) {
    			if(dtos.get(i+j*1000).getMov_genre() != null) {
	    			code = dtos.get(i+j*1000).getMov_code();
					pstmt.setString(1, dtos.get(i+j*1000).getMov_name());
	    			pstmt.setString(2, code);
	    			pstmt.setString(3, Integer.toString(dtos.get(i+j*1000).getMov_year()));
	    			pstmt.setString(4, dtos.get(i+j*1000).getMov_state());
	    			pstmt.setString(5, dtos.get(i+j*1000).getMov_genre());
	                pstmt.addBatch();
    			}
            }
			pstmt.executeBatch();
			pstmt.close();
			} catch(Exception e) {
				return "Update error on Server";		
			}
		return "Update Success!";		
	}
	
	public String insertMovieLast(Connection con, ArrayList<movieDTO> dtos) {
		String query = "insert ignore into movie values (?, ?, ?, ?, ?, 'X', 0)";
		
		int size = dtos.size() / 1000;
		int last = dtos.size() % 1000;
	
		try {
			PreparedStatement pstmt = null;
			pstmt = con.prepareStatement(query);
			String code;
			System.out.printf("Movie insertion ( %d / %d )\n", 1000*size, 1000*size + last);			
	        for (int i = 0; i < last; i++) {
    			if(dtos.get(i+size*1000).getMov_genre() != null) {
    				code = dtos.get(1000*size + i).getMov_code();
					pstmt.setString(1, dtos.get(1000*size + i).getMov_name());
					pstmt.setString(2, code);
					pstmt.setString(3, Integer.toString(dtos.get(1000*size + i).getMov_year()));
					pstmt.setString(4, dtos.get(1000*size + i).getMov_state());
					pstmt.setString(5, dtos.get(1000*size + i).getMov_genre());
		            pstmt.addBatch();
    			}
	        }
			System.out.printf("Movie insertion ( %d / %d )\n", 1000*size + last, 1000*size + last);	
			pstmt.executeBatch();
			pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
				return "Update Error On Server";
			}
		return "Update Success!";
	}
	
	public String updateActor(Connection con, String updatedMovCode) {
		String query = "update movie set isActorUp = 'O' where mov_code = ?";
	
		try {
			PreparedStatement pstmt = null;
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, updatedMovCode);
			pstmt.execute();
			pstmt.close();
			} catch(Exception e) {
				return "Update Error On Server";
			}
		return "Update Success!";
	}
	
	public ArrayList<movieDTO> getStarRank(int size) {
		ArrayList<movieDTO> dtos = new ArrayList<movieDTO>();
		movieDTO dto;
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from movie order by starSum limit " + size;
		try {
			
			getConn getCon = new getConn();
			con = getCon.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_name = rs.getString("mov_name");
				String mov_code = rs.getString("mov_code");
				int mov_year = rs.getInt("mov_year");
				String mov_state = rs.getString("mov_state");
				String mov_genre = rs.getString("mov_genre");
				int starSum = rs.getInt("mov_genre");

				dto = new movieDTO(mov_name, mov_code , mov_year, mov_state, mov_genre, starSum);
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
}