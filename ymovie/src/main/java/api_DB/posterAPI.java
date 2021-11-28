package api_DB;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;


public class posterAPI {
	public String getPoster(String movCode) {
		String URL = "https://kobis.or.kr/kobis/business/mast/mvie/searchMovieDtl.do?code=" + movCode;
		Document document;
		try {
			document = Jsoup.connect(URL).get();
		} catch (IOException e) {
			return "getPosterError";
		}
		return "https://kobis.or.kr" + document.select("img[src$=.jpg]").attr("src");
	}
}