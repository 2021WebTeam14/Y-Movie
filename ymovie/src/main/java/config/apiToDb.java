package config;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class apiToDb {
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}

	public static void getApiData() {
		int page = 1;	// 페이지 초기값 
		try{
			while(true){
				
				StringBuilder preUrl = new StringBuilder("http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml?key=");
				preUrl.append(configLoad.readByLine().get(3));
				preUrl.append("&itemPerPage=100");
				
				String url = preUrl.toString();
				
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				doc.getDocumentElement().normalize();
				System.out.println("Root element: " + doc.getDocumentElement().getNodeName());
				// 파싱할 tag
				NodeList nList = doc.getElementsByTagName("movie");
				//System.out.println("파싱할 리스트 수 : "+ nList.getLength());
				
				for(int temp = 0; temp < nList.getLength(); temp++){
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){
						
						Element eElement = (Element) nNode;
						System.out.println("######################");
						System.out.println("금융사  : " + getTagValue("movieNm", eElement));
						System.out.println("상품 코드  : " + getTagValue("movieCd", eElement));
						System.out.println("상품명 : " + getTagValue("prdtYear", eElement));
						System.out.println("연평균 수익률  : " + getTagValue("prdtStatNm", eElement));
						System.out.println("공시 이율  : " + getTagValue("genreAlt", eElement));
					}	// for end
				}	// if end
				
				page += 1;
				System.out.println("page number : "+page);
				if(page > 12){	
					break;
				}
			}	// while end
			
		} catch (Exception e){	
			e.printStackTrace();
		}	// try~catch end
	}	// main end
}