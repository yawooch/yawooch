package com.kh.variable;


public class Cast
{
	/*
	 * * 형변환 : 값의 자료형을 바꾸는 것 
	 * 
	 * * 컴퓨터에서 값처리 규칙 (형변환이 필요한 상황)
	 * 1) 대입 연산자 기준으로 왼쪽과 오른쪽이 같은 자료형이어야함.
	 *    => 같은 자료형에 ㄷ해당하는 값만 대입가능.
	 *    => 다른 자료형의 값을 대입하려면 형변환이 필수
	 *    	   자료형A 변수명 = (자료형A)값; //값은 자료형 B 일때
	 * 2) 같은 자료형 끼리만 연산이 가능 
	 * 
	 * 		값 + 값 => 계산 결과도 같은 자료형
	 * 
	 * * 형변환 종류
	 * 1) 자동형변환           => 자동형변환이 돼서 우리가 따로 형변환 X
	 * 2) 명시적 형변환 (강제) => 자동형변환이 안되는 경우 직접 형변환을 함
	 *
	 *  (바꿀자료형) 값
	 *  
	 * * 참고 : boolean 은 형변환 불가
	 *  
	 */	
	public static void main(String[] args)
	{
		autoCasting();
		forceCasting();
	}
	public static void autoCasting()
	{
		/*
		 * 자동형변환 테스트
		 * 1) 크기가 작은 자료형과 큰 자료형이 있을때 큰 자료형으로 변환
		 * 2) 정수형과 실수형이 있을때 실수형으로 변환 
		 * 
		 */
		//대입할때 자동형변환된다
		// 1) int(4byte) => double(8byte)
		int i1    = 12;
		double d = i1;
		System.out.println("autoExample1 : " + i1 +", "+ d );
		
		// 연산할때 자동형변환된다
		// 2) int(4byte) => double(8byte)
		int i2    = 12;
		double d2 = 5.8;
		
		double result2 = /* (double) */i2 + d2;
		System.out.println("autoExample2 : " + result2);
		

		// float도 리터럴만 맞춰주면 자동형변환된다
		// 3) float(4byte) => double(8byte)
		float  f3 = 1.5f; //float 자료형의 값은 값 뒤에 f를 붙여야 함
		double d3 =  /* (double) */f3; // 크기가 큰 방향으로 자동형변환이 됨
		System.out.println("autoExample3 : " + d3);
		
		//
		// 4) long(8byte) => float(4byte)
		// * float 이 실수형이기 때문에 long형보다 표현가능한 범위가 더 커서 자동형변환됨.
		long  l4 = 1000000000100000000l; //long 자료형의 값은 값 뒤에 l를 붙여야 함
		long  lx = 9223372036854775807l; //long 자료형의 값은 값 뒤에 l를 붙여야 함
		float f4 = /* (float) */l4; // 크기가 큰 방향으로 자동형변환이 됨
		float fx = /* (float) */339999999999999999999999999999999999999f; // 크기가 큰 방향으로 자동형변환이 됨
		System.out.println("autoExample4 : " + f4);
		
		// 1byte = 8bit (1 + 2 + 4 + 8 + 16 + 32 + 64 + 128 = 256 )
		// 4byte = 4 * 256  = 1024
		// 8byte = 2 * 1024 = 2048
		
		
		// 5) long(8byte) => float(4byte)
		int num = /* (int) */'A';
		System.out.println("autoExample5-1 : " + num);
		char ch = 65;
		System.out.println("autoExample5-2 : " + ch);
		
		// 각 문자들이 고유한 숫자가 지정되어 있어 형변환이 가능(아스키코드)
		// char(문자형) 은 음수값 저장불가 => 범위 : 0 ~ 65535
		
		// 6) byte 또는 short 간의 연산
		byte b1 = 1;
		byte b2 = 10;
		System.out.println("autoExample6-1 : " + b1 + ", " + b2);
		
//		byte b3 = b1 + b2;//(X) 오류 발생 - byte 또는 short 연산시 무조건 int형으로 변환됨
		// 연산결과가 범위가 더큰 int 형이기 때문에 byte형에 대입 불가
		//해결하려면
		int  r  = b1 + b2;         // 결과를 받는 자료형을 int로 하거나
		byte b3 = (byte)(b1 + b2); // 연산결과를 강제로 byte형으로 변환
		System.out.println("autoExample6-2 : " + b3 + ", " + r);
		
	}
	public static void forceCasting()
	{
		// 명시적 형변환(강제) : 큰 크기의 자료형을 작은 크기의 자료형으로 바꾸는 것
		
		// double (8byte) => float(4byte)
		double d1 = 8.0;
		float f1 = (float)d1;
		
		System.out.println("ForcExample1 : " + d1 + ", " + f1);
		
		//double(8byte) => int(4byte)
		
		int num = 10;
		double dNum = 3.14;
		//int rNum = num + (int)dNum; // 연산결과가 double 형이라서 int형에 대입불가

		//해결방법
		int rNum = num + (int)dNum; // 10 + 3

		System.out.println("ForcExample2-1 : " + rNum);
		// * 실수값을 정수형으로 강제형변환 시 소수점 아래 부분이 버려짐(=> 데이터 손실)
		
		//데이터 손실을 하지 않고 해결하는 방법
		// - 연산 결과를 실수형으로 받는다
		
		double dNum2 = num + dNum;
		System.out.println("ForcExample2-2 : " + dNum2);
		
		//데이터 손실 테스트
		int i = 256;
		byte b = (byte)i;
		// byte 범위 : -128 ~ 127
		System.out.println("ForcExample3 : " + b);
	}
}