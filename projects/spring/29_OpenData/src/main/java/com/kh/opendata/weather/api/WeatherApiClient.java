package com.kh.opendata.weather.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
public class WeatherApiClient
{
    private String baseURL    = "http://apis.data.go.kr/1360000/TourStnInfoService1/";
    private String serviceKey = "ZvQj%2BdF7Qii%2FQOORAN4qLXkSnfUuR%2Bcf8Wg00ku7ZWwfnLmNlS%2F%2Bpi2YaWjmGJIXxLWSI5uHZp%2FIwqDDFO5VFA%3D%3D";
    @Autowired
    private final RestTemplate restTemplate; 
    
    public String apiTourStnVliageV1(String pageNo, String courseId) 
    {
        URL url                           = null;
        BufferedReader reader             = null;
        StringBuilder urlBuilder          = null;
        StringBuilder responseTextBuilder = null;
        String currentDate                = null;
        HttpURLConnection connection      = null;
        
        try
        {
            urlBuilder     = new StringBuilder(baseURL + "getTourStnVilageFcst1");
    //      currentDate = LocalDate.now().format(DateTimeFormatter.BASIC_ISO_DATE);
            currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
            
            urlBuilder.append("?ServiceKey=").append(serviceKey);
            urlBuilder.append("&pageNo=").append(pageNo);
            urlBuilder.append("&numOfRows=").append("10");
            urlBuilder.append("&dataType=").append("JSON");
            urlBuilder.append("&CURRENT_DATE=").append(currentDate);
            urlBuilder.append("&HOUR=").append("0");
            urlBuilder.append("&COURSE_ID=").append(courseId);
            
            log.info("Request URL : {}", urlBuilder.toString());
        
            url      = new URL(urlBuilder.toString());
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            
            reader      = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            responseTextBuilder    = new StringBuilder();
            String line = null;
            
            while((line = reader.readLine())!=null) {
                responseTextBuilder.append(line);
            }
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        finally 
        {
            try
            {
                reader.close();
                connection.disconnect();
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
        }
        
        return responseTextBuilder.toString();
    }
    
    public String apiTourStnVliageV2(String pageNo, String courseId) throws RestClientException, URISyntaxException {

        StringBuilder urlBuilder          = null;
        String currentDate                = null;
        
        
        urlBuilder     = new StringBuilder(baseURL + "getTourStnVilageFcst1");
        currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        
        urlBuilder.append("?ServiceKey=").append(serviceKey);
        urlBuilder.append("&pageNo=").append(pageNo);
        urlBuilder.append("&numOfRows=").append("10");
        urlBuilder.append("&dataType=").append("JSON");
        urlBuilder.append("&CURRENT_DATE=").append(currentDate);
        urlBuilder.append("&HOUR=").append("0");
        urlBuilder.append("&COURSE_ID=").append(courseId);
        
        log.info("Request URL : {}", urlBuilder.toString());
        
        return restTemplate.getForObject(new URI(urlBuilder.toString()), String.class);
    }
    
    public WeatherResponse apiCityTour(String pageNo, String cityAreaId) throws RestClientException, URISyntaxException
    {
        StringBuilder urlBuilder  = null;
        String currentDate        = null;
      

        currentDate = LocalDate.now().minusDays(-2).format(DateTimeFormatter.BASIC_ISO_DATE);
      
        urlBuilder  = new StringBuilder(baseURL + "getCityTourClmIdx1");
        
        urlBuilder.append("?ServiceKey=").append(serviceKey);
        urlBuilder.append("&pageNo=").append(pageNo);
        urlBuilder.append("&numOfRows=").append("5");
        urlBuilder.append("&dataType=").append("JSON");
        urlBuilder.append("&CURRENT_DATE=").append(currentDate);
        urlBuilder.append("&DAY=").append("4");
        urlBuilder.append("&CITY_AREA_ID=").append(cityAreaId);
        
        
        log.info("Request URL : {}", urlBuilder.toString());
        
        
        return restTemplate.getForObject(new URI(urlBuilder.toString()), WeatherResponse.class);
    }
}