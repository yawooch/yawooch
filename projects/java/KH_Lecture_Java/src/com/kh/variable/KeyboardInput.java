package com.kh.variable;

import java.util.Scanner;

public class KeyboardInput
{
	/**
	 * 키보드 입력 값을 받아주는 Scanner 실습
	 */
	public static void main(String[] args)
	{
//		inputTest1();
		inputTest2();
	}
	public static void inputTest1()
	{
		/*
		 * [참고]
		 * import를 하지 않은 경우 Scanner 클래스가 속한 패키지명을 모두 입력해야함
		 * 따라서, class 선언 상단에 import 문을 사용하여 클래스명만 사용할수 있도록 함.
		 * * 위에 import 부분을 주석처리 하면 아래처럼 사용해야함
		 *   예) java.util.Scanner sc = new java.util.Scanner(System.in);
		 */
		
		//클래스 객체 생성
		// Scanner 클래스 객체 생성
		// * System.in  : 입력받은 값을 바이트 단위로 받는다.
		// * System.out : 화면에 출력할때 사용한 구문
		Scanner sc = new Scanner(System.in);

		System.out.print("아무거나 입력하세요 : ");//사용자의 입력을 유도하기 위해 화면 출력
//		String temp = sc.next();//공백이 있으면 공백 전까지만 가져와요
		String temp = sc.nextLine();//sc.nextLine() : 엔터키(\n 전까지 입력된 값을 모두 가져옴
		System.out.print(temp);
			
		
		sc.close();
	}
	public static void inputTest2()
	{
		//Scanner 클래스 객체 생성
		Scanner sc = new Scanner(System.in);
		
		System.out.println("이름을 입력해주세요 : ");
		String name = sc.nextLine();
		
		System.out.println("나이를 입력해주세요 : ");
		int age = sc.nextInt();
		
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age);	
		
		// nextLine() : 사용자가 입력한 값을 모두 받고, 버퍼라는 공가에 엔터(\n)을 제거해준다.
		// 그 외에 next(), nextInt() 등은 값만 변수에 저장하고 엔터(\n)는 따로 제거하지 않는다
		// 연달아서 입력받는 경우 .nextLine()으로 버퍼를 비워주고 입력 받도록 처리함

				
		sc.close();
	}
	public static void inputTest3()
	{
		
	}
}
