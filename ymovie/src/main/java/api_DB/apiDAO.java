package api_DB;

import java.util.ArrayList;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import config.configLoad;
import director.directorDAO;
import director.directorDTO;
import movie.*;


public class apiDAO {
	
	private static String getTagValue(String tag, Element eElement) {
	    Node preNList = eElement.getElementsByTagName(tag).item(0);
	    if(preNList == null) 
	        return null;
	    NodeList nlList = preNList.getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}

	private static ArrayList<directorDTO> getTagValueDirec(String movName, String tag, Element eElement) {
		ArrayList<directorDTO> directors= new ArrayList<directorDTO>();
		
	    NodeList preNList = eElement.getElementsByTagName(tag);
	    for (int i = 0; i < preNList.getLength(); i++) {
		    NodeList nlList = preNList.item(i).getChildNodes().item(0).getChildNodes();
		    Node nValue = (Node) nlList.item(0);
		    if(nValue == null) 
		        return null;
		    directorDTO dto = new directorDTO(movName, nValue.getNodeValue());
		    directors.add(dto);
		}
	    return directors;	    
	}
	
	public ArrayList<movieDTO> getAPIAboutMovie() throws Exception {
		ArrayList<movieDTO> dtos = new ArrayList<movieDTO>();
		ArrayList<ArrayList<directorDTO>> directors = new ArrayList<ArrayList<directorDTO>>();
		
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
		for(int j = 1; j < 4/*size+1*/; j++) {
			System.out.printf("API Loading ( %d00 / %d )\n", j, size*100+last);
			url = new StringBuilder(preUrl.toString());
			url.append(j);
			
			doc = dBuilder.parse(url.toString());
			doc.getDocumentElement().normalize();

			nList = doc.getElementsByTagName("movie");
			String tmpName = "";
			String tmpGenre = "";
			String tmpYear = "";
			for(int temp = 0; temp < nList.getLength(); temp++){
				nNode = nList.item(temp);
				if(nNode.getNodeType() == Node.ELEMENT_NODE){
					eElement = (Element) nNode;
					tmpName = getTagValue("movieNm", eElement);
					tmpGenre = getTagValue("genreAlt", eElement);
					tmpYear = getTagValue("prdtYear", eElement);
	    			if((tmpGenre == null) || (!tmpGenre.contains("성인"))) {
						directors.add(getTagValueDirec(tmpName, "director", eElement));
						dtos.add(new movieDTO(tmpName, getTagValue("movieCd", eElement), Integer.parseInt(tmpYear == null ? "0" : tmpYear), 
								getTagValue("prdtStatNm", eElement), tmpGenre));
	    			}
				}
			}
			
		}
		
		System.out.printf("API Loading ( %d / %d )\n", size*100+last, size*100+last);
		url = new StringBuilder(preUrl.toString());
		url.append(size+1);
		
		doc = dBuilder.parse(url.toString());
		doc.getDocumentElement().normalize();

		nList = doc.getElementsByTagName("movie");

		String tmpName = "";
		String tmpGenre = "";
		String tmpYear = "";
		for(int temp = 0; temp < nList.getLength(); temp++){
			nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE){
				eElement = (Element) nNode;
				tmpName = getTagValue("movieNm", eElement);
				tmpGenre = getTagValue("genreAlt", eElement);
				tmpYear = getTagValue("prdtYear", eElement);
				if((tmpGenre == null) || (!tmpGenre.contains("성인"))) {
					directors.add(getTagValueDirec(tmpName, "director", eElement));
					dtos.add(new movieDTO(tmpName, getTagValue("movieCd", eElement), Integer.parseInt(tmpYear == null ? "0" : tmpYear), 
							getTagValue("prdtStatNm", eElement), tmpGenre));
    			}
			}
		}

		directorDAO dircDAO = new directorDAO();
		
		for (int i = 0; i < directors.size(); i++) {
			for (int j = 0; j < directors.get(i).size(); j++) {
				if (directors.get(i).get(j).getDir_director() != null) {
					dircDAO.insertDirector(directors.get(i).get(j));						
				}
			}
			System.out.println(i);			
		}
		
		return dtos;
	}
}