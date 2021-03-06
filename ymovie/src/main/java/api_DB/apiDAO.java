package api_DB;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import actor.*;
import config.configLoad;
import director.*;
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

	private static ArrayList<directorDTO> getTagValueDirec(String movCode, String tag, Element eElement) {
		ArrayList<directorDTO> directors= new ArrayList<directorDTO>();
		
	    NodeList preNList = eElement.getElementsByTagName(tag);
	    for (int i = 0; i < preNList.getLength(); i++) {
		    NodeList nlList = preNList.item(i).getChildNodes().item(0).getChildNodes();
		    Node nValue = (Node) nlList.item(0);
		    if(nValue == null) 
		        return null;
		    directorDTO dto = new directorDTO(movCode, nValue.getNodeValue());
		    directors.add(dto);
		}
	    return directors;	    
	}
	
	public Pair getAPIAboutMovie(Connection con, HttpSession session) throws Exception {
		ArrayList<movieDTO> dtos = new ArrayList<movieDTO>();
		ArrayList<ArrayList<directorDTO>> directors = new ArrayList<ArrayList<directorDTO>>();
		Pair result = new Pair(dtos, directors);
		movieDAO Modao = new movieDAO();
		ArrayList<String> existCodes = Modao.selectAllCode(con);
		
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
		double tmpForPer = 0.0;
		StringBuilder url = new StringBuilder(preUrl.toString());
		for(int j = 1; j < size+1; j++) {
			tmpForPer = j;
			session.setAttribute("movieDown", (String.format("%.2f", (tmpForPer/size)*100)) + '%');
			System.out.printf("API Loading ( %d00 / %d )\n", j, size*100+last);
			url = new StringBuilder(preUrl.toString());
			url.append(j);
			
			doc = dBuilder.parse(url.toString());
			doc.getDocumentElement().normalize();

			nList = doc.getElementsByTagName("movie");
			String tmpCode = "";
			String tmpGenre = "";
			String tmpYear = "";
			for(int temp = 0; temp < nList.getLength(); temp++){
				nNode = nList.item(temp);
				if(nNode.getNodeType() == Node.ELEMENT_NODE){
					eElement = (Element) nNode;
					tmpCode = getTagValue("movieCd", eElement);
					if (existCodes.contains(tmpCode)) {
						continue;
					}
					tmpGenre = getTagValue("genreAlt", eElement);
	    			if((tmpGenre == null) || (!tmpGenre.contains("??????"))) {
						tmpYear = getTagValue("prdtYear", eElement);
						directors.add(getTagValueDirec(tmpCode, "director", eElement));
						dtos.add(new movieDTO(getTagValue("movieNm", eElement), getTagValue("movieCd", eElement), Integer.parseInt(tmpYear == null ? "0" : tmpYear), 
								getTagValue("prdtStatNm", eElement), tmpGenre));
	    			}
				}
			}
			
		}
		tmpForPer = size;
		session.setAttribute("movieDown", (String.format("%.2f", (tmpForPer*100/tmpForPer*100+last)*100)) + '%');
		System.out.printf("API Loading ( %d / %d )\n", size*100+last, size*100+last);
		url = new StringBuilder(preUrl.toString());
		url.append(size+1);
		
		doc = dBuilder.parse(url.toString());
		doc.getDocumentElement().normalize();

		nList = doc.getElementsByTagName("movie");

		String tmpCode = "";
		String tmpGenre = "";
		String tmpYear = "";
		for(int temp = 0; temp < nList.getLength(); temp++){
			nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE){
				eElement = (Element) nNode;
				tmpCode = getTagValue("movieCd", eElement);
				if (existCodes.contains(tmpCode)) {
					continue;
				}
				tmpGenre = getTagValue("genreAlt", eElement);
				if((tmpGenre == null) || (!tmpGenre.contains("??????"))) {
					tmpYear = getTagValue("prdtYear", eElement);
					directors.add(getTagValueDirec(tmpCode, "director", eElement));
					dtos.add(new movieDTO(getTagValue("movieNm", eElement), tmpCode, Integer.parseInt(tmpYear == null ? "0" : tmpYear), 
							getTagValue("prdtStatNm", eElement), tmpGenre));
    			}
			}
		}
		return result;
	}
	
	private static ArrayList<actorDTO> getTagValueAct(String movCode, Element eElement) {
	    ArrayList<actorDTO> actors= new ArrayList<actorDTO>();
	    
	    NodeList preNList = eElement.getElementsByTagName("actors");
	    for (int i = 0; i < preNList.item(0).getChildNodes().getLength(); i++) {
	    	if (preNList.item(0).getChildNodes().item(i) == null || i == 10) {
	    	    break;			
			}
	        Node nlList = preNList.item(0).getChildNodes().item(i);
	        if(nlList == null) 
	            break;
	        Node nValue = (Node) nlList.getChildNodes().item(0).getChildNodes().item(0);
	        actorDTO dto = new actorDTO(movCode, nValue.getNodeValue());
	        actors.add(dto);
	    }
	    if (actors.size() == 0) {
	        actorDTO dto = new actorDTO(movCode, "");
	        actors.add(dto);
		}
	    return actors;
	}
	
	public ArrayList<ArrayList<actorDTO>> getAPIAboutActor(Connection con) throws Exception {
	    movieDAO MoDao = new movieDAO();
	    ArrayList<String> codes = MoDao.selectAllCodeActX(con);
	    ArrayList<ArrayList<actorDTO>> actors= new ArrayList<ArrayList<actorDTO>>();
	    
	    DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
	    DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
	    
	    StringBuilder preUrl = new StringBuilder("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=");
	    preUrl.append(configLoad.readByLine().get(3));
	    
	    Document doc = dBuilder.parse(preUrl.toString());
	    doc.getDocumentElement().normalize();
	    NodeList nList = doc.getElementsByTagName("movieInfoResult");
	    Node nNode = nList.item(0);
	    Element eElement = (Element) nNode;
	    preUrl.append("&movieCd=");
	    
	    StringBuilder url = new StringBuilder(preUrl.toString());
	    for(int j = 0; j < codes.size(); j++) {
			System.out.printf("Actor API Loading ( %d / %d )\n", j, codes.size());
	        url = new StringBuilder(preUrl.toString());
	        url.append(codes.get(j));
	        
	        doc = dBuilder.parse(url.toString());
	        doc.getDocumentElement().normalize();

	        nList = doc.getElementsByTagName("movieInfo");
	        nNode = nList.item(0);
	        if(nNode.getNodeType() == Node.ELEMENT_NODE){
	            eElement = (Element) nNode;
	            actors.add(getTagValueAct(codes.get(j), eElement));
	        }
	    }
		return actors;
	}
	
	public ArrayList<CodeNameYearDTO> getAPIBoxOfficeDaily() throws Exception {
		ArrayList<CodeNameYearDTO> dtos = new ArrayList<CodeNameYearDTO>();
		
		DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
	    DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
	    
	    SimpleDateFormat dtf = new SimpleDateFormat("yyyyMMdd");
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, -1);
        Date dateObj = calendar.getTime();
        String formattedDate = dtf.format(dateObj);
	    StringBuilder url = new StringBuilder("https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=");
	    url.append(configLoad.readByLine().get(3));
	    url.append("&targetDt=");
        url.append(formattedDate);

	    Document doc = dBuilder.parse(url.toString());
	    doc.getDocumentElement().normalize();
	    NodeList nList = doc.getChildNodes().item(0).getChildNodes().item(2).getChildNodes();
	    Node nNode;
	    Element eElement;	    
	    for(int temp = 0; temp < 10; temp++){
			nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE){
				eElement = (Element) nNode;
					dtos.add(new CodeNameYearDTO(getTagValue("movieCd", eElement), getTagValue("movieNm", eElement), getTagValue("openDt", eElement)));
			}
		}
	    		
		return dtos;
	}
	public ArrayList<CodeNameYearDTO> getAPIBoxOfficeWeekly() throws Exception {
		ArrayList<CodeNameYearDTO> dtos = new ArrayList<CodeNameYearDTO>();
		
		DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
	    DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
	    
	    SimpleDateFormat dtf = new SimpleDateFormat("yyyyMMdd");
        Calendar cal = Calendar.getInstance();

        cal.add(Calendar.DATE, -1);
        cal.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);
        
        Date dateObj = cal.getTime();
        String formattedDate = dtf.format(dateObj);
	    StringBuilder url = new StringBuilder("https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.xml?key=");
	    url.append(configLoad.readByLine().get(3));
	    url.append("&weekGb=0&targetDt=");
        url.append(formattedDate);

	    Document doc = dBuilder.parse(url.toString());
	    doc.getDocumentElement().normalize();
	    NodeList nList = doc.getChildNodes().item(0).getChildNodes().item(3).getChildNodes();
	    Node nNode;
	    Element eElement;	    
	    for(int temp = 0; temp < 10; temp++){
			nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE){
				eElement = (Element) nNode;
					dtos.add(new CodeNameYearDTO(getTagValue("movieCd", eElement), getTagValue("movieNm", eElement), getTagValue("openDt", eElement)));
			}
		}
	    		
		return dtos;
	}
	
}