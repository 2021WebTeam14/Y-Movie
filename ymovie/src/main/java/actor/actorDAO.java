package actor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import movie.movieDAO;

public class actorDAO {
	
	public ArrayList<actorDTO> selectAll(Connection con)  {
		ArrayList<actorDTO> dtos = new ArrayList<actorDTO>();
		actorDTO dto;
		
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from actor";
		System.out.println(query);
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_code = rs.getString("mov_code");
				String act_actor = rs.getString("act_actor");

				dto = new actorDTO(mov_code, act_actor);
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
	
	public ArrayList<actorDTO> selectByMovie(Connection con, String targetMov)  {
		ArrayList<actorDTO> dtos = new ArrayList<actorDTO>();
		actorDTO dto;
		
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from actor where mov_code =\"" + targetMov + "\"";
		//System.out.println(query);
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_code = rs.getString("mov_code");
				String act_actor = rs.getString("act_actor");

				dto = new actorDTO(mov_code, act_actor);
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
	
	public ArrayList<actorDTO> selectByActor(Connection con, String targetAct)  {
		ArrayList<actorDTO> dtos = new ArrayList<actorDTO>();
		actorDTO dto;
		
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from actor where act_actor =\"" + targetAct + "\"";
		//System.out.println(query);
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String mov_code = rs.getString("mov_code");
				String act_actor = rs.getString("act_actor");

				dto = new actorDTO(mov_code, act_actor);
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
	
	public String insertActor(Connection con, ArrayList<ArrayList<actorDTO>> dtos, int j) {
		movieDAO dao = new movieDAO();
	    String query = "insert ignore into actor values (?, ?)";
	    
	    int size = dtos.size() / 100;
	    int last = dtos.size() % 100;
	    try {
	        PreparedStatement pstmt = null;
	        pstmt = con.prepareStatement(query);
	        String code;
	        String actor;
	        System.out.printf("Actor insertion ( %d / %d )\n", (j)*100+1, 100*size + last);
	        for (int i = 0; i < 100; i++) {
	        	for (int k= 0; k < dtos.get(i+j*100).size(); k++) {
	        		actor = dtos.get(i+j*100).get(k).getAct_actor();			
	        		code = dtos.get(i+j*100).get(k).getMov_code();
	        		dao.updateActor(con, code);			
	        		if (actor != "") {
		                pstmt.setString(1, code);
		                pstmt.setString(2, actor);
		                pstmt.addBatch();
					}
				}
	        }
	        pstmt.executeBatch();
	        pstmt.close();
	        } catch(Exception e) {
	            return "Update error on Server";
	        }
	    return "Update Success!";
	}

	public String insertActorLast(Connection con, ArrayList<ArrayList<actorDTO>> dtos) {
		movieDAO dao = new movieDAO();
	    String query = "insert ignore into actor values (?, ?)";
	    
	    int size = dtos.size() / 100;
	    int last = dtos.size() % 100;

	    try {
	        PreparedStatement pstmt = null;
	        pstmt = con.prepareStatement(query);
	        String code;
	        String actor;
	        System.out.printf("Actor insertion ( %d / %d )\n", 100*size, 100*size + last);			
	        for (int i = 0; i < last; i++) {
	        	for (int j = 0; j < dtos.get(100*size + i).size(); j++) {	       
	        		actor = dtos.get(100*size + i).get(j).getAct_actor();
	        		code = dtos.get(100*size + i).get(0).getMov_code();
	        		dao.updateActor(con, code);
	        		if (actor != "") {
		                pstmt.setString(1, code);
		                pstmt.setString(2, actor);
		                pstmt.addBatch();						
					}
				}
	        }
	        System.out.printf("Actor insertion ( %d / %d )\n", 100*size + last, 100*size + last);	
	        pstmt.executeBatch();
	        pstmt.close();
	        } catch(Exception e) {
	            return "Update Error On Server";
	        }
	    return "Update Success!";
	}
	
	public int deleteActor(Connection con, String targetMov, String targetAct) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "delete from actor where mov_code = ? and act_actor = ?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, targetMov);
			pstmt.setString(2, targetAct);
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