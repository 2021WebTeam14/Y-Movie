package api_DB;

import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import config.configLoad;


public class apiDAO {
	
	private ArrayList<String> mov_name = new ArrayList<String>();
	private ArrayList<String> mov_code = new ArrayList<String>();
	private ArrayList<Integer> mov_year = new ArrayList<Integer>();
	private ArrayList<Integer> mov_state = new ArrayList<Integer>();
	private ArrayList<String> mov_genre = new ArrayList<String>();
	
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}

	private void getAPI() throws Exception {
				
		StringBuilder preUrl = new StringBuilder("http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml?key=");
		preUrl.append(configLoad.readByLine().get(3));
		preUrl.append("&itemPerPage=100");
		
		String url = preUrl.toString();
		
		DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
		Document doc = dBuilder.parse(url);
		doc.getDocumentElement().normalize();
		// 파싱할 tag
		NodeList nList = doc.getElementsByTagName("movie");
		//System.out.println("파싱할 리스트 수 : "+ nList.getLength());
		
		for(int temp = 0; temp < nList.getLength(); temp++){
			Node nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE){
				
				Element eElement = (Element) nNode;
				mov_name.add(getTagValue("movieNm", eElement));
				mov_code.add(getTagValue("movieCd", eElement));
				mov_year.add(Integer.parseInt(getTagValue("prdtYear", eElement)));
				mov_state.add(Integer.parseInt(getTagValue("prdtStatNm", eElement)));
				mov_genre.add(getTagValue("genreAlt", eElement));
			}
		}
	}
	
	public String updateDB() {
		try {
			getAPI();
		} catch (Exception e) {
			return "API load error!";
		}
		for(int i = 0; i < mov_name.size(); i++) {
			System.out.println(mov_name.get(i));
			System.out.println(mov_code.get(i));
			System.out.println(mov_year.get(i));
			System.out.println(mov_state.get(i));
			System.out.println(mov_genre.get(i));
			System.out.println("##################");
		}
		return "Update Success!";
	}
}