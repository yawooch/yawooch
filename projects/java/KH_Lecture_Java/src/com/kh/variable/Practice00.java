package com.kh.variable;

public class Practice00
{
	public static void main(String[] args)
	{
		// 상수
		final int MAX;
		MAX = 100; 
	
		System.out.println("상수 MAX : " + MAX);
	}
	public static void variableConstraint() {
		// 변수명 제약 사항
		// 1) 자바는 대소문자를 구분한다
		int level;
		int Level = 0;
		level = 10;
		System.out.println("level : " + level + ", Level : " + Level);
		
		// 2) 변수의 이름은 숫자로 시작할 수 없다
		//int 365h;//(X)
		int h365;//(O)

		// 3) '$' , '_' 외에는 특수문자 사용할수 없다.
		int $100 = 100;
		System.out.println("$100 : " + $100);
		int _100 = 1000;
		System.out.println("_100 : " + _100);
		
		// 4) 키워드는 사용할수 없다.
		//int int;       // (X)
		//double double; // (X)
		//int public;    // (X)
	}
	public static void method1()
	{
		//기념일 계산
		System.out.println("********************* 기념일 계산 ********************");
		System.out.println("===================== Before ======================");
		/* 변수를 사용하지 않은경우 */
		System.out.println(1000 + 10);            // 10일 후
		System.out.println(1000 / 365);           // 기념일 기준 몇 년째?
		System.out.println(1000 * 24);            // 기념일 기준 시간 단위로.
		System.out.println(1000 * 24 * 60);       // 분 단위로.
		System.out.println(1000 * 24 * 60 * 60);  // 초 단위로.
		
		System.out.println("===================== After =======================");
		
		/* 변수를 사용한 경우 */
		int anniversary = 1000;
		int year        = 365;
		int tenDay      = 10;
		int day         = 24;
		int time        = 60;
		System.out.println(anniversary + tenDay);             // 10일 후
		System.out.println(anniversary / year);               // 기념일 기준 몇 년째?
		System.out.println(anniversary * day);                // 기념일 기준 시간 단위로.
		System.out.println(anniversary * day * time);         // 분 단위로.
		System.out.println(anniversary * day * time * time);  // 초 단위로.

		System.out.println("===================== Teacher's Answer ============");
		
		int days = 1000;                              // 1000   값을 저장하는 정수형(int)
		int d365 = 365;                               // 365    값을 저장하는 정수형(int)
		int h24  = 24;                                // 24     값을 저장하는 정수형(int)
		int m60  = 60;                                // 60(분) 값을 저장하는 정수형(int)
		int s60  = 60;                                // 10(초) 값을 저장하는 정수형(int)
		System.out.println(days + tenDay);            // 10일 후
		System.out.println(days / d365);              // 기념일 기준 몇 년째?
		System.out.println(days * h24);               // 기념일 기준 시간 단위로.
		System.out.println(days * h24 * m60);         // 분 단위로.
		System.out.println(days * h24 * m60 * s60);   // 초 단위로.
	}
}
