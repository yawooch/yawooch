package com.tera.common.util;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.lang.reflect.Array;
import java.nio.ByteBuffer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Random;
import java.util.Set;


public class StringUtil
{

    private static final String LEFT_WAP       = "{ ";
    private static final String RIGHT_WAP      = " } ";

    public static final String   TOP_LEFT      = Constants.TABLE_STRING[0];
    public static final String   TOP_MIDLE     = Constants.TABLE_STRING[1];
    public static final String   TOP_RIGHT     = Constants.TABLE_STRING[2];
    public static final String   VERTICAL      = Constants.TABLE_STRING[3];
    public static final String   MIDDLE_LEFT   = Constants.TABLE_STRING[4];
    public static final String   MIDDLE_RIGHT  = Constants.TABLE_STRING[5];
    public static final String   CENTER        = Constants.TABLE_STRING[6];
    public static final String   BUTTOM_LEFT   = Constants.TABLE_STRING[7];
    public static final String   BUTTOM_MIDDLE = Constants.TABLE_STRING[8];
    public static final String   BUTTOM_RIGHT  = Constants.TABLE_STRING[9];
    public static final String   DASH          = Constants.TABLE_STRING[10];

    public static void main(String[] args)
    {

    }

    public static final String rpad(Object value, int length, String padValue)
    {
        return rpad(value, padValue, length);
    }

    public static final String rpad(Object value, String padValue, int length)
    {
        if(length > 0)
        {
            String tranVal = toString(value, "").replaceAll(Constants.REX_TAB, Constants.TAB_SPACE).replaceAll(Constants.REX_TAB, Constants.SPACE);
            return tranVal + getPadVal(tranVal, padValue, length);
        }
        else
        {
            return toString(value);
        }
    }

    public static final String lpad(Object value, int length, String padValue)
    {
        return lpad(value, padValue, length);
    }

    public static final String lpad(Object value, String padValue, int length)
    {
        String tranVal = toString(value, "").replaceAll(Constants.REX_TAB, Constants.TAB_SPACE).replaceAll(Constants.REX_TAB, Constants.SPACE);
        return getPadVal(tranVal, padValue, length) + tranVal;
    }

    public static String getPadVal(String value, String padValue, int length)
    {
        if(value == null)
        {
            return "";
        }

        if(padValue == null)
        {
            padValue = " "; // 스페이스로함
        }

        int orglength = getLength(toPrintString(value));
        int padlength = getLength(padValue);

        if(padlength == 0)
        {
            padlength = 1;
        }

        if(orglength > length)
        {
            return "";
        }

        length++; // 이래야 맞는다

        StringBuilder sumPadValue = new StringBuilder();

        for(int i = 0; i < (length - orglength) / padlength; i++)
        {
            sumPadValue.append(padValue);
        }

        return sumPadValue.toString();
    }

    /**
     * <PRE>
     *  2Byte문자를 감안한 문자열을 길이를 반환한다
     * </PRE>
     *
     * @location StringUtil.java
     * @Method getLength
     * @cdate 2015. 10. 1. 오전 10:13:28
     * @version 1.0
     *
     * @param input
     * @return
     */
    public static final int getLength(Object input)
    {
        if(input == null)
        {
            return 0;
        }

        String inputs = toString(input);

        if(isEmpty(inputs))
        {
            return 0;
        }

        int strLength = 0;

        for(int i = 0; i < inputs.length(); i++)
        {
            String oneChar = inputs.charAt(i) + "";

            if(oneChar.getBytes().length > 1) // 2byte문자로 인식
            {
                strLength += 2;
            }
            else
            {
                strLength++;
            }
        }

        return strLength;
    }

    public static final String toPrintString(Object input)
    {
        try
        {
            return toPrintString(input, 0, Constants.NULL_STR);
        }
        catch(Exception e)
        {
//            CommonUtil.printException(e);
            System.out.println(e);
        }

        return "";
    }

    public static String toPrintString(Object input, int depth, String defaultVal)
    {
        StringBuilder sb = new StringBuilder();

        if(input instanceof Map)
        {
            Map<?, ?> map = ((Map<?, ?>) input);

            sb.append(Constants.NEW_LINE);
            sb.append("---------------------------------------------------------------------------------").append(Constants.NEW_LINE);
            sb.append("Key                                     | Value"                                  ).append(Constants.NEW_LINE);
            sb.append("----------------------------------------+----------------------------------------").append(Constants.NEW_LINE);

            int keylength = 40;

            for(Object key : map.keySet())
            {
                Object value = map.get(key);

                sb.append(rpad(toString(key, defaultVal), " ", keylength));
                sb.append("| ");

                // 스페이스 40 개를 한번에 addSpace 한다
                toPrintString(10, sb, value, defaultVal);
            }

            sb.append("---------------------------------------------------------------------------------").append(Constants.NEW_LINE);
        }
        else if(input instanceof Throwable)
        {
            sb.append(getStackTrace((Throwable)input));

            sb.append(Constants.NEW_LINE);
        }
        else
        {
            // 실제로는 1씩 누적이 되는것이다. 왜냐하면 addTabs 의 결과를 다시 addTabs 하기 때문이다
            toPrintString(input, 1, sb, defaultVal);
        }

        return addTabs(sb.toString(), depth);
    }

    private static void toPrintString(Object input, int depth, StringBuilder sb, String defaultVal)
    {
        if(input == null)
        {
            sb.append(defaultVal);

            return;
        }

        if(input instanceof Map)
        {
            sb.append(toPrintString(input, depth, defaultVal));
            sb.append(Constants.NEW_LINE);
        }
        else if(input instanceof List) // ArrayList < List < Collection < Iterable
        {
            List<?> list = (List<?>)input;

            if(list.isEmpty())
            {
                return;
            }

            if(list.get(0) instanceof Map)
            {
                sb.append(StringUtil.listMapToLogString(((List<Map<String, Object>>) input)));

                return;
            }

            sb.append(makeLogSentence(LEFT_WAP + "List size:" + list.size() + RIGHT_WAP, Constants.LOG_STRING_SIZE, "-")).append(Constants.NEW_LINE);

            for(Object object : list)
            {
                sb.append(toPrintString(object, depth, defaultVal));
                sb.append(Constants.NEW_LINE);
            }

            sb.append(makeLogSentence(LEFT_WAP + "End List" + RIGHT_WAP, Constants.LOG_STRING_SIZE, "-")).append(Constants.NEW_LINE);
        }
        else if(input instanceof Set)
        {
            sb.append(makeLogSentence(LEFT_WAP + "Set size:" + ((Set<?>) input).size() + RIGHT_WAP, Constants.LOG_STRING_SIZE, "-")).append(Constants.NEW_LINE);

            for(Object object : (Set<?>) input)
            {
                sb.append(toPrintString(object, depth, defaultVal));
                sb.append(Constants.NEW_LINE);
            }

            sb.append(makeLogSentence(LEFT_WAP + "End Set" + RIGHT_WAP, Constants.LOG_STRING_SIZE, "-")).append(Constants.NEW_LINE);
        }
        else if(input instanceof Queue)
        {
            sb.append(makeLogSentence(LEFT_WAP + "Queue size:" + ((Queue<?>) input).size() + RIGHT_WAP, Constants.LOG_STRING_SIZE, "-")).append(Constants.NEW_LINE);

            for(Object object : (Queue<?>) input)
            {
                sb.append(toPrintString(object, depth, defaultVal));
                sb.append(Constants.NEW_LINE);
            }

            sb.append(makeLogSentence(LEFT_WAP + "End Queue" + RIGHT_WAP, Constants.LOG_STRING_SIZE, "-")).append(Constants.NEW_LINE);
        }
        else if(input instanceof Collection)
        {
            sb.append(makeLogSentence(LEFT_WAP + "Collection size:" + ((Collection<?>) input).size() + RIGHT_WAP, Constants.LOG_STRING_SIZE, "-")).append(Constants.NEW_LINE);

            for(Object object : (Collection<?>) input)
            {
                sb.append(toPrintString(object, depth, defaultVal));
                sb.append(Constants.NEW_LINE);
            }

            sb.append(makeLogSentence(LEFT_WAP + "End Collection" + RIGHT_WAP, Constants.LOG_STRING_SIZE, "-")).append(Constants.NEW_LINE);
        }
        else if(input instanceof Iterable)
        {
            Iterator<?> it = ((Iterable<?>) input).iterator();

            if(!it.hasNext())
            {
                return;
            }

            int i = 0;
            sb.append(makeLogSentence(LEFT_WAP + "Iterable size:" + i + RIGHT_WAP, Constants.LOG_STRING_SIZE, "-")).append(Constants.NEW_LINE);

            while(it.hasNext())
            {
                sb.append(toPrintString(it.next(), depth, defaultVal));
                sb.append(Constants.NEW_LINE);
                i++;
            }

            sb.append(makeLogSentence(LEFT_WAP + "End Iterable" + RIGHT_WAP, Constants.LOG_STRING_SIZE, "-")).append(Constants.NEW_LINE);
        }
        else if(input instanceof Enumeration)
        {
            Enumeration<?> em = (Enumeration<?>) input;

            if(!em.hasMoreElements())
            {
                return;
            }

            int i = 0;
            sb.append(makeLogSentence(LEFT_WAP + "Enumeration size:" + i + RIGHT_WAP, Constants.LOG_STRING_SIZE, "-")).append(Constants.NEW_LINE);

            while(em.hasMoreElements())
            {
                sb.append(toPrintString(em.nextElement(), depth, defaultVal));
                sb.append(Constants.NEW_LINE);
                i++;
            }

            sb.append(makeLogSentence(LEFT_WAP + "End Enumeration" + RIGHT_WAP, Constants.LOG_STRING_SIZE, "-")).append(Constants.NEW_LINE);
        }
        else if(input instanceof ByteBuffer)
        {
            while(((ByteBuffer) input).hasRemaining())
            {
                sb.append((char) ((ByteBuffer) input).get());
            }
        }
        else if(input instanceof Throwable)
        {
//            sb.append(ExceptionUtils.getMessage((Throwable)input));
        }
        else if(input instanceof Object[])
        {
            Object[] objects = (Object[]) input;

            // 빈것이면 처리할 필요 없다.
            if(objects.length == 0)
            {
                return;
            }

            sb.append(makeLogSentence(LEFT_WAP + "Objects size:" + objects.length + RIGHT_WAP, Constants.LOG_STRING_SIZE, "-")).append(Constants.NEW_LINE);

            for(Object object : objects)
            {
                sb.append(toPrintString(object, depth, defaultVal));
                sb.append(Constants.NEW_LINE);
            }

            sb.append(makeLogSentence(LEFT_WAP + "End Objects" + RIGHT_WAP, Constants.LOG_STRING_SIZE, "-")).append(Constants.NEW_LINE);
        }
        else
        {
            sb.append(toString(input));
            sb.append(Constants.NEW_LINE);
        }
    }

    public static final String listMapToLogString(List<Map<String, Object>> listMap)
    {
        return listMapToLogString(listMap, Integer.MAX_VALUE);
    }
    public static final String listMapToLogString(List<Map<String, Object>> listMap, int maxRows)
    {
        if(listMap == null)
        {
            return null;
        }
        if(listMap.isEmpty())
        {
            return null;
        }
        String[][] arrays = null;


        if(listMap.size() > maxRows)
        {
            arrays = StringUtil.listMapToArrays(listMap.subList(0,  maxRows));
        }
        else
        {
            arrays = StringUtil.listMapToArrays(listMap);
        }

        if(arrays == null)
        {
            return null;
        }
        if(arrays.length == 0)
        {
            return null;
        }

        String logString = toLogString(arrays);

        logString += Constants.NEW_LINE + "                  " + listMap.size() + " Rows";

        if(listMap.size() > maxRows)
        {
            logString += "Print " + maxRows + "Row";
        }

        return logString;
    }

    public static final String[][] listMapToArrays(List<Map<String, Object>> listMap)
    {
        if(listMap == null)
        {
            return new String[][]{};
        }

        if(listMap.isEmpty())
        {
            return new String[][]{};
        }

        //헤더를 만들어준다. 키가 서로 틀릴수 잇으므로 새로운 키가 있을때마다 추가한다.
        Set<String> headSet = new LinkedHashSet<String>();

        for(int i = 0; i < listMap.size(); i++)
        {
            Map<String, Object> row = listMap.get(i);

            if(row != null && !row.isEmpty())
            {
                String[] headers = row.keySet().toArray(new String[0]);

                for(String header : headers)
                {
                    if(!headSet.contains(header))
                    {
                        headSet.add(header);
                    }
                }
            }
        }

        //실제 내용을 만든다 헤더부분이 있기 때문에 +1 한다.

        String[][] mapArray = new String[listMap.size() +1][];

        mapArray[0] = headSet.toArray(new String[0]);

        for (int i = 0; i < listMap.size(); i++)
        {
            Map<String, Object> row = listMap.get(i);

            //값부분은 위에서 만들어지 키를 가지고 찾아서 위치를 잡아준다
            String[] values = new String[mapArray[0].length];

            if(row !=null && !row.isEmpty())
            {
                for(int j = 0; j < mapArray[0].length; j++)
                {
                    String key = mapArray[0][j];
                    Object value = row.get(key);

                    if(values == null)
                    {
                        continue;
                    }
                    String strVal = StringUtil.toString(value, Constants.NULL_STR);

                    // LOG_STRING_SIZE 넘어 가는것은 잘라주고 엔터가 들어 간값도 하나로 이어준다
                    strVal = strVal.replaceAll(Constants.REX_TAB,  Constants.TAB_SPACE).replaceAll(Constants.REX_NEW_LINE, Constants.SPACE);

                    // strVal = StringUtil.stripSpecial(strVal); // 특수문자를 없앤다.
                    strVal = StringUtil.subString2Byte(strVal, Constants.LOG_STRING_SIZE);

                    values[j] = strVal;
                }
            }
            mapArray[i + 1] = values;

        }
        return mapArray;
    }

    public static final String subString2Byte(String input, int length)
    {
        int strLength = 0;
        int subLength = 0;

        subLength = input.length();

        for(int i =0; i < input.length(); i++)
        {
            if(strLength == length)
            {
                subLength = i;
                break;
            }
            if(strLength > length)
            {
                subLength = i - 1; //위에 숫자만큼만 크기를 정함
                break;
            }
            String oneChar = input.charAt(i) + "";

            if(oneChar.getBytes().length > 1) ///2byte문자로 인식
            {
                strLength += 2;
            }
            else
            {
                strLength ++;
            }
        }


        return input.substring(0, subLength);
    }

    /**
     * <PRE>
     *  Map의 Value값들을 처리하기 위한 메소드
     * </PRE>
     *
     * @className:StringUtil.java
     * @date     :2017. 12. 5. 오전 11:03:59
     * @version  :1.0
     * @author   :Noru
     * @Method   :toPrintString
     * @Return   :void
     */
    private static void toPrintString(int depth, StringBuilder sb, Object value, String defaultVal)
    {
        if(value instanceof Map)
        {
            sb.append(toPrintString(value, depth, defaultVal));
            sb.append(Constants.NEW_LINE);
        }
        else if(value instanceof List)
        {
            List<?> list = (List<?>) value;

            if(list.isEmpty())
            {
                sb.append(Constants.NEW_LINE);

                return;
            }

            // List Map 형태이면
            if(list.get(0) instanceof Map)
            {
                sb.append(Constants.NEW_LINE);
                sb.append(toPrintString(list, depth, defaultVal));
                sb.append(Constants.NEW_LINE);
            }
            else
            {
                for(Object object : list)
                {
                    sb.append(toPrintString(object, depth, defaultVal));
                    sb.append(Constants.NEW_LINE);
                }
            }
        }
        else if(value instanceof Iterable)
        {
            sb.append(Constants.NEW_LINE);
            Iterator<?> it = ((Iterable<?>) value).iterator();

            if(!it.hasNext())
            {
                return;
            }

            while(it.hasNext())
            {
                sb.append(toPrintString(it.next(), depth, defaultVal));
                sb.append(Constants.NEW_LINE);
            }
        }
        else if(value instanceof Enumeration)
        {
            sb.append(Constants.NEW_LINE);
            Enumeration<?> em = (Enumeration<?>) value;

            if(!em.hasMoreElements())
            {
                return;
            }

            while(em.hasMoreElements())
            {
                sb.append(toPrintString(em.nextElement(), depth, defaultVal));
                sb.append(Constants.NEW_LINE);
            }
        }
        else if(value instanceof ByteBuffer)
        {
            while(((ByteBuffer) value).hasRemaining())
            {
                sb.append((char) ((ByteBuffer) value).get());
            }

            sb.append(Constants.NEW_LINE);
        }
        else
        {
            String str = toString(value, defaultVal);

            // new line 이면 구조가 깨지므로 탭추가
            if(StringUtil.isEmpty(str))
            {
                // void
            }
            else if(StringUtil.isFirst(str, Constants.NEW_LINE))
            {
                sb.append(addTabs(str, depth));
            }
            else
            {
                // new line이 있으면 적용해줌
                if(str.contains(Constants.NEW_LINE))
                {
                    sb.append(Constants.NEW_LINE);
                    sb.append(addTabs(str, depth));
                }
                else
                {
                    sb.append(str);
                }
            }

            sb.append(Constants.NEW_LINE);
        }
    }

    public static final String[] toStringArray(String input)
    {
        return input.split(Constants.REX_NEW_LINE);
    }

    public static final String toString(Object input)
    {
        return toString(input, null);
    }

    public static final String toString(Object input, String defaultVal)
    {
        if(input == null)
        {
            return defaultVal;
        }

        if(input instanceof CharSequence)
        {
            return input.toString();
        }

        if(input instanceof Character)
        {
            return input.toString();
        }

        if(input instanceof Boolean)
        {
            return input + "";
        }

        if(input instanceof Date)
        {
            return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format((Date)input);
        }

        if(input instanceof int[])
        {
            StringBuilder retStr = new StringBuilder();
            int[] arrays = (int[]) input;

            for(int i = 0; i < arrays.length; i++)
            {
                if(i == arrays.length - 1)
                {
                    retStr.append(arrays[i]);
                }
                else
                {
                    retStr.append(arrays[i] + ",");
                }
            }

            return retStr.toString();
        }

        if(input instanceof float[])
        {
            StringBuilder retStr = new StringBuilder();
            float[] arrays = (float[]) input;

            for(int i = 0; i < arrays.length; i++)
            {
                if(i == arrays.length - 1)
                {
                    retStr.append(arrays[i]);
                }
                else
                {
                    retStr.append(arrays[i] + ",");
                }
            }

            return retStr.toString();
        }

        if(input instanceof long[])
        {
            StringBuilder retStr = new StringBuilder();
            long[] arrays = (long[]) input;

            for(int i = 0; i < arrays.length; i++)
            {
                if(i == arrays.length - 1)
                {
                    retStr.append(arrays[i]);
                }
                else
                {
                    retStr.append(arrays[i] + ",");
                }
            }

            return retStr.toString();
        }

        if(input instanceof double[])
        {
            StringBuilder retStr = new StringBuilder();
            double[] arrays = (double[]) input;

            for(int i = 0; i < arrays.length; i++)
            {
                if(i == arrays.length - 1)
                {
                    retStr.append(arrays[i]);
                }
                else
                {
                    retStr.append(arrays[i] + ",");
                }
            }

            return retStr.toString();
        }

        if(input instanceof short[])
        {
            StringBuilder retStr = new StringBuilder();
            short[] arrays = (short[]) input;

            for(int i = 0; i < arrays.length; i++)
            {
                if(i == arrays.length - 1)
                {
                    retStr.append(arrays[i]);
                }
                else
                {
                    retStr.append(arrays[i] + ",");
                }
            }

            return retStr.toString();
        }

        if(input instanceof char[])
        {
            StringBuilder retStr = new StringBuilder();
            char[] arrays = (char[]) input;

            for(int i = 0; i < arrays.length; i++)
            {
                if(i == arrays.length - 1)
                {
                    retStr.append(arrays[i]);
                }
                else
                {
                    retStr.append(arrays[i] + ",");
                }
            }

            return retStr.toString();
        }

        if(input instanceof byte[])
        {
            return Arrays.toString((byte[]) input);
        }

        if(input instanceof Object[])
        {
            return join((Object[]) input);
        }

        // input Stream을 String 변환
        if(input instanceof InputStream)
        {
            return inputStreamToString((InputStream)input);
        }

        return input.toString();
    }


    public static final String inputStreamToString(InputStream stream)
    {
        if(stream == null)
        {
            return null;
        }
        byte[] bytes = inputStreamToBytes(stream);

      try
      {
          return new String(bytes, Constants.EUC_KR);
      }
      catch(UnsupportedEncodingException e)
      {
//          CommonUtil.printException(e);
      }
    finally
    {
        try
        {
            stream.close();
        }
        catch (IOException e)
        {
//            printException(e);
            e.printStackTrace();
        }
    }

        return null;
    }

    public static final byte[] inputStreamToBytes(InputStream stream)
    {
//        return inputStreamToBytes(stream, Long.MAX_VALUE);
        return null;
    }


    public static final String addSpace(String s, int times)
    {
        return addSpace(s, times, "");
    }

    /**
     * <PRE>
     *  앞줄에 공백을 추가 해준다. 만일 times 인수가 음수면 공백을 제거 해준다.
     * </PRE>
     *
     * @className:StringUtil.java
     * @date     :2019. 3. 29. 오후 4:01:15
     * @version  :1.0
     * @author   :user
     * @Method   :addSpace
     * @Return   :String
     */
    public static final String addSpace(String input, int times, String added)
    {
        // 입력값이 비었으면 처리하지 않는다.
        if(isEmpty(input))
        {
            return input;
        }

        // 추가 공백이 0이면 아무런 것도 하지 안는다.
        if(times == 0)
        {
            return input;
        }

        String[] rows = toStringArray(input);

        StringBuilder sb = new StringBuilder();

        if(times < 0)
        {
            times = times * -1; // 양수로 변환

            for(int i = 0; i < rows.length; i++)
            {
                String row = rows[i];

                if(StringUtil.isNotEmpty(row))
                {
                    String ltrim = StringUtil.ltrim(input);

                    // 앞에 스페이스가 자를려고하는크기보다 많이 남아 있을때
                    if(row.length() - ltrim.length() > times)
                    {
                        row = row.substring(times);
                    }
                    else
                    {
                        row = ltrim; //전부제거
                    }
                }

                // 추감함
                sb.append(added);
                sb.append(row);

                // 맨마지막로우에서는 줄변경을 하지 않는다
                if(i != rows.length - 1)
                {
                    sb.append(Constants.NEW_LINE);
                }
            }
        }
        else
        {
            // 양수일때
            StringBuilder tabs = new StringBuilder();

            for(int i = 0; i < times; i++)
            {
                tabs.append(" ");
            }

            tabs.append(added);

            for(int i = 0; i < rows.length; i++)
            {
                sb.append(tabs).append(rows[i]);

                // 맨마지막로우에서는 줄변경을 하지 않는다
                if(i != rows.length - 1)
                {
                    sb.append(Constants.NEW_LINE);
                }
            }
        }

        return sb.toString();
    }

    public static final String addTabs(String s, int times)
    {
        return addTabs(s, times, "");
    }

    public static final String addTabs(String input, int times, String added)
    {
        return addSpace(input, times * 4, added);
    }

    public static final boolean isEmpty(String value)
    {
        return isEmpty(value, false);
    }

    /**
     * 입력한 값이 null 또는 null String 일 경우 true를 return 한다.
     *
     * <pre>
     *
     * [사용 예제]
     *
     * isEmpty("")      ===> true
     * isEmpty(null)    ===> true
     * isEmpty("1")     ===> false
     *
     * </pre>
     *
     * @param value
     * @return boolean
     */
    public static final boolean isEmpty(String value, boolean withTrim)
    {
        if(value == null || value.isEmpty())
        {
            return true;
        }

        if(withTrim)
        {
            return value.trim().isEmpty();
        }

        return false;
    }

    public static final boolean isNotEmpty(String value, boolean withTrim)
    {
        return !isEmpty(value, withTrim);
    }

    public static boolean isFirst(String input, String comp)
    {
        return isFirst(input, comp, true);
    }

    public static boolean isFirst(String input, String comp, boolean ignoreCase)
    {
        if(isEmpty(input) && isEmpty(comp))
        {
            return true;
        }

        if(isEmpty(input))
        {
            return false;
        }

        if(isEmpty(comp))
        {
            return true;
        }

        if(ignoreCase)
        {
            input = input.toUpperCase();
            comp = comp.toUpperCase();
        }

        int lastIndex = input.indexOf(comp);

        return lastIndex == 0;
    }

    private static final String join(Object... input)
    {
        return join(Constants.DELIMITER, input);
    }

    public static final String join(String... input)
    {
        return join(Constants.DELIMITER, input);
    }

    public static final String join(String delimiter, Collection<String> input)
    {
        if(input.isEmpty())
        {
            return "";
        }

        Iterator<String> iter = input.iterator();
        StringBuilder sb = new StringBuilder(iter.next());

        while(iter.hasNext())
        {
            sb.append(delimiter);
            sb.append(iter.next());
        }

        return sb.toString();
    }

    public static final String join(String delimiter, Object... input)
    {
        if(input == null)
        {
            return "";
        }

        StringBuilder sb = new StringBuilder();

        for(int i = 0; i < input.length; i++)
        {
            sb.append(input[i]);

            if(i != input.length - 1)
            {
                sb.append(delimiter); //마지막엔 안붙인다.
            }
        }

        return sb.toString();
    }

    public static final String join(String delimiter, short... input)
    {
        if(input == null)
        {
            return "";
        }

        StringBuilder sb = new StringBuilder();

        for(int i = 0; i < input.length; i++)
        {
            sb.append(input[i]);

            if(i != input.length - 1)
            {
                sb.append(delimiter); // 마지막엔 안붙인다.
            }
        }

        return sb.toString();
    }

    /**
     * <PRE>
     * 앞자리가 Constants.DELIMITER 가된다. 왜냐하면 구분을 할수 없기 때문에 뒤에 나오는것과
     * </PRE>
     *
     * @location StringUtil.java
     * @cdate 2013. 9. 6.
     * @version 1.0
     *
     * @tag
     * @param Constants.DELIMITER
     * @param input
     * @return
     */
    private static final String join(String delimiter, String... input)
    {
        if(input == null)
        {
            return "";
        }

        StringBuilder sb = new StringBuilder();

        for(int i = 0; i < input.length; i++)
        {
            sb.append(input[i]);

            if(i != input.length - 1)
            {
                sb.append(delimiter); // 마지막엔 안붙인다.
            }
        }

        return sb.toString();
    }


    public static final boolean isNotEmpty(String value)
    {
        return !isEmpty(value);
    }

//    public static final boolean isNotEmpty(Object value)
//    {
//        return CommonUtil.isNotEmpty(value);
//    }

    public static final String trim(String input)
    {
        if(input == null)
        {
            return "";
        }

        if(StringUtil.isEmpty(input))
        {
            return "";
        }

        input = input.replace("　", "");
        input = removeUTF8BOM(input);

        if(input != null)
        {
            return input.trim();
        }

        return "";
    }

    /**
     * <PRE>
     *  아래도 동일한 코드
        int i = 0;
        while(i < s.length() && Character.isWhitespace(s.charAt(i)))
        {
            i++;
        }
        return s.substring(i);

     * </PRE>
     *
     * @className:StringUtil.java
     * @date     :2018. 7. 3. 오후 8:07:16
     * @version  :1.0
     * @author   :Noru
     * @Method   :ltrim
     * @Return   :String
     */
    public static final String ltrim(String input)
    {
        if(input == null)
        {
            return null;
        }

        if(StringUtil.isEmpty(input))
        {
            return "";
        }

        return input.replaceAll("^\\s+", "");
    }

    /**
     * <PRE>
     *  아래도 동일한 코드
        int i = s.length() - 1;
        while(i > 0 && Character.isWhitespace(s.charAt(i)))
        {
            i--;
        }
        return s.substring(0, i + 1);
     * </PRE>
     *
     * @className:StringUtil.java
     * @date     :2018. 7. 3. 오후 8:07:49
     * @version  :1.0
     * @author   :Noru
     * @Method   :rtrim
     * @Return   :String
     */
    public static final String rtrim(String input)
    {
        if(input == null)
        {
            return null;
        }

        if(StringUtil.isEmpty(input))
        {
            return "";
        }

        return input.replaceAll("\\s+$", "");
    }

    public static final String makeLogSentence(String comment)
    {
        String chars = Constants.TABLE_STRING[new Random().nextInt(Constants.TABLE_STRING.length)];

        return makeLogSentence(comment, comment.getBytes().length + 44, chars);
    }

    public static final String makeLogSentence(String comment, int size)
    {
        String chars = Constants.TABLE_STRING[new Random().nextInt(Constants.TABLE_STRING.length)];

        return makeLogSentence(comment, size, chars);
    }

    /**
     * <PRE>
     *  로그를 형식의 문장을 만든다.
     * </PRE>
     *
     * @location StringUtil.java
     * @cdate 2013. 9. 10.
     * @version 1.0
     *
     * @tag
     * @param comment
     * @param size
     * @param chars
     * @return
     */
    public static final String makeLogSentence(String comment, int size, String chars)
    {
        // 앞까지 패딩한 크기를 구한다
        int paddingSize = (size - getLength(comment)) / 2;

        String returnString = lpad("", chars, paddingSize) + comment + " " + rpad("", chars, paddingSize);
        String addSpace = lpad("", " ", size - returnString.getBytes().length);
        String rtnStr = lpad("", chars, paddingSize) + " " + comment + addSpace + rpad("", chars, paddingSize);

        if(rtnStr.length() > size)
        {
            return rtnStr.substring(0, size);
        }
        else
        {
            return rtnStr;
        }
    }


    /**
     * <PRE>
     * UTF-8로 저장된 File형식에서 Bom을 제거 해준다.
        Encoding       hexadecimal   decimal     int
        UTF-8          EF BB BF      239 187 191 65279
        UTF-16 Big     FE FF         254 255
        UTF-16 Little  FF FE         255 254
        UTF-32 Big     00 00 FE FF   0 0 254 255
        UTF-32 Little  FF FE 00 00   255 254 0 0

        //테스트코드
        String fileName = "C:/temp/test.txt";

        FileUtil.bytesToFile(CodecUtil.decodeHex("EFBBBF"),   fileName, false);
        FileUtil.bytesToFile("노루만세".getBytes(), fileName, true );
     * </PRE>
     *
     * @optitle
     * @cdate 2012. 9. 5.
     * @version 1.0
     *
     * @tag
     * @param input
     * @return
     */
    public static final String removeUTF8BOM(String input)
    {
        if((input != null && input.length() >= 1) && input.startsWith(Constants.UTF8_BOM))
        {
            return input.substring(1);
        }

        return input;
    }
    public static final <T> T[] arrayConcat(T[] a, T[] b)
    {

        if(a == null && b == null)
        {
            return a;
        }
        if(a == null)
        {
            return b;
        }
        if(b == null)
        {
            return a;
        }
        final int alen = a.length;
        final int blen = b.length;

        final T[] result = (T[]) Array.newInstance(a.getClass().getComponentType(), alen + blen);

        System.arraycopy(a, 0, result, 0    , alen);
        System.arraycopy(b, 0, result, alen , blen);

        return result;
    }

    /**
     * <PRE>
     *  아래와 같은 포맷 String을 만든다.
        ┏-----┳-------┓
        ┃CD_ID┃CD_NM  ┃
        ┣-----╋-------┫
        ┃A001 ┃      1┃
        ┃ 0013┃VARCHAR┃
        ┃ 0013┃NUMBER ┃
        ┖-----┸-------┚
     * </PRE>
     *
     * @className:AlignUtil.java
     * @date     :2019. 6. 24. 오후 11:21:55
     * @version  :1.0
     * @author   :NORU
     * @Method   :toLogString
     * @Return   :String
     */
    public static String toLogString(Object[][] arrays)
    {
        StringBuilder alignedString     = new StringBuilder();
        int           maxLengthOfArrays = arrays[0].length;
        int[]         lengthOfColumns   = new int[maxLengthOfArrays];
        for(int i = 0; i < arrays.length; i++)
        {
            if(maxLengthOfArrays > arrays[i].length)
            {
                arrays[i] = arrayConcat(arrays[i], new String[maxLengthOfArrays - arrays[i].length]);
            }
        }
        // 정렬을 위해 컬럼의 최대 값의 크기를 가져온다
        for(int i = 0; i < maxLengthOfArrays; i++)
        {
            lengthOfColumns[i] = maxLength(i, arrays); // 배열의 최대값을 얻는다.
        }
        StringBuilder mainHeadLine = new StringBuilder();
        for(int i = 0; i < lengthOfColumns.length; i++)
        {
            int columnLength = lengthOfColumns[i];
            if(i == 0)
            {
                // 첫줄 처리 만일 컬럼이 1개밖에 없는경우
                if(lengthOfColumns.length == 1)
                {
                    mainHeadLine.append(TOP_LEFT + StringUtil.rpad("", DASH, columnLength) + TOP_RIGHT);
                }
                else
                {
                    mainHeadLine.append(TOP_LEFT + StringUtil.rpad("", DASH, columnLength));
                }
            }
            else
            {
                if(lengthOfColumns.length - 1 == i)
                {
                    // 마지막줄
                    mainHeadLine.append(TOP_MIDLE + StringUtil.rpad("", DASH, columnLength) + TOP_RIGHT);
                }
                else
                {
                    mainHeadLine.append(TOP_MIDLE + StringUtil.rpad("", DASH, columnLength));
                    // 중간
                }
            }
        }
        alignedString.append(mainHeadLine + Constants.NEW_LINE);
        // 가로세로를 바꾸면서 출력한다.
        for(int i = 0; i < arrays.length; i++)
        {
            for(int j = 0; j < maxLengthOfArrays; j++)
            {
                int    columnLength = lengthOfColumns[j];
                String content      = StringUtil.toString(arrays[i][j]);
                // 처음 컬럼
                if(j == 0)
                {
                    alignedString.append(VERTICAL);
                }
                // 마지막 컬럼
                if(j == maxLengthOfArrays - 1)
                {
                    if(arrays[i][j] == null)
                    {
                        alignedString.append(StringUtil.rpad("", " ", columnLength));
                    }
                    else
                    {
                        if(StringUtil.isNumber(content))
                        {
                            alignedString.append(StringUtil.lpad(content, " ", columnLength));
                        }
                        else
                        {
                            alignedString.append(StringUtil.rpad(content, " ", columnLength));
                        }
                    }
                    alignedString.append(VERTICAL);
                }
                else
                {
                    if(arrays[i][j] == null)
                    {
                        alignedString.append(StringUtil.rpad("", " ", columnLength)).append(VERTICAL);
                    }
                    else
                    {
                        if(StringUtil.isNumber(content))
                        {
                            alignedString.append(StringUtil.lpad(content, " ", columnLength)).append(VERTICAL);
                        }
                        else
                        {
                            alignedString.append(StringUtil.rpad(content, " ", columnLength)).append(VERTICAL);
                        }
                    }
                    if(lengthOfColumns.length == 1)
                    {
                        mainHeadLine.append(TOP_LEFT + StringUtil.rpad("", DASH, columnLength) + TOP_RIGHT);
                    }
                }
            }
            alignedString.append(Constants.NEW_LINE);
            if(i == 0)
            {
                StringBuilder tailHeadLine = new StringBuilder();
                for(int k = 0; k < lengthOfColumns.length; k++)
                {
                    int columnLength = lengthOfColumns[k];
                    if(k == 0)
                    {
                        // 첫줄 처리 만일 컬럼이 1개밖에 없는경우
                        if(lengthOfColumns.length == 1)
                        {
                            tailHeadLine.append(MIDDLE_LEFT + StringUtil.rpad("", DASH, columnLength) + MIDDLE_RIGHT);
                        }
                        else
                        {
                            tailHeadLine.append(MIDDLE_LEFT + StringUtil.rpad("", DASH, columnLength));
                        }
                    }
                    else
                    {
                        if(lengthOfColumns.length - 1 == k)
                        {
                            tailHeadLine.append(CENTER + StringUtil.rpad("", DASH, columnLength) + MIDDLE_RIGHT); // 마지막줄
                        }
                        else
                        {
                            tailHeadLine.append(CENTER + StringUtil.rpad("", DASH, columnLength)); // 중간
                        }
                    }
                }
                alignedString.append(tailHeadLine).append(Constants.NEW_LINE);
            }
        }
        // 최종 Line 을 만들어 준다
        StringBuilder lastLine = new StringBuilder();
        for(int i = 0; i < lengthOfColumns.length; i++)
        {
            int columnLength = lengthOfColumns[i];
            if(i == 0)
            {
                // 첫컬럼에 컬럼이 1개밖에 없을때
                if(lengthOfColumns.length == 1)
                {
                    lastLine.append(BUTTOM_LEFT + StringUtil.rpad("", DASH, columnLength) + BUTTOM_RIGHT);
                }
                else
                {
                    lastLine.append(BUTTOM_LEFT + StringUtil.rpad("", DASH, columnLength));
                }
            }
            else
            {
                if(lengthOfColumns.length - 1 == i)
                {
                    // 마지막줄
                    lastLine.append(BUTTOM_MIDDLE + StringUtil.rpad("", DASH, columnLength) + BUTTOM_RIGHT);
                }
                else
                {
                    // 중간
                    lastLine.append(BUTTOM_MIDDLE + StringUtil.rpad("", DASH, columnLength));
                }
            }
        }
        alignedString.append(lastLine);
        return alignedString.toString();
}
    /**
     *  index에 있는 값중 길이가 제일 큰 값의 값의크기 반환
     *
     * @optitle
     * @cdate 2011. 6. 9.
     * @version 1.0
     *
     * @tag
     * @param <T>
     * @param lc
     * @param src
     * @return
     */
    public static final <T> int maxLength(int lc, T[]... src)
    {
        int length = 0;

        for(T[] tmp : src)
        {
            if(tmp[lc] != null && length < StringUtil.getLength(tmp[lc]))
            {
                length = StringUtil.getLength(tmp[lc]);
            }
        }

        return length;
    }

    public static final boolean isNumber(Object input)
    {
        return isNumber(input, false);
    }

    public static final boolean isNumber(Object input, boolean notStartZero)
    {
        String str = toString(input);
        if(isEmpty(str))
        {
            return false;
        }
        if(str.charAt(0) == '-' || str.charAt(0) == '+')
        {
            str = str.substring(1);
        }

        if(str.indexOf('.') > -1)
        {
            str = str.replaceFirst("\\." , "");
        }

        if(str.length() > 1 && str.startsWith("0") && notStartZero)
        {
            return false;
        }

        return isDigit(str);
    }

    public static boolean isDigit(String cs)
    {
        if(isEmpty(cs))
        {
            return false;
        }
        int sz = cs.length();

        for(int i = 0; i < sz; i++)
        {
            if(!(Character.isDigit(cs.charAt(i))))
            {
                return false;
            }
        }

        return true;
    }

    /**
     * 스트림을 바이트로 변환한다.
     *
     * @optitle
     * @cdate 2011. 5. 27.
     * @version 1.0
     *
     * @tag
     * @param ins
     * @return
     * @throws IOException
     */
    public static final byte[] inputStreamToBytes(InputStream ins, long limit) throws IOException
    {
        if(ins == null)
        {
            return new byte[]{};
        }
        ByteArrayOutputStream baos   = null;
        byte[]                result = null;
        try
        {
            if(ins.available() == 0)
            {
                return new byte[]{};
            }
            baos = new ByteArrayOutputStream();
            byte[] buffer = new byte[Constants.BUFFER_SIZE];
            int    read   = 0;
            long totalLen = 0L;
            while(read != -1)
            {
                read = ins.read(buffer);
                if(read > 0)
                {
                    // 현재까지 읽은수량이 제한수량을 넘어 가면 남은수량만큼만 읽는다
                    if(totalLen + read > limit)
                    {
                        baos.write(buffer, 0, (int)(limit - totalLen));
                    }
                    else
                    {
                        baos.write(buffer, 0, read);
                    }
                }
                totalLen += read;
                if(totalLen >= limit)
                {
                    break;
                }
            }
            result = baos.toByteArray();
        }
        catch(Exception e)
        {
            printException(e);
        }
        finally
        {
            close(ins);
            close(baos);
        }
        return result;
    }
    public static final void printException(Throwable e)
    {
        if(e != null)
        {
            getStackTrace(e);
        }
    }
    public static String getStackTrace(final Throwable throwable) {
        final StringWriter sw = new StringWriter();
        final PrintWriter pw = new PrintWriter(sw, true);
        throwable.printStackTrace(pw);
        return sw.getBuffer().toString();
    }
    /**
     * <PRE>
     *  객체의 값이 존재하는지 여부
     * </PRE>
     *
     * @className:ObjectUtil.java
     * @date     :2019. 3. 22. 오후 3:32:47
     * @version  :1.0
     * @author   :user
     * @Method   :isEmpty
     * @Return   :boolean
     */
    public static final boolean isEmpty(Object input)
    {
        if(input == null)
        {
            return true;
        }
        else if(input instanceof CharSequence)
        {
            return ((CharSequence) input).length() == 0;
        }
        else if(input instanceof Character)
        {
            return isEmpty(((Character) input) + "");
        }
        else if(input instanceof Number)
        {
            return isEmpty(((Number) input).toString());
        }
        else if(input instanceof Boolean)
        {
            return false;
        }
        else if(input instanceof int[])
        {
            return ((int[]) input).length == 0;
        }
        else if(input instanceof float[])
        {
            return ((float[]) input).length == 0;
        }
        else if(input instanceof long[])
        {
            return ((long[]) input).length == 0;
        }
        else if(input instanceof double[])
        {
            return ((double[]) input).length == 0;
        }
        else if(input instanceof short[])
        {
            return ((short[]) input).length == 0;
        }
        else if(input instanceof char[])
        {
            return ((char[]) input).length == 0;
        }
        else if(input instanceof CharSequence[])
        {
            return ((CharSequence[]) input).length == 0;
        }
        else if(input instanceof Number[])
        {
            return ((Number[]) input).length == 0;
        }
        else if(input instanceof Character[])
        {
            return ((Character[]) input).length == 0;
        }
        else if(input instanceof Boolean[])
        {
            return ((Boolean[]) input).length == 0;
        }
        else if(input instanceof byte[])
        {
            return ((byte[]) input).length == 0;
        }
        else if(input instanceof Map)
        {
            return ((Map) input).isEmpty();
        }
        else if(input instanceof List) // ArrayList < List < Collection < Iterable
        {
            return ((List) input).isEmpty();
        }
        else if(input instanceof Collection)
        {
            return ((Collection) input).isEmpty();
        }
        else if(input instanceof Iterator)
        {
            return !((Iterator) input).hasNext();
        }
        else if(input instanceof Set)
        {
            return ((Set) input).isEmpty();
        }
        else if(input instanceof Queue)
        {
            return ((Queue) input).isEmpty();
        }
        else if(input instanceof Enumeration)
        {
            return !((Enumeration) input).hasMoreElements();
        }
        else if(input instanceof Object[])
        {
            return ((Object[]) input).length == 0;
        }
        else
        {
            // 나머지는
            return StringUtil.isEmpty(StringUtil.toString(input));
        }
    }

    /**
     * <PRE>
     *  Stream Resource를 닫는다
     *  이는 try catch 블럭에 쓰일수 있지만 여기 서는 수동으로 닫느다.
     * </PRE>
     *
     * @location CommonUtil.java
     * @cdate 2014. 11. 3.
     * @version 1.0
     * @tag
     * @param close
     */
    public static final void close(Closeable close)
    {
        if(close != null)
        {
            try
            {
                close.close();
            }
            catch(Exception e)
            {
                printException(e);
            }
        }
    }

    public static final void close(Connection conn)
    {
        if(conn != null)
        {
            try
            {
                conn.close();
            }
            catch(Exception e)
            {
                printException(e);
            }
        }
    }

    public static final void close(ObjectInput in)
    {
        if(in != null)
        {
            try
            {
                in.close();
            }
            catch(Exception e)
            {
                printException(e);
            }
        }
    }

    public static final void close(ObjectOutput close)
    {
        if(close != null)
        {
            try
            {
                close.close();
            }
            catch(Exception e)
            {
                printException(e);
            }
        }
    }

    public static final void close(PreparedStatement pstmt)
    {
        if(pstmt != null)
        {
            try
            {
                pstmt.close();
            }
            catch(Exception e)
            {
                printException(e);
            }
        }
    }

    public static final void close(ResultSet resultSet)
    {
        if(resultSet != null)
        {
            try
            {
                resultSet.close();
            }
            catch(Exception e)
            {
                printException(e);
            }
        }
    }

    public static final void close(Writer writer)
    {
        if(writer != null)
        {
            try
            {
                writer.close();
            }
            catch(Exception e)
            {
                printException(e);
            }
        }
    }
}

