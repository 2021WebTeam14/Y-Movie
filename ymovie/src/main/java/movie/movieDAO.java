package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import defaultConn.getConn;

public class movieDAO {
	public ArrayList<Integer> getAmount(Connection con) {
		ArrayList<Integer> result = new ArrayList<Integer>();
		
		Statement stmt = null;
		ResultSet rs = null;
		String query1 = "select count(*) from movie";
		String query2 = "select count(*) from actor";
		String query3 = "select count(*) from director";
		String query4 = "select count(*) from member";
		String query5 = "select count(*) from review";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query1);
	        while (rs.next()) {
	        	result.add(rs.getInt("count(*)"));
	        }
	        rs.close();
			rs = stmt.executeQuery(query2);
	        while (rs.next()) {
	        	result.add(rs.getInt("count(*)"));
	        }
	        rs.close();
			rs = stmt.executeQuery(query3);
	        while (rs.next()) {
	        	result.add(rs.getInt("count(*)"));
	        }
	        rs.close();
			rs = stmt.executeQuery(query4);
	        while (rs.next()) {
	        	result.add(rs.getInt("count(*)"));
	        }
	        rs.close();
			rs = stmt.executeQuery(query5);
	        while (rs.next()) {
	        	result.add(rs.getInt("count(*)"));
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
		return result;	
	}
	public String isDBalive(Connection con) {
		String result = "연결 실패";
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from movie limit 1";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
	        while (rs.next()) {
	        	rs.getString("mov_name");
				result = "연결 성공";
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
		return result;	
	}
	
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
	
	public ArrayList<CodeNameYearDTO> movStarRank()  {
	    ArrayList<CodeNameYearDTO> results = new ArrayList<CodeNameYearDTO>();
	    
	    Connection con = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    String query = "select mov_code, mov_name, mov_year from movie order by starSum limit 10";
	    //System.out.println(query);
	    try {
			getConn getCon = new getConn();
			con = getCon.getConnection();
	        stmt = con.createStatement();
	        rs = stmt.executeQuery(query);
	        while (rs.next()) {
	            results.add(new CodeNameYearDTO(rs.getString("mov_code"), rs.getString("mov_name"), rs.getString("mov_year")) );
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
	    return results;
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
				int starSum = rs.getInt("starSum");
				int starCount = rs.getInt("starCount");

				dto = new movieDTO(mov_name, mov_code , mov_year, mov_state, mov_genre, starSum, starCount);
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
	public ArrayList<movieDTO> selectByName(String targetName)  {
		ArrayList<movieDTO> dtos = new ArrayList<movieDTO>();
		movieDTO dto;

	    Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from movie where mov_name like \"%" + targetName + "%\"";
		//System.out.println(query);
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
				int starSum = rs.getInt("starSum");
				int starCount = rs.getInt("starCount");

				dto = new movieDTO(mov_name, mov_code , mov_year, mov_state, mov_genre, starSum, starCount);
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
				int starSum = rs.getInt("starSum");
				int starCount = rs.getInt("starCount");


				dto = new movieDTO(mov_name, mov_code , mov_year, mov_state, mov_genre, starSum, starCount);
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
	public ArrayList<movieDTO> selectByCode(String targetCode)  {
		ArrayList<movieDTO> dtos = new ArrayList<movieDTO>();
		movieDTO dto;

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from movie where mov_code =\"" + targetCode + "\"";
		//System.out.println(query);
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
				int starSum = rs.getInt("starSum");
				int starCount = rs.getInt("starCount");


				dto = new movieDTO(mov_name, mov_code , mov_year, mov_state, mov_genre, starSum, starCount);
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
	public ArrayList<movieDTO> selectByGenre(String targetGenre)  {
		ArrayList<movieDTO> dtos = new ArrayList<movieDTO>();
		movieDTO dto;

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from movie where mov_genre like \"%" + targetGenre + "%\" order by rand() limit 16" ;
		//System.out.println(query);
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
				int starSum = rs.getInt("starSum");
				int starCount = rs.getInt("starCount");

				dto = new movieDTO(mov_name, mov_code , mov_year, mov_state, mov_genre, starSum, starCount);
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

	public ArrayList<movieDTO> selectByGenre(Connection con, String targetGenre)  {
		ArrayList<movieDTO> dtos = new ArrayList<movieDTO>();
		movieDTO dto;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from movie where mov_genre like \"%" + targetGenre + "%\" order by rand() limit 16" ;
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
				int starSum = rs.getInt("starSum");
				int starCount = rs.getInt("starCount");

				dto = new movieDTO(mov_name, mov_code , mov_year, mov_state, mov_genre, starSum, starCount);
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
		String query = "update movie set starSum = starSum + ?, starCount = starCount + 1 where mov_code= ?";
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
				int starSum = rs.getInt("starSum");
				int starCount = rs.getInt("starCount");

				dto = new movieDTO(mov_name, mov_code , mov_year, mov_state, mov_genre, starSum, starCount);
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
	
	private GenActDirDTO getMemberFav(String targetId) {
		ArrayList<String> Genre = new ArrayList<String>();
		ArrayList<String> Actor = new ArrayList<String>();
		ArrayList<String> Director = new ArrayList<String>();
		GenActDirDTO result = new GenActDirDTO(Genre, Actor, Director);
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		char tmp;
		String query = "select mem_favGenre, mem_favActor, mem_favDirector from member where mem_id=\"" + targetId + "\"";
		try {
			
			getConn getCon = new getConn();
			con = getCon.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				String mem_favGenre = rs.getString("mem_favGenre");
				String mem_favActor = rs.getString("mem_favActor");
				String mem_favDirector = rs.getString("mem_favDirector");
				String buf ="";
				if (mem_favGenre != null) {
					for (int i = 0; (tmp = mem_favGenre.charAt(i)) != '\0'; i++) {
						if (tmp != ',')
							buf += tmp;
						else {
							Genre.add(buf);
							buf = "";
						}
					}
				}
				if (mem_favActor != null) {
					for (int i = 0; (tmp = mem_favActor.charAt(i)) != '\0'; i++) {
						if (tmp != ',')
							buf += tmp;
						else {
							Actor.add(buf);
							buf = "";
						}
					}
				}
				if (mem_favDirector != null) {
					for (int i = 0; (tmp = mem_favDirector.charAt(i)) != '\0'; i++) {
						if (tmp != ',')
							buf += tmp;
						else {
							Director.add(buf);
							buf = "";
						}
					}
				}
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
		return result;	
	}
	
	public ArrayList<CodeNameYearDTO> getPersonalRecommands(String targetId) {
		
		GenActDirDTO fav = getMemberFav(targetId);
		
		ArrayList<CodeNameYearDTO> dtos = new ArrayList<CodeNameYearDTO>();
		CodeNameYearDTO dto;
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<String> tmp;
		int size = 0;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		tmp = fav.getGenre();
		size = tmp.size();
		StringBuilder query = new StringBuilder("select mov_name, mov_code, mov_year from movie");
		if (size != 0) {
			query.append(" where ");
			for (int i = 0; i < size - 1; i++) {
				query.append("mov_genre=\"" + tmp.get(i) + "\" or ");
			}
			query.append("mov_genre=\"" + tmp.get(size)+ "\"");
		}
		query.append(" order by rand() limit 6");
		//System.out.println(query.toString());
		try {
			getConn getCon = new getConn();
			con = getCon.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query.toString());

			while (rs.next()) {
				String mov_name = rs.getString("mov_name");
				String mov_code = rs.getString("mov_code");
				String mov_year = rs.getString("mov_year");

				dto = new CodeNameYearDTO(mov_code, mov_name, mov_year);
				dtos.add(dto);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		tmp = fav.getDirector();
		size = tmp.size();
		ArrayList<String> tmpDirec = new ArrayList<String>();
		query = new StringBuilder("select mov_code from director");
		if (size != 0) {
			query.append(" where ");
			for (int i = 0; i < size - 1; i++) {
				query.append("dir_director=\"" + tmp.get(i) + "\" or ");
			}
			query.append("dir_director=\"" + tmp.get(size)+ "\"");
		}
		query.append(" order by rand() limit 6");
		//System.out.println(query.toString());
		try {
			rs = stmt.executeQuery(query.toString());

			while (rs.next()) {
				tmpDirec.add(rs.getString("mov_code"));
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}

		for (int i = 0; i < tmpDirec.size(); i++) {
			query = new StringBuilder("select mov_name, mov_year from movie where mov_code=\"" + tmpDirec.get(i) + "\"");
			
			try {
				rs = stmt.executeQuery(query.toString());
				while(rs.next()) {
					dto = new CodeNameYearDTO(tmpDirec.get(i), rs.getString("mov_name"), rs.getString("mov_year"));
					dtos.add(dto);					
				}
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		tmp = fav.getActor();
		size = tmp.size();
		ArrayList<String> tmpActor = new ArrayList<String>();
		query = new StringBuilder("select mov_code from actor");
		if (size != 0) {
			query.append(" where ");
			for (int i = 0; i < size - 1; i++) {
				query.append("act_actor=\"" + tmp.get(i) + "\" or ");
			}
			query.append("act_actor=\"" + tmp.get(size)+ "\"");
		}
		query.append(" order by rand() limit 6");
		//System.out.println(query.toString());
		try {
			rs = stmt.executeQuery(query.toString());

			while (rs.next()) {
				tmpActor.add(rs.getString("mov_code"));
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}

		for (int i = 0; i < tmpActor.size(); i++) {
			query = new StringBuilder("select mov_name, mov_year from movie where mov_code=\"" + tmpActor.get(i) + "\"");
			
			try {
				rs = stmt.executeQuery(query.toString());
				while(rs.next()) {
					dto = new CodeNameYearDTO(tmpActor.get(i), rs.getString("mov_name"), rs.getString("mov_year"));
					dtos.add(dto);				
				}
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		if (dtos.size() < 18) {
			int lastLoad = 18 - dtos.size();
			query = new StringBuilder("select mov_code, mov_name, mov_year from movie order by rand() limit ");
			query.append(String.valueOf(lastLoad));
			
			try {
				rs = stmt.executeQuery(query.toString());
				while(rs.next()) {
					dto = new CodeNameYearDTO(rs.getString("mov_code"), rs.getString("mov_name"), rs.getString("mov_year"));
					dtos.add(dto);				
				}
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		Collections.shuffle(dtos); 
		return dtos;	
	}
public ArrayList<ArrayList<CodeNameYearDTO>> getRecommandsByCate(String targetId) {
		
		GenActDirDTO fav = getMemberFav(targetId);
		
		ArrayList<ArrayList<CodeNameYearDTO>> dtos = new ArrayList<ArrayList<CodeNameYearDTO>>();
		ArrayList<CodeNameYearDTO> dto = new ArrayList<CodeNameYearDTO>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<String> tmp;
		int size = 0;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		tmp = fav.getGenre();
		size = tmp.size();
		StringBuilder query = new StringBuilder("select mov_name, mov_code, mov_year from movie");
		if (size != 0) {
			query.append(" where ");
			for (int i = 0; i < size - 1; i++) {
				query.append("mov_genre=\"" + tmp.get(i) + "\" or ");
			}
			query.append("mov_genre=\"" + tmp.get(size)+ "\"");
		}
		query.append(" order by rand() limit 8");
		//System.out.println(query.toString());
		try {
			getConn getCon = new getConn();
			con = getCon.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query.toString());

			while (rs.next()) {
				String mov_name = rs.getString("mov_name");
				String mov_code = rs.getString("mov_code");
				String mov_year = rs.getString("mov_year");

				dto.add(new CodeNameYearDTO(mov_code, mov_name, mov_year));
			}
			dtos.add(dto);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		tmp = fav.getDirector();
		size = tmp.size();
		ArrayList<String> tmpDirec = new ArrayList<String>();
		query = new StringBuilder("select mov_code from director");
		if (size != 0) {
			query.append(" where ");
			for (int i = 0; i < size - 1; i++) {
				query.append("dir_director=\"" + tmp.get(i) + "\" or ");
			}
			query.append("dir_director=\"" + tmp.get(size)+ "\"");
		}
		query.append(" order by rand() limit 8");
		//System.out.println(query.toString());
		try {
			rs = stmt.executeQuery(query.toString());

			while (rs.next()) {
				tmpDirec.add(rs.getString("mov_code"));
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}

		for (int i = 0; i < tmpDirec.size(); i++) {
			query = new StringBuilder("select mov_name, mov_year from movie where mov_code=\"" + tmpDirec.get(i) + "\"");
			
			try {
				rs = stmt.executeQuery(query.toString());
				while(rs.next()) {
					dto.add(new CodeNameYearDTO(tmpDirec.get(i), rs.getString("mov_name"), rs.getString("mov_year")));
				}
				dtos.add(dto);		
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		tmp = fav.getActor();
		size = tmp.size();
		ArrayList<String> tmpActor = new ArrayList<String>();
		query = new StringBuilder("select mov_code from actor");
		if (size != 0) {
			query.append(" where ");
			for (int i = 0; i < size - 1; i++) {
				query.append("act_actor=\"" + tmp.get(i) + "\" or ");
			}
			query.append("act_actor=\"" + tmp.get(size)+ "\"");
		}
		query.append(" order by rand() limit 8");
		//System.out.println(query.toString());
		try {
			rs = stmt.executeQuery(query.toString());

			while (rs.next()) {
				tmpActor.add(rs.getString("mov_code"));
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}

		for (int i = 0; i < tmpActor.size(); i++) {
			query = new StringBuilder("select mov_name, mov_year from movie where mov_code=\"" + tmpActor.get(i) + "\"");
			
			try {
				rs = stmt.executeQuery(query.toString());
				while(rs.next()) {
					dto.add(new CodeNameYearDTO(tmpActor.get(i), rs.getString("mov_name"), rs.getString("mov_year")));
				}
				dtos.add(dto);				
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;	
	}
}