package api_DB;

import java.util.ArrayList;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import config.configLoad;
import movie.*;


public class apiDAO {
	
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}

	private ArrayList<movieDTO> getAPIAboutMovie() throws Exception {
		ArrayList<movieDTO> dtos = new ArrayList<movieDTO>();
		
		DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
		
		StringBuilder preUrl = new StringBuilder("http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml?key=");
		preUrl.append(configLoad.readByLine().get(3));
		
		Document doc = dBuilder.parse(preUrl.toString());
		doc.getDocumentElement().normalize();
		NodeList nList = doc.getElementsByTagName("movieListResult");
		Node nNode = nList.item(0);
		Element eElement = (Element) nNode;
		int size = Integer.parseInt(getTagValue("totCnt", eElement))/100;
		int last = Integer.parseInt(getTagValue("totCnt", eElement))%100;
		preUrl.append("&itemPerPage=100&curPage=");
		
		StringBuilder url = new StringBuilder(preUrl.toString());
		for(int j = 1; j < size+1; j++) {
			System.out.printf("API Loading ( %d00 / %d )\n", j, size*100+last);
			url = new StringBuilder(preUrl.toString());
			url.append(j);
			
			doc = dBuilder.parse(url.toString());
			doc.getDocumentElement().normalize();

			nList = doc.getElementsByTagName("movie");
			
			for(int temp = 0; temp < nList.getLength(); temp++){
				nNode = nList.item(temp);
				if(nNode.getNodeType() == Node.ELEMENT_NODE){
					
					eElement = (Element) nNode;
					movieDTO dto = new movieDTO(getTagValue("movieNm", eElement), getTagValue("movieCd", eElement), 
									Integer.parseInt(getTagValue("prdtYear", eElement) == null ? "0" : getTagValue("prdtYear", eElement)), getTagValue("prdtStatNm", eElement), 
										getTagValue("genreAlt", eElement));
					dtos.add(dto);
				}
			}
			
		}
		System.out.printf("API Loading ( %d / %d )\n", size*100+last, size*100+last);
		url = new StringBuilder(preUrl.toString());
		url.append(size+1);
		
		doc = dBuilder.parse(url.toString());
		doc.getDocumentElement().normalize();

		nList = doc.getElementsByTagName("movie");
		
		for(int temp = 0; temp < nList.getLength(); temp++){
			nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE){
				
				eElement = (Element) nNode;
				movieDTO dto = new movieDTO(getTagValue("movieNm", eElement), getTagValue("movieCd", eElement), 
								Integer.parseInt(getTagValue("prdtYear", eElement) == null ? "0" : getTagValue("prdtYear", eElement)), getTagValue("prdtStatNm", eElement), 
									getTagValue("genreAlt", eElement));
				dtos.add(dto);
			}
		}
		return dtos;
	}
	
	public String updateDB() {
		movieDAO dao = new movieDAO();
		ArrayList<movieDTO> dtos = new ArrayList<movieDTO>();
		try {
			dtos = getAPIAboutMovie();
		} catch (Exception e) {
			return "API load error!";
		}
		int size = dtos.size();
		for(int i = 0; i < size; i++) {
			System.out.printf("DB insertion ( %d / %d )\n", i+1, size);
			if(!(dtos.get(i).getMov_genre().contains("성인")) && !(dtos.get(i).getMov_genre().contains("멜로"))) {
				dao.insertMovie(dtos.get(i));				
			}
		}
		return "Update Success!";
	}
	
	
	
	public String bulk() {
		movieDAO dao = new movieDAO();
		ArrayList<movieDTO> dtos = new ArrayList<movieDTO>();
		try {
			dtos = getAPIAboutMovie();
		} catch (Exception e) {
			return "API load error!";
		}
		dao.insertMovie(dtos);		
		return "Update Success!";
	}
}

