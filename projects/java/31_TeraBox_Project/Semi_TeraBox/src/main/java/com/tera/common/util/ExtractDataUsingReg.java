package com.tera.common.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import static com.tera.common.util.StringUtil.toPrintString;

public class ExtractDataUsingReg {

	public static void main(String[] args) {
		
		
		File file = new File("C:/workspace/10_Semi/TerraBoxProject/Semi_TeraBox/src/main/java/com/tera/common/resource/timeTable.txt");
		System.out.println(file.getAbsolutePath());
		System.out.println(file.getAbsolutePath());
		System.out.println(file.getAbsolutePath());
		

        //존재하지 않으면 새로 생성
        if(!file.exists())
        {
            try
            {
            	file.createNewFile();
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
        }
        List<Map<String, String>> listMap = new ArrayList<Map<String, String>>();
        
        try(BufferedReader br = new BufferedReader(new FileReader(file)))
        {

            String readLine = "";
            readLine = br.readLine();
            String[] headArr = readLine.split("\t");	
            while((readLine = br.readLine()) != null)
            {
                Map<String, String> map = new HashMap<String, String>();
                String[] mapValues = readLine.split("\t");
                for (int i = 0; i < mapValues.length; i++)
                {
                    map.put(headArr[i], mapValues[i]);
                }
                listMap.add(map);
            }
            System.out.println(toPrintString(listMap));
        	
        } catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
}
