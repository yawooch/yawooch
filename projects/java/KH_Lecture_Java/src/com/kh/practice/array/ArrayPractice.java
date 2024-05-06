package com.kh.practice.array;

import java.util.Scanner;

public class ArrayPractice
{
    /** 길이가 10인 배열을 선언하고 1부터 10까지의 값을 반복문을 이용하여 */
    public void practice1()
    {
        /*
         * 메소드 명 : public void practice1(){}
         * 길이가 10인 배열을 선언하고 1부터 10까지의 값을 반복문을 이용하여
         * 순서대로 배열 인덱스에 넣은 후 그 값을 출력하세요.
         * ex.
         * 1 2 3 4 5 6 7 8 9 10 
         */
        int[] arr = new int[10];

        for(int i = 1; i <= 10; i++)
        {
            arr[i-1] = i; 
        }
        
        for(int i = 0; i < arr.length; i++)
        {
            System.out.print(arr[i] + "  ");
        }
    }
    
    /** practice1() + 역순으로 배열 인덱스에 넣은 후 그 값을 출력하세요.
     */
    public void practice2()
    {
        /*
         * 메소드 명 : public void practice2(){}
         * 길이가 10인 배열을 선언하고 1부터 10까지의 값을 반복문을 이용하여
         * 역순으로 배열 인덱스에 넣은 후 그 값을 출력하세요.
         * ex.
         * 10 9 8 7 6 5 4 3 2 1 
         */
        int[] arr = new int[10];

        for(int i = 0; i < arr.length; i++)
        {
            arr[i] = arr.length-i; 
            System.out.print(arr[i] + "  ");
        }
    }
    
    /** 사용자에게 입력 받은 양의 정수만큼 배열 크기를 할당하고 1부터 입력 받은 값까지 배열에 초기화한 후 출력하세요. */
    public void practice3()
    {
        /*
         * 메소드 명 : public void practice3(){}
         * 사용자에게 입력 받은 양의 정수만큼 배열 크기를 할당하고
         * 1부터 입력 받은 값까지 배열에 초기화한 후 출력하세요.
         * ex.
         * 양의 정수 : 5
         * 1 2 3 4 5
         */
        
        Scanner sc = new Scanner(System.in);
        
        System.out.print("양의 정수 : ");
        int num = sc.nextInt();
        
        sc.close();
        
        int[] arr = new int[num];

        for(int i = 0; i < arr.length; i++)
        {
            arr[i] = i+1; 
        }
        
        for(int i = 0; i < arr.length; i++)
        {
            System.out.print(arr[i] + "  ");
        }
    }
    
    /** 길이가 5인 String배열을 선언하고 “사과”, “귤“, “포도“, “복숭아”, “참외“로 초기화 한 후 배열 인덱스를 활용해서 귤을 출력하세요. */
    public void practice4()
    {
        /*
         * 메소드 명 : public void practice4(){}
         * 길이가 5인 String배열을 선언하고 “사과”, “귤“, “포도“, “복숭아”, “참외“로 초기화 한 후
         * 배열 인덱스를 활용해서 귤을 출력하세요.
         * ex.
         * 귤
         */
        String[] arr = new String[]{"사과", "귤", "포도", "복숭아", "참외"};
        
        System.out.print(arr[1]);
        
    }
    
    /** 문자열을 입력 받아 문자 하나하나를 배열에 넣고 검색할 문자가 문자열에 몇 개 들어가 있는지
     * 개수와 몇 번째 인덱스에 위치하는지 인덱스를 출력하세요.
     */
    public void practice5()
    {
        /*
         * 메소드 명 : public void practice5(){}
         * 문자열을 입력 받아 문자 하나하나를 배열에 넣고 검색할 문자가 문자열에 몇 개 들어가 있는지
         * 개수와 몇 번째 인덱스에 위치하는지 인덱스를 출력하세요.
         * ex.
         * 문자열 : application
         * 문자 : i
         * application에 i가 존재하는 위치(인덱스) : 4 8 
         * i 개수 : 2
         */
        //내 방법
//        Scanner sc = new Scanner(System.in);
//        
//        System.out.print("문자열 : ");
//        String input = sc.nextLine();
//
//        System.out.print("문자 : ");
//        char ch = sc.next().charAt(0);
//        
//        char[] arr = new char[input.length()];
//        
//        String index = "";
//        int cnt      = 0;
//        
//        for(int i = 0; i < input.length(); i ++)
//        {
//            arr[i] = input.charAt(i);
//            if(ch == input.charAt(i))
//            {
//                cnt++;
//                index += i + "  ";
//            }
//        }
//        System.out.printf("%s에 %c가 존재하는 위치(인덱스) : %s\n",input,ch,index);
//        System.out.println(ch + " 개수 : " + cnt);
//        sc.close();
        
        Scanner sc = new Scanner(System.in);
        
        System.out.print("문자열 : ");
        String input = sc.nextLine();
        char[] arr   = new char[input.length()];

        for(int i = 0; i < input.length(); i ++)
        {
            arr[i] = input.charAt(i);
        }
        
        System.out.print("문자 : ");
        char ch = sc.next().charAt(0);
        
        String index = "";
        int cnt      = 0;
        
        for(int i = 0; i < arr.length; i ++)
        {
            if(ch == arr[i])
            {
                cnt++;
                index += i + "  ";
            }
        }
        System.out.println(input + "에 "+ ch +"가 존재하는 위치(인덱스) : " + index);
        System.out.println(ch + " 개수 : " + cnt);
        sc.close();
        
    }
    
    /** <pre>"월" ~ "일"까지 초기화된 문자열 배열을 만들고
     * 0부터 6까지 숫자를 입력 받아
     * 입력한 숫자와 같은 인덱스에 있는 요일을 출력하고
     * 범위에 없는 숫자를 입력 시 "잘못 입력하셨습니다"를 출력하세요.</pre> */
    public void practice6()
    {
        /*
         * 메소드 명 : public void practice6(){}
         * "월" ~ "일"까지 초기화된 문자열 배열을 만들고 0부터 6까지 숫자를 입력 받아
         * 입력한 숫자와 같은 인덱스에 있는 요일을 출력하고
         * 범위에 없는 숫자를 입력 시 "잘못 입력하셨습니다"를 출력하세요.
         * ex.
         * 0 ~ 6 사이 숫자 입력 : 4
         * 금요일
         * 0 ~ 6 사이 숫자 입력 : 7
         * 잘못 입력하셨습니다.
         */
        Scanner sc    = new Scanner(System.in);
        String days[] = new String[] {"월" ,"화" ,"수" ,"목" ,"금" ,"토" ,"일"};
        
        System.out.print("0 ~ 6 사이 숫자 입력 : ");
        int daysNum = sc.nextInt();
        
        if(daysNum < 0 || daysNum > 6)
        {
            System.out.println("잘못 입력하셨습니다.");
        }
        else
        {
            System.out.println(days[daysNum] + "요일");
        }
        
        
        sc.close();
    }
    
    /** 사용자가 배열을 선언 및 할당하고 직접 값을 입력하여 각각의 인덱스에 값을 초기화 하세요. */
    public void practice7()
    {
        /*
         * 메소드 명 : public void practice7(){}
         * 사용자가 배열의 길이를 직접 입력하여 그 값만큼 정수형 배열을 선언 및 할당하고
         * 배열의 크기만큼 사용자가 직접 값을 입력하여 각각의 인덱스에 값을 초기화 하세요.
         * 그리고 배열 전체 값을 나열하고 각 인덱스에 저장된 값들의 합을 출력하세요.
         * ex.
         * 정수 : 5
         * 배열 0번째 인덱스에 넣을 값 : 4
         * 배열 1번째 인덱스에 넣을 값 : -4
         * 배열 2번째 인덱스에 넣을 값 : 3
         * 배열 3번째 인덱스에 넣을 값 : -3
         * 배열 4번째 인덱스에 넣을 값 : 2
         * 4 -4 3 -3 2 
         * 총 합 : 2
         */
        Scanner sc    = new Scanner(System.in);
        System.out.print("정수 : ");
        int indexSize = sc.nextInt();
        
        int arr[] = new int[indexSize];
        int total = 0;
        
        for(int i = 0; i < arr.length; i ++)
        {
            System.out.print("배열 0번째 인덱스에 넣을 값 : ");
            int arrVal = sc.nextInt();
            arr[i] = arrVal;
            total += arrVal;
        }
        
        for(int i = 0; i < arr.length; i ++)
        {
            System.out.println(arr[i] + " ");
        }
        
        System.out.println("총 합 : " + total);
        
        
        sc.close();
    }
    
    /** 3이상인 홀수 1부터 1씩 증가하여 중간 이후부터는 1씩 감소하여 값을 출력하세요. */
    public void practice8()
    {
        /*
         * 메소드 명 : public void practice8(){}
         * 3이상인 홀수 자연수를 입력 받아 
         * 배열의
         * 중간까지는 1부터 1씩 증가하여 오름차순으로 값을 넣고,
         * 중간 이후부터 끝까지는 1씩 감소하여 내림차순으로 값을 넣어 출력하세요.
         * 단, 
         * 입력한 정수가 홀수가 아니거나 3 미만일 경우
         * “다시 입력하세요”를 출력하고 다시 정수를 받도록 하세요.
         * ex.
         * 정수 : 4
         * 다시 입력하세요.
         * 정수 : -6
         * 다시 입력하세요.
         * 정수 : 5
         * 1, 2, 3, 2, 1
         */
        Scanner sc = new Scanner(System.in);
        
        while(true)
        {
            System.out.print("정수 : ");
            int num = sc.nextInt();
            
            if(num %2 != 1 || num <3)
            {
                System.out.println("다시 입력하세요.");
                continue;
            }
            
            int[] intArr = new int[num];
            int val = 1;
            for(int i = 0; i < intArr.length; i++ )
            {
                intArr[i] = val;
                
                if(i < intArr.length/2+1)
                {
                    val++;
                }
                else
                {
                    val--;
                }
            }
            for(int i = 0; i < intArr.length; i++ )
            {
                System.out.print(intArr[i] + ",  ");
            }
            
            
            sc.close();
            break;
        }
        
        
    }
    
    /** 배열에 있으면 “OOO 치킨 배달 가능“, 없으면 “OOO 치킨은 없는 메뉴입니다“를 출력하세요. */
    public void practice9()
    {
        /*
         * 메소드 명 : public void practice9(){}
         * 사용자가 입력한 값이 배열에 있는지 검색하여
         * 있으면 “OOO 치킨 배달 가능“, 없으면 “OOO 치킨은 없는 메뉴입니다“를 출력하세요.
         * 단, 치킨 메뉴가 들어가있는 배열은 본인 스스로 정하세요.
         * ex.
         * 치킨 이름을 입력하세요 : 양념 
         * 양념치킨 배달 가능 
         * 치킨 이름을 입력하세요 : 불닭
         * 불닭치킨은 없는 메뉴입니다.
         */
        
        String[] foods = new String[]{"양념" ,"간장" ,"후라이드" ,"뿌링클" ,"파닭"};
        
        Scanner sc = new Scanner(System.in);
        
        System.out.print("치킨 이름을 입력하세요 : ");
        String inputStr = sc.nextLine();
        
        for(int i = 0; i < foods.length; i++)
        {
            if(inputStr.equals(foods[i]))
            {
                System.out.println(inputStr + "치킨 배달 가능");
                break;
            }
            else if(i == foods.length-1)
            {
                System.out.println(inputStr + "치킨은 없는 메뉴입니다.");
            }
        }
        
        sc.close();
    }
        
    /** 주민등록번호 성별자리 이후부터 *로 가리고 출력하세요. 단, 원본 배열 값은 변경 없이 배열 복사본으로 변경하세요. */
    public void practice10()
    {
        /*
         * 메소드 명 : public void practice10(){}
         * 주민등록번호 성별자리 이후부터 *로 가리고 출력하세요.
         * 단, 원본 배열 값은 변경 없이 배열 복사본으로 변경하세요.
         * ex.
         * 주민등록번호(-포함) : 123456-1234567
         * 123456-1******
         */
        //내방법 - copy배열에 다 넣고 출력표시를 바꿔주는 방법 
//        Scanner sc = new Scanner(System.in);
//        
//        System.out.print("주민등록번호(-포함) : ");
//        String ssn = sc.nextLine();
//        
//        char origArrChar[] = new char[ssn.length()];
//        
//        for(int i = 0; i < ssn.length(); i ++)
//        {
//            origArrChar[i] = ssn.charAt(i);
//        }
//        char copyArrChar[] = origArrChar.clone();
//        
//        for(int i = 0; i < copyArrChar.length; i++)
//        {
//            if(i > 7)
//            {
//                System.out.print("*");
//            }
//            else 
//            {
//                System.out.print(copyArrChar[i]);
//            }
//        }
//        sc.close();
        

        Scanner sc = new Scanner(System.in);
        
        System.out.print("주민등록번호(-포함) : ");
        String ssn = sc.nextLine();
        
        char origArrChar[] = new char[ssn.length()];
        
        //입력 받은 번호를 원본배열에 넣는 작업
        for(int i = 0; i < ssn.length(); i ++)
        {
            origArrChar[i] = ssn.charAt(i);
        }
        //원본배열을 복사배열로 복제한다.
        char copyArrChar[] = origArrChar.clone();
        
        //복사배열뒷 부분을 
        for(int i = copyArrChar.length - 1; i >= 8; i--)
        {
            copyArrChar[i] = '*';
        }
        //문자형(char)의 배열은 배열 전체의 값을 print로 출력할수 있다.
        System.out.print(copyArrChar);
        
        sc.close();
    }
    
    /** 10개의 값을 저장할 수 있는 정수형 배열을 선언 및 할당하고 1~10 사이의 난수를 발생시켜 배열에 초기화한 후 출력하세요. */
    public void practice11()
    {
        /*
         * 메소드 명 : public void practice11(){}
         * 10개의 값을 저장할 수 있는 정수형 배열을 선언 및 할당하고
         * 1~10 사이의 난수를 발생시켜 배열에 초기화한 후 출력하세요.
         * ex.
         * 9 7 6 2 5 10 7 2 9 6 
         */
        
        int[] arrInt = new int[10];
        
        for(int i =0; i < arrInt.length;i++)
        {
            arrInt[i] = (int)(Math.random() * 10 +1);
            System.out.printf("%d ", arrInt[i]);
        }
    }
        
    /** practice11() + 배열 전체 값과 그 값 중에서 최대값과 최소값을 출력하세요. */
    public void practice12()
    {
        /*
         * 메소드 명 : public void practice12(){}
         * 10개의 값을 저장할 수 있는 정수형 배열을 선언 및 할당하고
         * 1~10 사이의 난수를 발생시켜 배열에 초기화 후
         * 배열 전체 값과 그 값 중에서 최대값과 최소값을 출력하세요.
         * ex.
         * 5 3 2 7 4 8 6 10 9 10 
         * 최대값 : 10
         * 최소값 : 2
         */
        int[] arrInt = new int[10];
        int min = 10;
        int max = 1;
        
        for(int i =0; i < arrInt.length;i++)
        {
            arrInt[i] = (int)(Math.random() * 10 +1);
            System.out.printf("%d ", arrInt[i]);
            max = max > arrInt[i]? max : arrInt[i];
            min = min < arrInt[i]? min : arrInt[i];
        }
        System.out.println();
        System.out.println("최대값 : " + max);
        System.out.println("최소값 : " + min);
    }
        
    /** 1~10 사이의 난수를 발생시켜 중복된 값이 없게 배열에 초기화한 후 출력하세요. */
    public void practice13()
    {
        /*
         * 메소드 명 : public void practice13(){}
         * 10개의 값을 저장할 수 있는 정수형 배열을 선언 및 할당하고
         * 1~10 사이의 난수를 발생시켜 중복된 값이 없게 배열에 초기화한 후 출력하세요.
         * ex.
         * 4 1 3 6 9 5 8 10 7 2
         */
        int[] arrInt = new int[10];
        
        for(int i =0; i < arrInt.length;i++)
        {
            boolean isExist = false;
            int tmpRandom = (int)(Math.random() * 10 +1);
            //지금까지 배열에 들어간 값에서 같은 값이 있는지 확인
            for(int j =0; j <= i; j++)
            {
                if(arrInt[j] == tmpRandom)
                {
                    isExist = true;
                    break;//시간절약을 위해 찾기만 하면 for문을 나간다.
                }
            }
            if(isExist)
            {
                i--;
                continue;
            }
            arrInt[i] = tmpRandom;
        }

        for(int i =0; i < arrInt.length;i++)
        {
            System.out.printf("%d ", arrInt[i]);
        }
    }
    
    /** 로또 번호 자동 생성기 프로그램을 작성하는데 중복 값 없이 오름차순으로 정렬하여 출력하세요. */
    public void practice14()
    {
        /*
         * 메소드 명 : public void practice14(){}
         * 로또 번호 자동 생성기 프로그램을 작성하는데 중복 값 없이 오름차순으로 정렬하여 출력하세요.
         * ex.
         * 3 4 15 17 28 40  
         */
        int[] arrInt = new int[6];
//        int[] arrInt = new int[] {99, 1, 67, 56, 62, 72};
        /* *****************************************************************************
         * 중복없이 배열에 넣는다.
         * *****************************************************************************/
        for(int i =0; i < arrInt.length;i++)
        {
            boolean isExist = false;
            //로또번호는 45이하 숫자란다.
//            int tmpRandom ;
//            while(true)
//            {
//                int tmpNum = (int)(Math.random() * 100 +1);
//                if(!(tmpNum < 46))
//                {
//                    continue;
//                }
//                else
//                {
//                    tmpRandom = tmpNum;
//                    break;
//                }
//            }
            //45를 곱해도 범위대로 잘나온단다
            int tmpRandom = (int)(Math.random() * 45 +1);
            
            //지금까지 배열에 들어간 값에서 같은 값이 있는지 확인
            for(int j =0; j <= i; j++)
//            for(int j =0; j < arrInt.length; j++)
            {
                if(arrInt[j] == tmpRandom)
                {
                    isExist = true;
                    break; //시간절약을 위해 찾기만 하면 for문을 나간다.
                    //         =>아래에 수행하는 문장이 별로 없어서 시간상 단축은 얼마 안되는 것 같다.
                }
            }
            if(isExist)
            {
                i--;
                continue;
            }
            arrInt[i] = tmpRandom;
        }
        
        /* *****************************************************************************
         * 입력된 배열을 오름차순으로 정렬한다.
         * *****************************************************************************/
        for(int i = 6; i >= 0; i --)
        {
            for(int j = 1; j < arrInt.length; j ++)
            {
                if(j != 0 && arrInt[j-1] > arrInt[j])
                {
                    int tmpInt;
                    tmpInt      = arrInt[j-1];
                    arrInt[j-1] = arrInt[j];
                    arrInt[j]   = tmpInt;
                }
            }
        }
//        Arrays.sort(arrInt);
        /* *****************************************************************************
         * Bonus 번호 추출
         * *****************************************************************************/
        //로또번호는 45이하 숫자란다.
        //45를 곱해도 범위대로 잘나온단다
        int tmpRandom = (int)(Math.random() * 45 +1);

        /* *****************************************************************************
         * 결과값 출력
         * *****************************************************************************/
        for(int i =0; i < arrInt.length;i++)
        {
            System.out.print(arrInt[i] + ((i == arrInt.length-1)?"":",") + " ");
        }
        System.out.println("+ " + tmpRandom);
    }

    /** 문자열을 입력 받아 문자열에 어떤 문자가 들어갔는지 배열에 저장하고 문자의 개수와 함께 출력하세요. */
    public void practice15()
    {
        /*
         * 메소드 명 : public void practice15(){}
         * 문자열을 입력 받아 문자열에 어떤 문자가 들어갔는지 배열에 저장하고
         * 문자의 개수와 함께 출력하세요.
         * ex.
         * * 문자열 : application
         * 문자열 : aplicton
         * 문자열에 있는 문자 : a, p, l, i, c, t, o, n
         * 문자 개수 : 8
         */
        Scanner sc = new Scanner(System.in);
        System.out.print("문자열 : ");
        String inputStr = sc.nextLine();
        
        char[] charArr = new char[inputStr.length()];
        
        for(int i = 0; i< inputStr.length(); i++) 
        {
            charArr[i] = inputStr.charAt(i);
        }
        
        String rstStr = "";
        for(int i = 0; i< charArr.length-1; i++) 
        {
            rstStr += charArr[i] + ", ";
        }
        System.out.println("문자열에 있는 문자 : " + rstStr + charArr[charArr.length-1]);
        System.out.println("문자 개수 : " + charArr.length);
        
        sc.close();
    }
    
    /** 
     * 사용자가 입력한 배열의 길이만큼의 문자열 배열을 선언 및 할당
     * 배열의 인덱스에 넣을 값 역시 사용자가 입력하여 초기화 하세요.
     * 단, 사용자에게 배열에 값을 더 넣을지 물어보고 몇 개를 더 입력할 건지,
     * 늘린 곳에 어떤 데이터를 넣을 것인지 받으세요.
     * 사용자가 더 이상 입력하지 않겠다고 하면 배열 전체 값을 출력하세요.
     */
    public void practice16()
    {
        /*
         * 메소드 명 : public void practice16(){}
         * 사용자가 입력한 배열의 길이만큼의 문자열 배열을 선언 및 할당하고
         * 배열의 인덱스에 넣을 값 역시 사용자가 입력하여 초기화 하세요.
         * 단, 사용자에게 배열에 값을 더 넣을지 물어보고 몇 개를 더 입력할 건지,
         * 늘린 곳에 어떤 데이터를 넣을 것인지 받으세요.
         * 사용자가 더 이상 입력하지 않겠다고 하면 배열 전체 값을 출력하세요.
         * ex.
         * 배열의 크기를 입력하세요 : 3
         * 1번째 문자열 : 자바의 정석
         * 2번째 문자열 : 알고리즘
         * 3번째 문자열 : C프로그래밍
         * 더 값을 입력하시겠습니까?(Y/N) : y
         * 더 입력하고 싶은 개수 : 2
         * 4번째 문자열 : 인간관계
         * 5번째 문자열 : 자기계발
         * 더 값을 입력하시겠습니까?(Y/N) : y
         * 더 입력하고 싶은 개수 : 1
         * 6번째 문자열 : 영단어600
         * 더 값을 입력하시겠습니까?(Y/N) : n
         * [자바의 정석, 알고리즘, C프로그래밍, 인간관계, 자기계발, 영단어600]
         */
        Scanner sc = new Scanner(System.in);
        
        System.out.print("배열의 크기를 입력하세요 : ");
        int arrSize = sc.nextInt();
        String[] originArr  = new String[arrSize];
        String[] copyString;
        int cnt       = 1;
        sc.nextLine();
        
        
        while(true) 
        {
            System.out.print(cnt + "번째 문자열 : ");
            String cntInput = sc.nextLine();
            originArr[cnt-1] = cntInput;

            cnt++ ;
            if((cnt-1) == originArr.length)
            {
                System.out.print("더 값을 입력하시겠습니까?(Y/N) : ");
                char answer = sc.nextLine().charAt(0);
                if(answer == 'Y' || answer == 'y')
                {
                    System.out.print("더 입력하고 싶은 개수 : ");
                    int moreArrSize = sc.nextInt();
                    sc.nextLine();
                    
                    copyString = originArr.clone(); //원본값을 일단 옮겨둔다.
                    originArr = new String[originArr.length + moreArrSize];
                    //Arrays.copyOf()메서드는 배열의 크기까지 일치시키므로 적절하지 않음
                    System.arraycopy(copyString, 0,originArr, 0,copyString.length);
                    continue;
                }
                if(answer == 'N' || answer == 'n')
                {
                    break;
                }
                else
                {
                    System.out.print("대답이 올바르지 않습니다. \n프로그램을 종료합니다.");
                    break;
                }
            }
        }
        
        String rstStr = "[";
        for(int i = 0; i < originArr.length; i ++)
        {
            rstStr += originArr[i] + (i==originArr.length-1?"":", "); 
        }
        rstStr += "]";
        System.out.println(rstStr);
        
        sc.close();
   }
}
