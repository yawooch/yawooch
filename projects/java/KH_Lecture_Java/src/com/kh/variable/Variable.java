package com.kh.variable;

import java.util.Scanner;

public class Variable
{
	public static void main(String[] args)
	{
//		variablePractice1();
		variablePractice2();
//		variablePractice3();
//		variablePractice4();
	}

	//실습문제 1
	public static void variablePractice1()
	{
		//실습문제 1
		String name   = "";
		String gender = "";
		int    age    = 0;
		double height = 100.0;
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("이름을 입력하세요        : ");
		name   = sc.nextLine();
		System.out.print("성별을 입력하세요(남/여) : ");
		gender = sc.nextLine();
		System.out.print("나이를 입력하세요        : ");
		age    = sc.nextInt();
		System.out.print("키를 입력하세요(㎝)      : ");
		height = sc.nextDouble();
		
		//1 scanner 1개만 사용
		//2 printf 사용
		System.out.printf("키 %.1fcm인 %d살 %s %s님 반갑습니다", height, age, gender, name);
		
		sc.close();
	}
	//실습문제 2
	public static void variablePractice2()
	{
		//실습문제 2
		int    num1    = 0;
		int    num2    = 0;
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print(  "첫 번째 정수 : ");  num1 = sc.nextInt();
		System.out.print(  "두 번째 정수 : ");  num2 = sc.nextInt();
		System.out.println(" 더하기 결과 : " + (num1 + num2));
		System.out.println("   빼기 결과 : " + (num1 - num2));
		System.out.println(" 곱하기 결과 : " + (num1 * num2));
		System.out.println(" 나누기 결과 : " + (num1 / num2));
		
		sc.close();
	}
	//실습문제 3
	public static void variablePractice3()
	{
		//실습문제 3
		double    num1    = 0;
		double    num2    = 0;
		
		Scanner sc1 = new Scanner(System.in);
		
		System.out.print("가로 : ");
		num1   = sc1.nextDouble();
		System.out.print("세로 : ");
		num2   = sc1.nextDouble();
		
		System.out.println("면적 : " + (num1 * num2));
		System.out.println("둘레 : " + ((num1 + num2) * 2));
		
		sc1.close();
	}
	//실습문제 4
	public static void variablePractice4()
	{
		//실습문제 4
		String    str    = "apple";
		Scanner sc1 = new Scanner(System.in);
		
		System.out.print("문자열을 입력하세요 : ");
		str   = sc1.next();
		
		System.out.println("첫 번째 문자        : " + str.charAt(0));
		System.out.println("두 번째 문자        : " + str.charAt(1));
		System.out.println("세 번째 문자        : " + str.charAt(2));
		
		sc1.close();
	}
}
