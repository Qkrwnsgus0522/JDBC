package model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawling {
	
	public static ArrayList<BoardVO> sample() {
		final String url = "http://www.cgv.co.kr/movies/?lt=1&ft=0";
		Connection conn = Jsoup.connect(url);
		Document doc = null;
		try {
			doc = conn.get();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Elements elems = doc.select("strong.title");
		Elements elems2 = doc.select("span.txt-info");
		Iterator<Element> itr = elems.iterator();
		Iterator<Element> itr2 = elems2.iterator();

		ArrayList<BoardVO> datas=new ArrayList<BoardVO>();
		while(itr.hasNext()) {
			String str = itr.next().toString();
			String str2 = itr2.next().toString();

			int index = str.indexOf(">");
			str = str.substring(index+1);
			index = str.indexOf("<");
			str = str.substring(0, index);

			int index2 = str2.indexOf("<strong>");
			str2 = str2.substring(index2+9);
			index2 = str2.indexOf("<span>");
			str2 = str2.substring(0, index2);

			/*
			System.out.println(str);
			System.out.println(str2);
			System.out.println();
			*/
			
			BoardVO data=new BoardVO();
			data.setTitle(str);
			data.setContent(str2);
			
			datas.add(data);
		}
		return datas;
	}
	
}
