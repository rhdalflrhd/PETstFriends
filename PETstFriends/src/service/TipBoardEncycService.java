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
			
			String msg = null;
			while ((msg = br.readLine()) != null) {
				data += msg;
			}
			
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
	
	public List<encyc> onlyforRabbitWebParsing() throws MalformedURLException, IOException {
		List<encyc> RabbitWebParsingList = new ArrayList<encyc>();
		encyc rabbitTip=null;
		
		for(long i=835;i<946;i++) {	
	 
			if(i==844 || i==852 || i==862 || i==874 || i==882||  i==895 || i==909 || i==922 || i==931 || i==940) {

				
			}else {	
				String target = "https://terms.naver.com/entry.nhn?docId=1978" + i + "&categoryId=42885&cid=42885";
				HttpURLConnection con = (HttpURLConnection) new URL(target).openConnection();
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
				String temp;
				String title = "";
				String imageUrl = "";
				String description = "";
				rabbitTip = new encyc();
				
				while ((temp = br.readLine()) != null) {

					rabbitTip.setEncyc_link(target);
					if (temp.contains("<meta property=\"og:title\" content=\"")) {
						title = temp.split("<meta property=\"og:title\" content=\"")[1].split("\">")[0];
						rabbitTip.setEncyc_title(title);
					}

					if (temp.contains("<meta property=\"og:description\" content=\"")) {
						description = temp.split("<meta property=\"og:description\" content=\"")[1].split("\">")[0];
						rabbitTip.setEncyc_description(description);
					}

					if (temp.contains("<meta property=\"og:image\" content=\"")) {
						imageUrl = temp.split("<meta property=\"og:image\" content=\"")[1].split("\">")[0];
						rabbitTip.setEncyc_thumbnail(imageUrl);
					}

				}

				RabbitWebParsingList.add(rabbitTip);
				con.disconnect();
				br.close();
			}
		}
		return RabbitWebParsingList;
	}

}
