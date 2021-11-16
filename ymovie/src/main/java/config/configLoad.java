package config;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;

public class configLoad {
	
	public static ArrayList<String> readByLine() throws Exception{
		ArrayList<String> result = new ArrayList<String>();
		
		StringBuilder path = new StringBuilder(configLoad.class.getClassLoader().getResource("").getPath());
		path.append("../../../../../../../../ymovie/config.properties");
		path.deleteCharAt(0);
		BufferedReader br = new BufferedReader(new FileReader(path.toString()));
		while(true) {
			String line = br.readLine();
			result.add(line);
			if (line==null) break;
		}
		br.close();
		return result;
	}
}