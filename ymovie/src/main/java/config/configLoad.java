package config;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;

public class configLoad {
	
	public static ArrayList<String> readByLine() throws Exception{
		ArrayList<String> result = new ArrayList<String>();
		
		String path = "C:\\config.properties";
		BufferedReader br = new BufferedReader(new FileReader(path));
		while(true) {
			String line = br.readLine();
			result.add(line);
			if (line==null) break;
		}
		br.close();
		return result;
	}
}