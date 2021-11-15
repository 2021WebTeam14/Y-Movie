package config;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStream;
import java.util.ArrayList;

public class configLoad {
	
	public static ArrayList<String> readByLine() throws Exception{
		ArrayList<String> result = new ArrayList<String>();
		
		InputStream in = configLoad.class.getClass().getResourceAsStream("/config.properties");
		System.out.println(in.read());
		
		StringBuilder path = new StringBuilder(configLoad.class.getClassLoader().getResource("").getPath());
		path.append("../../../../../../../../ymovie/config.properties");
		path.deleteCharAt(0);
		System.out.println(path.toString());
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