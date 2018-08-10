package service;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import model.encyc;

@Service
public class TipBoardEncycService {
	private static String clientID = "Xn0HAkbdZbJAtgWsnKKd";
	private static String clientSecret = "jBHzZ9oiBP";
	public static String data = "";
	public String searchEncyc(String keyword, int display, int start) {
		List<encyc> list = null;
		URL url;

		try {
			url = new URL(
					"https://openapi.naver.com/v1/search/encyc.json?query="
							+ URLEncoder.encode(keyword, "UTF-8")
							+ (display != 0 ? "&display=" + display : "")
							+ (start != 0 ? "&start=" + start : "")); 

			HttpURLConnection urlConn = (HttpURLConnection)url.openConnection();
			
			urlConn.setRequestMethod("GET");
			urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
			urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));	
			String msg = null;
			while ((msg = br.readLine()) != null) {
				data += msg;
			}

		}
		catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		JsonParser jsonParser = new JsonParser();
		JsonObject jsonObject = (JsonObject) jsonParser.parse(data);
		
		return data;

	}

}
