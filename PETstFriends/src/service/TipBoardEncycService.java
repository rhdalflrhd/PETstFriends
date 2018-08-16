package service;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
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

import model.encyc;

@Service
public class TipBoardEncycService {
	private static String clientID = "Xn0HAkbdZbJAtgWsnKKd";
	private static String clientSecret = "jBHzZ9oiBP";

	public List<encyc> searchEncyc(String keyword, int display, int start) {
		List<encyc> list = null;
		URL url;

		try {
			url = new URL(
					"https://openapi.naver.com/v1/search/encyc.xml?query="
							+ URLEncoder.encode(keyword, "UTF-8")
							+ (display != 0 ? "&display=" + display : "")
							+ (start != 0 ? "&start=" + start : "")); 

			URLConnection urlConn = url.openConnection();

			urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
			urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);

			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			XmlPullParser parser = factory.newPullParser();

			BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));

			String data = "";
//			String msg = br.readLine();
//			while (!msg.contains("호랑이!")) {
//				data += msg;
//			}
			
			String msg = null;
			while ((msg = br.readLine()) != null) {
				data += msg;
			}
//			System.out.println("들어온 반려동물 정보 확인");
//			System.out.println(data);
			parser.setInput(new StringReader(data));
			int eventType = parser.getEventType();
			encyc e = null;

			while (eventType != XmlPullParser.END_DOCUMENT) {

				switch (eventType) {

				case XmlPullParser.START_DOCUMENT:
					list = new ArrayList<encyc>();
					break;

				case XmlPullParser.END_TAG: {
					String tag = parser.getName();
					if (tag.equals("item")) {
						list.add(e);
						e = null;

					}
				}

				case XmlPullParser.START_TAG: {
					String tag = parser.getName();

					switch (tag) {
					
					case "item":
						e = new encyc();
						break;

					case "total": 
						if (e != null)//페이징처리를 위한 변수
							e.setEncyc_total(parser.nextText());
						break;
						
					case "title":
						if (e != null)
							e.setEncyc_title(parser.nextText());
						break;

					case "link":
						if (e != null)
							e.setEncyc_link(parser.nextText());
						break;
						
					case "description":
						if (e != null)
							e.setEncyc_description(parser.nextText());
						break;
						
					case "thumbnail":
						if (e != null)
							e.setEncyc_thumbnail(parser.nextText());
						break;	
					}

				}
				}

				eventType = parser.next();
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
		} catch (XmlPullParserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}

}
