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
	
	public ArrayList<String> selectAllCode()  {
	    ArrayList<String> codes = new ArrayList<String>();
	    
	    Connection con = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    String query = "select mov_code from movie";
	    //System.out.println(query);
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	        stmt = con.createStatement();
	        rs = stmt.executeQuery(query);
	        int  i = 0;
	        while (rs.next()) {
	            codes.add(rs.getString("mov_code"));
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
	    return codes;
	}
	
	public ArrayList<actorDTO> selectByMovie(String targetMov)  {
		ArrayList<actorDTO> dtos = new ArrayList<actorDTO>();
		actorDTO dto;
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from actor where mov_name =\"" + targetMov + "\"";
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
		String query = "select * from actor where act_actor =\"" + targetAct + "\"";
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
	
	public String insertActor(ArrayList<ArrayList<actorDTO>> dtos, int j) {
	    String query = "insert ignore into actor values (?, ?)";
	    
	    int size = dtos.size() / 100;
	    int last = dtos.size() % 100;
	    try {
	        Connection con = null;
	        PreparedStatement pstmt = null;
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	        pstmt = con.prepareStatement(query);
	        System.out.printf("Actor insertion ( %d / %d )\n", (j)*100+1, 100*size + last);
	        for (int i = 0; i < 100; i++) {
	        	for (int k= 0; k < dtos.get(i+j*100).size(); k++) {
	                pstmt.setString(1, dtos.get(i+j*100).get(k).getMov_name());
	                pstmt.setString(2, dtos.get(i+j*100).get(k).getAct_actor());
	                pstmt.addBatch();
				}
	        }
	        pstmt.executeBatch();
	        pstmt.close();
	        con.close();
	        } catch(Exception e) {
	            return "Update error on Server";
	        }
	    return "Update Success!";
	}

	public String insertActorLast(ArrayList<ArrayList<actorDTO>> dtos) {
	    String query = "insert ignore into actor values (?, ?)";
	    
	    int size = dtos.size() / 100;
	    int last = dtos.size() % 100;

	    try {
	        Connection con = null;
	        PreparedStatement pstmt = null;
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	        pstmt = con.prepareStatement(query);
	        System.out.printf("Actor insertion ( %d / %d )\n", 100*size, 100*size + last);			
	        for (int i = 0; i < last; i++) {
	        	for (int j = 0; j < dtos.get(100*size + i).size(); j++) {
	                pstmt.setString(1, dtos.get(100*size + i).get(j).getMov_name());
	                pstmt.setString(2, dtos.get(100*size + i).get(j).getAct_actor());
	                pstmt.addBatch();
				}
	        }
	        System.out.printf("Actor insertion ( %d / %d )\n", 100*size + last, 100*size + last);	
	        pstmt.executeBatch();
	        pstmt.close();
	        con.close();
	        } catch(Exception e) {
	            return "Update Error On Server";
	        }
	    return "Update Success!";
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