package com.kh.operator;

    /** 
     * 산술 연산자(이항연산자, 두개의 값으로 연산 수행)
     * => + - * / %
     * 
     * 우선 순위 : * / % > + - 
     *
     */
public class Arithmetic
{
    /* 
     * 산술 연산자(이항연산자, 두개의 값으로 연산 수행)
     * => + - * / %
     * 
     * 우선 순위 : * / % > + - 
     * */
    /** 짝수/홀수 판별 - 나머지 연산자 (%) */
    public void method1()
    {
        int num1 = 10;
        int num2 = 3;
        
        System.out.println("num1 + num2 = "+ (num1 + num2));
        System.out.println("num1 - num2 = "+ (num1 - num2));
        
        System.out.println("num1 * num2 = "+ (num1 * num2));
        System.out.println("num1 / num2 = "+ (num1 / num2));
        System.out.println("num1 % num2 = "+ (num1 % num2));
        
        // 나머지 연산자 (%)
        // - 짝수/홀수 판별
        // ((num1 %2) == 0) => 짝수
        // ((num1 %2) != 0) or !((num1 %2) == 0)) => 홀수
        
        System.out.printf("num1의 값은 짝수 인가? %b\n", ((num1 %2) == 0));
//        System.out.printf("num2의 값은 홀수 인가? %b"  , ((num2 %2) != 0));
        System.out.printf("num2의 값은 홀수 인가? %b"  , (!((num2 %2) == 0)));
    }
    
    /** 증감연산자를 이용한 연산순서 확인/계산 */
    public void method2()
    {
        //결과 예측해보기
        int a = 5;
        int b = 10;
        
        int c = (++a) + b;                                     // c = ? 16
//      6 + 10 = 16
        //a = 6, b = 10, c = 16, d =, e =, f =, g =, h =, i =
        System.out.print("a = " + a);
        System.out.print("\t ,b =" + b);
        System.out.println("\t ,c =" + c);
        System.out.println("a = 6\t, b =10\t, c =16\t, d = \t, e = \t, f = \t, g =  \t, h = \t, i =");//c
        int d = c / a;                                         // d = ? 2
//      16 / 6 = 2
        //a = 6, b = 10, c = 16, d =2, e =, f =, g =, h =, i =
        System.out.println("-------------------------------------------------------------------------------------");
        System.out.print("a = " + a);
        System.out.print("\t ,b =" + b);
        System.out.print("\t ,c =" + c);
        System.out.println("\t ,d =" + d);
        System.out.println("a = 6\t, b =10\t, c =16\t, d =2\t, e = \t, f = \t, g =  \t, h = \t, i =");//d
        int e = c % a;                                         // e = ? 4
//      16 % 6 = 4
        //a = 6, b = 10, c = 16, d =2, e =4, f =, g =, h =, i =
        System.out.println("-------------------------------------------------------------------------------------");
        System.out.print("a = " + a);
        System.out.print("\t ,b =" + b);
        System.out.print("\t ,c =" + c);
        System.out.print("\t ,d =" + d);
        System.out.println("\t ,e =" + e);
        System.out.println("a = 6\t, b =10\t, c =16\t, d =2\t, e =4\t, f = \t, g =  \t, h = \t, i =");//e
        int f = e++ ;                                          // f = ? 4
        
//      4++ = 4
        //a = 6, b = 10, c = 16, d =2, e =4, f =5, g =, h =, i =
        System.out.println("-------------------------------------------------------------------------------------");
        System.out.print("a = " + a);
        System.out.print("\t ,b =" + b);
        System.out.print("\t ,c =" + c);
        System.out.print("\t ,d =" + d);
        System.out.print("\t ,e =" + e);
        System.out.println("\t ,f =" + f);
        System.out.println("a = 6\t, b =10\t, c =16\t, d =2\t, e =4\t, f =5\t, g =  \t, h = \t, i =");//f
        int g = (--b) + (d--);                                 // g = ? 11
//      9 + 2 = 11
        //a = 6, b = 9, c = 16, d =1, e =4, f =5, g =, h =, i =
        System.out.println("-------------------------------------------------------------------------------------");
        System.out.print("a = " + a);
        System.out.print("\t ,b =" + b);
        System.out.print("\t ,c =" + c);
        System.out.print("\t ,d =" + d);
        System.out.print("\t ,e =" + e);
        System.out.print("\t ,f =" + f);
        System.out.println("\t ,g =" + g);
        System.out.println("a = 6\t, b =9 \t, c =16\t, d =1\t, e =4\t, f =5\t, g =  \t, h = \t, i =");//g
        int h = 2;                                             // h = ? 2
        //a = 6, b = 9, c = 16, d =1, e =4, f =5, g =11, h =2, i =
        System.out.println("-------------------------------------------------------------------------------------");
        System.out.print("a = " + a);
        System.out.print("\t ,b =" + b);
        System.out.print("\t ,c =" + c);
        System.out.print("\t ,d =" + d);
        System.out.print("\t ,e =" + e);
        System.out.print("\t ,f =" + f);
        System.out.print("\t ,g =" + g);
        System.out.println("\t ,h =" + h);
        System.out.println("a = 6\t, b =9 \t, c =16\t, d =1\t, e =4\t, f =5\t, g =11\t, h =2\t, i =");//h
        int i = (a++) + b / (--c / f) * (g-- - d) % (++e + h); // i = ? 8
//      6 + 9 / (15 / 5) * (11 - 1) % (5 + 2) = 8
        //a = 7, b = 9, c = 15, d =1, e =5, f =5, g =10, h =2, i =8
        System.out.println("-------------------------------------------------------------------------------------");
        System.out.print("a = " + a);
        System.out.print("\t ,b =" + b);
        System.out.print("\t ,c =" + c);
        System.out.print("\t ,d =" + d);
        System.out.print("\t ,e =" + e);
        System.out.print("\t ,f =" + f);
        System.out.print("\t ,g =" + g);
        System.out.print("\t ,h =" + h);
        System.out.println("\t ,i =" + i);
        System.out.println("a = 7\t, b =9 \t, c =15\t, d =1\t, e =5\t, f =5\t, g =10\t, h =2\t, i =8");//i
        
        System.out.println("********************************************************* ");
        
        System.out.println("a : " + a);//출력 : 7  
        System.out.println("b : " + b);//출력 : 9  
        System.out.println("c : " + c);//출력 : 15 
        System.out.println("d : " + d);//출력 : 1  
        System.out.println("e : " + e);//출력 : 5  
        System.out.println("f : " + f);//출력 : 5  
        System.out.println("g : " + g);//출력 : 10 
        System.out.println("h : " + h);//출력 : 2  
        System.out.println("i : " + i);//출력 : 8
        
    }
}
