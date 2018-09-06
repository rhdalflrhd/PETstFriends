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

import model.Shopping;


@Service
public class NaverShoppingService {

	private static String clientID = "I1mdanf6pBUNuRk4KyV7";
	private static String clientSecret = "8p_x5GRnVT";
	
	public List<Shopping> searchShoping(String keyword, int display, int start, String sort){
		List<Shopping> sList = null;
		URL url;
			try {
				url = new URL("https://openapi.naver.com/v1/search/shop.xml?query="
						+ URLEncoder.encode(keyword, "UTF-8")
						+ (display != 0 ? "&display="+display : "")
						+ (start != 0 ? "&start="+start : "")
//						+ (sort != null ? "&sort="+sort : "")
						);
			
			URLConnection urlConn = url.openConnection();
			urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
			urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			XmlPullParser parser = factory.newPullParser();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
			String data = "";
			String msg = null;
			while((msg = br.readLine())!=null) {
				data += msg;
			}
			
			parser.setInput(new StringReader(data));//분석하고 싶은 것을 셋팅
			int eventType = parser.getEventType();
			Shopping shop = new Shopping();
			
			while(eventType != XmlPullParser.END_DOCUMENT) {
				switch(eventType) {
				case XmlPullParser.START_DOCUMENT:
					sList = new ArrayList<Shopping>();
					break;
				case XmlPullParser.END_TAG:{
					String tag = parser.getName();
					if(tag.equals("item")) {
						sList.add(shop);
						shop=null;
					}
				}
				case XmlPullParser.START_TAG:{
					String tag = parser.getName();
					switch(tag) {
					case "item":
						shop = new Shopping();
						break;
					case "title":
						if(shop!=null) 
						shop.setShopping_title(parser.nextText());
						break;
					case "link":
						if(shop!=null) {
						shop.setShopping_link(parser.nextText());
						}
						break;
					case "image":
						if(shop!=null)
						shop.setShopping_image(parser.nextText());
						break;
					case "lprice":
						if(shop!=null)
						shop.setShopping_lprice(parser.nextText());
						break;
					case "hprice":
						if(shop!=null)
						shop.setShopping_hprice(parser.nextText());
						break;
					case "mallName":
						if(shop!=null)
						shop.setShopping_mallName(parser.nextText());
						break;
					case "productId":
						if(shop!=null)
						shop.setShopping_productId(parser.nextText());
						break;
					}
				}
				}eventType=parser.next();
			}
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (XmlPullParserException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return sList;
	}
}
