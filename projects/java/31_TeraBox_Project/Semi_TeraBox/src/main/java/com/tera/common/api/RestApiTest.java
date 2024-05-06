package com.tera.common.api;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.Gson;

public class RestApiTest {

	public static void main(String[] args) {
		try {
			new RestApiTest().apiTestGet();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void apiTestGet() throws Exception {
		URL url = null;
		String readLine = null;
		StringBuilder sb = null;
		BufferedReader br = null;
//		BufferedWriter bw = null;
		HttpURLConnection connection = null;

		int connTimeout = 5000;
		int readTimeout = 3000;

		String apiUrl = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f32d1c9037169ef3b2150edac892995d&targetDt=20240201"; // 각자

		
		try 
		{
			url = new URL(apiUrl);
			connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setConnectTimeout(connTimeout);
			connection.setReadTimeout(readTimeout);
			connection.setRequestProperty("Accept", "application/json;");

			sb = new StringBuilder();
			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) 
			{
				br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
				
				while ((readLine = br.readLine()) != null) 
				{
					sb.append(readLine).append("\n");
				}
			} 
			else 
			{
				sb.append(connection.getResponseCode()).append("\n");
				sb.append(connection.getResponseMessage()).append("\n");
			}
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		} 
		finally 
		{
			try 
			{
				if (br != null) br.close();
			}
			catch (Exception ex)
			{
				ex.printStackTrace();
			}
		}
//		Gson json = new Gson().fromJson(sb.toString(), Gson.class);
		
		System.out.println("결과 : " + sb.toString());
//		System.out.println("json : " + json.);
	}

}
