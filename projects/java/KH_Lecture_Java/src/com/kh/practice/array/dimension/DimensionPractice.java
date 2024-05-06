package com.kh.practice.array.dimension;

import java.util.Scanner;

public class DimensionPractice
{
    /** 3행 3열짜리 문자열 배열을 선언 및 할당하고 인덱스 0행 0열부터 2행 2열까지 차례대로 접근하여 “(0, 0)”과 같은 형식으로 저장 후 출력하세요. */
    public void practice1()
    {
        /*
         * 메소드 명 : public void practice1(){}
         * 3행 3열짜리 문자열 배열을 선언 및 할당하고
         * 인덱스 0행 0열부터 2행 2열까지 차례대로 접근하여 “(0, 0)”과 같은 형식으로 저장 후 출력하세요.
         * ex.
         * (0, 0)(0, 1)(0, 2)
         * (1, 0)(1, 1)(1, 2)
         * (2, 0)(2, 1)(2, 2)
         */
        
        String[][] strArrD2 = new String[3][3];
        
        for(int x = 0; x < 3; x ++)
        {
            for(int y = 0; y < 3; y++)
            {
                strArrD2[x][y] = "("+ x +", " + y + ")";
            }
        }

        for(int x = 0; x < 3; x ++)
        {
            for(int y = 0; y < 3; y++)
            {
                System.out.print(strArrD2[x][y]);
            }
            System.out.println();
        }
    }

    /** <pre>4행 4열짜리 정수형 배열을 선언 및 할당하고
     * 1) 1 ~ 16까지 값을 차례대로 저장하세요.
     * 2) 저장된 저장된 값들을 차례대로 출력하세요.
     * </pre>
     */
    public void practice2()
    {
        /*
         * 메소드 명 : public void practice2(){}
         * 4행 4열짜리 정수형 배열을 선언 및 할당하고
         * 1) 1 ~ 16까지 값을 차례대로 저장하세요.
         * 2) 저장된 값들을 차례대로 출력하세요.
         * ex.
         * 1  2  3  4 
         * 5  6  7  8 
         * 9  10 11 12 
         * 13 14 15 16 
         */
        int[][] nums = new int[4][4];
        
        //내방법
//        int cnt = 1;
//        for(int i = 0; i < 4; i ++)
//        {
//            for(int j = 0; j < 4; j++)
//            {
//                nums[i][j] = cnt++;
//            }
//        }
        // 방법 2 - 공차를 이용한 대입
        for(int i = 0; i < 4; i ++)
        {
            for(int j = 0; j < 4; j++)
            {
                nums[i][j] = (j+1) + (i*4);
            }
        }

        for(int x = 0; x < 4; x ++)
        {
            for(int y = 0; y < 4; y++)
            {
                if(nums[x][y] < 10)System.out.print(" ");
                System.out.print(" " + nums[x][y]);
            }
            System.out.println();
        }
    }

    /** <pre>4행 4열짜리 정수형 배열을 선언 및 할당하고
     * 1) 16 ~ 1과 같이 값을 거꾸로 저장하세요.
     * 2) 저장된 값들을 차례대로 출력하세요. </pre> */
    public void practice3()
    {
        /*   
         * 메소드 명 : public void practice3(){}
         * 4행 4열짜리 정수형 배열을 선언 및 할당하고
         * 1) 16 ~ 1과 같이 값을 거꾸로 저장하세요.
         * 2) 저장된 값들을 차례대로 출력하세요.
         * ex.
         * 16 15 14 13 
         * 12 11 10 9 
         * 8  7  6  5 
         * 4  3  2  1     
         */
        int[][] intArrD2 = new int[4][4];
        
//        int cnt = 16;
        
        for(int x = 0; x < 4; x ++)
        {
            for(int y = 0; y < 4; y++)
            {
//                intArrD2[x][y] = cnt--;
                intArrD2[x][y] = (4-y) + ((3-x)*4);
            }
        }

        for(int x = 0; x < 4; x ++)
        {
            for(int y = 0; y < 4; y++)
            {
                System.out.print(intArrD2[x][y] + "\t");
            }
            System.out.println();
        }
    }

    /** 4행 4열 2차원 배열을 생성하여 0행 0열부터 2행 2열까지는 1~10까지의 임의의 정수 값 저장 후 */
    public void practice4()
    {
        /*
         * 메소드 명 : public void practice4(){}
         * 4행 4열 2차원 배열을 생성하여 0행 0열부터 2행 2열까지는 1~10까지의 임의의 정수 값 저장 후
         * 아래의 내용처럼 처리하세요.
         *         0열           1열           2열           3열
         * 0행     값            값            값            0행 값들의 합
         * 1행     값            값            값            1행 값들의 합
         * 2행     값            값            값            2행 값들의 합
         * 3행     0열 값들의 합 1열 값들의 합 2열 값들의 합 가로 세로 합
         * ex.
         * 6   6  1  13 
         * 4  10  8  22 
         * 8   6  5  19 
         * 18 22 14 108
         */
        int[][] intArrD2 = new int[4][4];
        
        int total = 0;//가로세로합할때 토토탈
        
        //가로줄 처리 - 3열 2행까지만 for문
        for(int x = 0; x < 3; x ++)
        {
            for(int y = 0; y < 4; y++)
            {
                if(y != 3)
                {
                    intArrD2[x][y] = (int)(Math.random() * 10 +1);
                }
                else
                {
                    int tot = 0;
                    //가로 더해주기
                    for(int i = 0;i < 3; i ++)
                    {
                        tot += intArrD2[x][i];
                    }
                    intArrD2[x][y] = tot;
                    total += tot;
                }
            }
        }
        
        //세로줄 처리 x <-> y 바꿔준다. 3열 3행 for문
        
        for(int y = 0; y < 4; y++)
        {
            int tot = 0;
            for(int x = 0; x < 4; x ++)
            {
                //0~2 index까지는 더해준다.
                if(x != 3)
                {
                    tot += intArrD2[x][y];
                }
                //토토탈 대입
                else if(x == 3 && y == 3)
                {
                    intArrD2[x][y] = total + tot;
                }
                //3 index는 더해준 값 대입
                else
                {
                    intArrD2[x][y] = tot;
                }
            }
        }
        
        //결과 출력
        for(int x = 0; x < 4; x ++)
        {
            for(int y = 0; y < 4; y++)
            {
                System.out.print(intArrD2[x][y] + "\t");
            }
            System.out.println();
        }
    }
    
    /** <pre>2차원 배열의 행과 열의 크기를 사용자에게 직접 입력받되,
     * 1~10사이 숫자가 아니면 “반드시 1~10 사이의 정수를 입력해야 합니다.” 출력 후 다시 정수를 받게 하세요.
     * 크기가 정해진 이차원 배열 안에는 영어 대문자가 랜덤으로 들어가게 한 뒤 출력하세요.
     * (char형은 숫자를 더해서 문자를 표현할 수 있고 65 ~ 88는 A ~ Z를 나타냄)</pre>
     */
    public void practice5()
    {
        /*
         * 메소드 명 : public void practice5(){}
         * 2차원 배열의 행과 열의 크기를 사용자에게 직접 입력받되, 1~10사이 숫자가 아니면
         * “반드시 1~10 사이의 정수를 입력해야 합니다.” 출력 후 다시 정수를 받게 하세요.
         * 크기가 정해진 이차원 배열 안에는 영어 대문자가 랜덤으로 들어가게 한 뒤 출력하세요.
         * (char형은 숫자를 더해서 문자를 표현할 수 있고 65 ~ 88는 A ~ Z를 나타냄)
         * ex.
         * 행 크기 : 5
         * 열 크기 : 4
         * T P M B 
         * U I H S 
         * Q M B H 
         * H B I X 
         * G F X I 
         */
        //사용자에게 값 입력 받기
        Scanner sc = new Scanner(System.in);
        System.out.print("행 크기 : ");
        int row = sc.nextInt();
        
        System.out.print("열 크기 : ");
        int col = sc.nextInt();
        sc.close();
        
        //알파벳 대입
        char[][] chArrD2 = new char[row][col];
        
        for(int x = 0; x < row; x ++)
        {
            for(int y = 0; y < col; y++)
            {
                //알파벳 랜덤 추출
                int alphaNum = 0;
                
                while(true)
                {
                    int tmpNum = (int)(Math.random() * 88 +1);
                    if(tmpNum > 64 && tmpNum < 89)
                    {
                        alphaNum = tmpNum;
                        break;
                    }
                }
                System.out.println((char)alphaNum );
                chArrD2[x][y] = (char)alphaNum;
            }
        }

        for(int x = 0; x < row; x ++)
        {
            for(int y = 0; y < col; y++)
            {
                System.out.print(chArrD2[x][y] + "\t");
            }
            System.out.println();
        }
    }
    
    /** 위의 초기화되어 있는 배열을 가지고 아래의 ‘[그림] 실습문제4 흐름’과 같은 방식으로 출력하세요. */
    public void practice6()
    {
        /*
         * 메소드 명 : public void practice6(){}
         * String[][] strArr = new String[][] {{"이", "까", "왔", "앞", "힘"}, {"차", "지", "습", "으", "냅"}, {"원", "열", "니", "로", "시"}, {"배", "심", "다", "좀", "다"}, {"열", "히", "! ", "더", "!! "}};
         * 위의 초기화되어 있는 배열을 가지고 아래의 ‘[그림] 실습문제4 흐름’과 같은 방식으로 출력하세요.
         * 단, print()를 사용하고 값 사이에 띄어쓰기(“ “)가 존재하도록 출력하세요.
         */
        String[][] strArr = new String[][] {{"이", "까", "왔", "앞", "힘"}, {"차", "지", "습", "으", "냅"}, {"원", "열", "니", "로", "시"}, {"배", "심", "다", "좀", "다"}, {"열", "히", "! ", "더", "!! "}};


        for(int i = 0; i < 5; i ++)
        {
            for(int j = 0; j < 5; j ++)
            {
                System.out.print("  " + strArr[i][j]);
            }
            System.out.println();
        }
    }
    
    /**
    * 사용자에게 행의 크기를 입력 받고 그 수만큼의 반복을 통해 열의 크기도 받아
    * 문자형 가변 배열을 선언 및 할당하세요.
    * 그리고 각 인덱스에 ‘a’부터 총 인덱스의 개수만큼 하나씩 늘려 저장하고 출력하세요.
    */
    public void practice7()
    {
        /*
         * 메소드 명 : public void practice7(){}
         * 사용자에게 행의 크기를 입력 받고 그 수만큼의 반복을 통해 열의 크기도 받아
         * 문자형 가변 배열을 선언 및 할당하세요.
         * 그리고 각 인덱스에 ‘a’부터 총 인덱스의 개수만큼 하나씩 늘려 저장하고 출력하세요.
         * ex.
         * 행의 크기 : 4
         * 0행의 열 크기 : 2
         * 1행의 열 크기 : 6
         * 2행의 열 크기 : 3
         * 3행의 열 크기 : 5
         * a b 
         * c d e f g h 
         * i j k 
         * l m n o p
         */
        Scanner sc = new Scanner(System.in);
        
        System.out.print("행의 크기 : ");
        int row = sc.nextInt();
        
        char[][] variableArr = new char[row][];
        
        char alpha = 'a';//97
        
        for(int i = 0; i < row; i++)
        {
            System.out.print(i + "행의 열 크기 : ");
            int icol = sc.nextInt();
            
            variableArr[i] = new char[icol];
            for(int j =0; j < icol; j++)
            {
                variableArr[i][j] = alpha;
                alpha                = (char)((int)alpha+1);
                if(alpha == 123) alpha = 'a';
            }
        }
        
        //출력
        for(int x = 0; x < variableArr.length; x ++)
        {
            for(int y = 0; y < variableArr[x].length ; y ++)
            {
                System.out.print("  " + variableArr[x][y]);
            }
            System.out.println();
        }
        
        sc.close();
    }

    /** <pre>1차원 배열에 12명의 학생들을 출석부 순으로 초기화 하고
    * 2열 3행으로 2차원 배열 2개를 이용하여 분단을 나눠
    * 1분단 왼쪽부터 오른쪽, 1행에서 아래 행 순으로 자리를 배치하세요.</pre>>
    */
    public void practice8()
    {
        /*
         * 메소드 명 : public void practice8(){}
         * 1차원 배열에 12명의 학생들을 출석부 순으로 초기화 하고
         * 2열 3행으로 2차원 배열 2개를 이용하여 분단을 나눠
         * 1분단 왼쪽부터 오른쪽, 1행에서 아래 행 순으로 자리를 배치하세요.
         * <출석부>
         * 1. 강건강 2. 남나나 3. 도대담 4. 류라라 5. 문미미 6. 박보배
         * 7. 송성실 8. 윤예의 9. 진재주 10. 차천축 11. 피풍표 12. 홍하하         
         * ex.
         * == 1분단 ==
         * 강건강 남나나 
         * 도대담 류라라 
         * 문미미 박보배 
         * == 2분단 ==
         * 송성실 윤예의 
         * 진재주 차천축 
         * 피풍표 홍하하
         */
        String[] students = new String[] {"강건강" ,"남나나" ,"도대담" ,"류라라" ,"문미미" ,"박보배" ,"송성실" ,"윤예의" ,"진재주" ,"차천축" ,"피풍표" ,"홍하하"};
        
        String[][] group1 = new String[3][2];
        String[][] group2 = new String[3][2];
        
        //내방법
        int index = 0;
        for(int x = 0; x < 6; x++)
        {
            for(int y = 0; y < 2; y++)
            {
                if(x < 3)
                {
                    group1[x][y] = students[index];
                }
                else
                {
                    group2[x-3][y] = students[index];
                }
                index++;
            }
        }
        index = 0;
        for(int x = 0; x < 6; x++)
        {
            if(x == 0) System.out.println("== 1분단 ==");
            if(x == 3) System.out.println("== 2분단 ==");
            
            for(int y = 0; y < 2; y++)
            {
                if(x < 3)
                {
                    System.out.print(group1[x][y] + " ");
                }
                else
                {
                    System.out.print(group2[x-3][y] + " ");
                }
                index++;
            }
            System.out.println();
        }
        //대안 배열에 한꺼번에 입력하는 방식
//        int index = 0;
//        for(int r = 0; r < 3; r ++)
//        {
//            for(int c = 0; c < 2; c++)
//            {
//                group1[r][c] = students[index];
//                group2[r][c] = students[index+6];
//                index++;
//                
//            }
//        }
//
//      for(int x = 0; x < 6; x++)
//      {
//          if(x == 0) System.out.println("== 1분단 ==");
//          if(x == 3) System.out.println("== 2분단 ==");
//          
//          for(int y = 0; y < 2; y++)
//          {
//              if(x < 3)
//              {
//                  System.out.print(group1[x][y] + " ");
//              }
//              else
//              {
//                  System.out.print(group2[x-3][y] + " ");
//              }
//          }
//          System.out.println();
//      }
        
    }
    
    /** practice9() + 학생 이름을 검색하여 해당 학생이 어느 자리에 앉았는지 출력하세요. */
    public void practice9()
    {
        /*
         * 메소드 명 : public void practice9(){}
         * 위 문제에서 자리 배리 배치한 것을 가지고 학생 이름을 검색하여
         * 해당 학생이 어느 자리에 앉았는지 출력하세요.
         * ex.
         * == 1분단 ==
         * 강건강 남나나 
         * 도대담 류라라 
         * 문미미 박보배 
         * == 2분단 ==
         * 송성실 윤예의 
         * 진재주 차천축 
         * 피풍표 홍하하 
         * ============================
         * 검색할 학생 이름을 입력하세요 : 차천축
         * 검색하신 차천축 학생은 2분단 두 번째 줄 오른쪽에 있습니다
         */
        String[] students = new String[] {"강건강" ,"남나나" ,"도대담" ,"류라라" ,"문미미" ,"박보배" ,"송성실" ,"윤예의" ,"진재주" ,"차천축" ,"피풍표" ,"홍하하"};
        
        String[][] group1 = new String[3][2];
        String[][] group2 = new String[3][2];
        //내방법
        int index = 0;
        for(int x = 0; x < 6; x++)
        {
            for(int y = 0; y < 2; y++)
            {
                if(x < 3)
                {
                    group1[x][y] = students[index];
                }
                else
                {
                    group2[x-3][y] = students[index];
                }
                index++;
            }
        }
        index = 0;
        for(int x = 0; x < 6; x++)
        {
            if(x == 0) System.out.println("== 1분단 ==");
            if(x == 3) System.out.println("== 2분단 ==");
            
            for(int y = 0; y < 2; y++)
            {
                if(x < 3)
                {
                    System.out.print(group1[x][y] + " ");
                }
                else
                {
                    System.out.print(group2[x-3][y] + " ");
                }
                index++;
            }
            System.out.println();
        }
        Scanner sc = new Scanner(System.in);
        System.out.println("============================");
        System.out.print("검색할 학생 이름을 입력하세요 : ");
        String stdtName = sc.nextLine();
        String[] lineKor = new String[] {"첫 번째", "두 번째", "세 번째"};
        String[] direct  = new String[] {"왼쪽", "오른쪽"};
        int groupNum     = 1;
        int lineNum      = 0;
        int directNum    = 0;
        index = 0;
        for(int x = 0; x < 6; x++)
        {
            for(int y = 0; y < 2; y++)
            {
                if(x < 3)
                {
                    if(group1[x][y].equals(stdtName))
                    {
                        directNum = y;
                        lineNum   = x;
                    }
                }
                else
                {
                    if(group2[x-3][y].equals(stdtName))
                    {
                        directNum = y;
                        lineNum   = x-3;
                    }
                }
                index++;
            }
            if(x == 3) groupNum++;
        }
        System.out.println("검색하신 " + stdtName + " 학생은 "+ groupNum +"분단 "+ lineKor[lineNum] +" 줄 "+ direct[directNum] +"에 있습니다");
        sc.close(); 
        
        
        //대안 배열에 한꺼번에 입력하는 방식
//        int index = 0;
//        for(int r = 0; r < 3; r ++)
//        {
//            for(int c = 0; c < 2; c++)
//            {
//                group1[r][c] = students[index];
//                group2[r][c] = students[index+6];
//                index++;
//                
//            }
//        }
//
//        for(int x = 0; x < 6; x++)
//        {
//            if(x == 0) System.out.println("== 1분단 ==");
//            if(x == 3) System.out.println("== 2분단 ==");
//            
//            for(int y = 0; y < 2; y++)
//            {
//                if(x < 3)
//                {
//                    System.out.print(group1[x][y] + " ");
//                }
//                else
//                {
//                    System.out.print(group2[x-3][y] + " ");
//                }
//                index++;
//            }
//            System.out.println();
//        }
//        Scanner sc = new Scanner(System.in);
//        System.out.println("============================");
//        System.out.print("검색할 학생 이름을 입력하세요 : ");
//        String stdtName = sc.nextLine();
//
//        for(int r = 0; r < 3; r ++)
//        {
//            for(int c = 0; c < 2; c++)
//            {
//                if(group1[r][c].equals(stdtName))
//                {
//                    System.out.printf("검색하신 %s 학생은 1분단 %d번째줄 %s에 있습니다",stdtName, r, (c==0?"왼쪽":"오른쪽"));
//                    break;
//                }
//                else if(group2[r][c].equals(stdtName))
//                {
//                    System.out.printf("검색하신 %s 학생은 2분단 %d번째줄 %s에 있습니다",stdtName, r, (c==0?"왼쪽":"오른쪽"));
//                    break;
//                }
//            }
//        }
//        sc.close(); 
    }

    /** </pre>String 2차원 배열 6행 6열을 만들고 행의 맨 위와 열의 맨 앞은 각 인덱스를 저장하세요.
    * 그리고 사용자에게 행과 열을 입력 받아 해당 좌표의 값을 'X'로 변환해 2차원 배열을 출력하세요.</pre> */
    public void practice10()
    {
        /*
         * 메소드 명 : public void practice10(){}
         * String 2차원 배열 6행 6열을 만들고 행의 맨 위와 열의 맨 앞은 각 인덱스를 저장하세요.
         * 그리고 사용자에게 행과 열을 입력 받아 해당 좌표의 값을 'X'로 변환해 2차원 배열을 출력하세요.
         * ex.
         * 행 인덱스 입력 : 4
         * 열 인덱스 입력 : 2
         *  0 1 2 3 4
         * 0 
         * 1
         * 2
         * 3
         * 4 X
         */
        
        String[][] strArrD2 = new String[6][6];
        
        //가로줄 index넣기
        for(int x = 0; x < 1; x++)
        {
            for(int y = 0; y < 6; y++)
            {
                if(y!=0) strArrD2[x][y] = y-1 + "";
            }
        }
        //세로줄 index넣기
        for(int x = 0; x < 6; x++)
        {
            for(int y = 0; y < 1; y++)
            {
                if(x!=0) strArrD2[x][y] = x-1 + "";
            }
        }
        
        Scanner sc = new Scanner(System.in);
        
        System.out.print("행 인덱스 입력 : ");
        int rowIdx = sc.nextInt();
        System.out.print("열 인덱스 입력 : ");
        int colIdx = sc.nextInt();
        
        sc.close();

        strArrD2[rowIdx+1][colIdx+1] = "X";

        //결과값출력
        for(int x = 0; x < 6; x++)
        {
            for(int y = 0; y < 6; y++)
            {
                System.out.print((strArrD2[x][y]== null?"":strArrD2[x][y]) + " \t");
            }
            System.out.println();
        }
    }

    /** practice10() 행 입력 시 99가 입력되지 않으면 무한 반복이 되도록 구현하세요. */
    public void practice11()
    {
        /*
         * 메소드 명 : public void practice11(){}
         * 실습문제10과 내용은 같으나 행 입력 시 99가 입력되지 않으면 무한 반복이 되도록 구현하세요.
         * ex.
         * 행 인덱스 입력 : 2
         * 열 인덱스 입력 : 2
         *  0 1 2 3 4
         * 0
         * 1
         * 2 X
         * 3
         * 4
         * 행 인덱스 입력 : 3
         * 열 인덱스 입력 : 1
         *  0 1 2 3 4
         * 0
         * 1
         * 2    X
         * 3  X
         * 4
         * 행 인덱스 입력 >> 99
         * 프로그램 종료
         */
        
        String[][] strArrD2 = new String[6][6];
        
        //가로줄 index넣기
        for(int x = 0; x < 1; x++)
        {
            for(int y = 0; y < 6; y++)
            {
                if(y!=0) strArrD2[x][y] = y-1 + "";
            }
        }
        //세로줄 index넣기
        for(int x = 0; x < 6; x++)
        {
            for(int y = 0; y < 1; y++)
            {
                if(x!=0) strArrD2[x][y] = x-1 + "";
            }
        }
        
        Scanner sc = new Scanner(System.in);
        
        //무한반복엔 여윽시 while easy
        while(true)
        {
            System.out.print("행 인덱스 입력 : ");
            int rowIdx = sc.nextInt();
            if(rowIdx == 99)
            {
                System.out.print("프로그램 종료");
                sc.close();
                break;
            }
            System.out.print("열 인덱스 입력 : ");
            int colIdx = sc.nextInt();
            
            strArrD2[rowIdx+1][colIdx+1] = "X";
            
            //결과값출력
            for(int x = 0; x < 6; x++)
            {
                for(int y = 0; y < 6; y++)
                {
                    System.out.print((strArrD2[x][y]== null?"":strArrD2[x][y]) + " \t");
                }
                System.out.println();
            }
            
        }
        
        
    }
}
