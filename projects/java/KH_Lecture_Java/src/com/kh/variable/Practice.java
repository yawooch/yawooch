package com.kh.variable;

import java.util.Scanner;

/*
 * [1] 변수(Variable) 관련 실습 예제
 */
public class Practice {
	public static void main(String[] args) {
		/*
		 * 각 예제 별 실행이 필요한 경우 주석을 해제하여 실행해주세요.
		 */
		
		// 실습 예제 1 실행
		System.out.println("============= 실습 예제 1 실행 =============");
		example01();
		System.out.println("");
		
		// 실습 예제 2 실행
		System.out.println("============= 실습 예제 2 실행 =============");
		example02();
		System.out.println("");
		
		// 실습 예제 3 실행
		System.out.println("============= 실습 예제 3 실행 =============");
		example03();
		System.out.println("");
		
		// 실습 예제 4 실행
		System.out.println("============= 실습 예제 4 실행 =============");
		example04();
		System.out.println("");
		
		// 실습 예제 5 실행
		System.out.println("============= 실습 예제 5 실행 =============");
		example05();
		System.out.println("");
		
		// 실습 예제 6 실행
		System.out.println("============= 실습 예제 6 실행 =============");
		example06();
		System.out.println("");
		
//		System.out.println("1 ~ 10 까지 중 하나만 입력하세요");
//		Scanner sc = new Scanner(System.in);
//		int num;            // 정수형 num 변수 선언
//		num = sc.nextInt(); // 사용자로부터 입력받은 값을 num 변수에 대입
//		
//		System.out.println("입력받은 값은 " + num + "입니다.");
//		System.out.printf("입력받은 값은 %d입니다.", num);
//		sc.close();
	}
	/*
	 * 실습 예제 1.
	 *  변수를 사용하여 아래 코드를 이해하기 쉽도록 변경하세요.
	 *  - 1년 후 같은 프로그램을 실행했을 때 일부 값을 변경해야 하는데, 변경되는 부분을 변수로 분리.
	 *  - 연도에 해당하는 값을 : int형 year 이름의 변수로 변경
	 *  - 나이에 해당하는 값을 : int형 age 이름의 변수로 변경
	 */
	public static void example01() {
		// 변수를 사용하지 않은 경우
		System.out.println("변수를 사용하지 않은 경우 \t: 현재 2023년이고, 나는 올해 36살 입니다.");
		
		
		// 변수를 사용한 경우 (아래에 작성)
		int allHae = 2023;
		int age    = 36;
		System.out.println("변수를 사용한 경우 \t\t: 현재 "+ allHae +"년이고, 나는 올해 "+ age +"살 입니다.");
		
		
		// (+) 위에 선언한 변수의 값을 현재 연도와 본인의 나이로 변경하여 대입한 후 화면에 출력
		allHae = 2023;
		age    = 31;
		System.out.println("본인의 나이로 변경 \t\t: 현재 "+ allHae +"년이고, 나는 올해 "+ age +"살 입니다.");		
	}
	
	/*
	 * 실습 예제 2.
	 *  잘못 정의된 변수 이름을 확인하여 상단 주석의 괄호 안에 제약사항 항목 중 어떤 부분에 해당되는 지 기입한 후 
	 *  오류가 발생하지 않도록 변경하세요.
	 *  [변수 제약 사항]
	 *   1) 변수 이름은 대/소문자를 구분하여 사용한다.
	 *   2) 변수 이름은 숫자로 시작할 수 없다.
	 *   3) 특수 문자는 $와 _ 이외에 사용할 수 없다.
	 *   4) 미리 정의된 예약어(키워드)는 사용할 수 없다.
	 */
	public static void example02() {
		// 아래는 변수 제약 사항 중 ( 2 )에 해당되어 오류가 발생.
//		int 1num = 10;
//		System.out.println("1num의 값은 " + 1num + "입니다.");
		int num1 = 10;
		System.out.println("num1의 값은 " + num1 + "입니다.");
		
		
		// 아래는 변수 제약 사항 중 ( 4 )에 해당되어 오류가 발생.		
//		boolean break = true;
//		System.out.println("논리형 자료형 변수인 break 의 값은 " + break + "입니다.");
		boolean braek = true;
		System.out.println("논리형 자료형 변수인 braek 의 값은 " + braek + "입니다.");
		
		
		// 아래는 변수 제약 사항 중 ( 1 )에 해당되어 오류는 없으나 출력 값이 다름.
		int age;
		int Age = 15;
		age = 20;
		System.out.println("나이에 해당 되는 변수 값 확인 > " + age + ", " + Age);
		// 위의 System.out.println 의 출력 결과는?
		// 나이에 해당 되는 변수 값 확인 > 20, 15
		
		// 아래는 변수 제약 사항 중 ( 3 )에 해당되어 오류가 발생.
//		int d-day = 100;
//		System.out.println("크리스마스까지 " + d-day + "일 남았습니다.");
		int dDay = 100;
		System.out.println("크리스마스까지 " + dDay + "일 남았습니다.");
	}
	
	/* 실습 예제 3. 
	 *  키와 몸무게 값을 저장하기 위한 변수를 각각 double형의 height 이름으로, int형의 weight 이름으로 생성하여
	 * 	본인의 희망 키, 희망 몸무게 값으로 초기화하여
	 *  키와 몸무게를 아래 예시와 같이 출력하세요.
	 *  예시) "내가 원하는 키는 165.2cm이고, 몸무게는 45kg입니다."
	 */
	public static void example03() {
		// 변수 선언 및 초기화
		double height = 174.9;
		int weight    = 74;
		
		// 예시와 같이 화면에 출력
		System.out.println("내가 원하는 키는 "+ height +"cm이고, 몸무게는 "+ weight +"kg입니다.");
		
		
	}
		
	/*
	 * 실습 예제 4.
	 *  유원지에 있는 놀이기구에 탑승 제한이 있습니다. 몸무게가 80키로 이상인 경우 탑승을 하지 못하는데,
	 *  이 내용에 대하여 화면에 출력하기 위해 '상수' 변수로 80 이라는 숫자 값을 저장하여 출력하도록
	 *  프로그램을 작성해주세요.
	 */
	public static void example04() {
		// 상수 선언
		//  hint) final 키워드 사용
		final int MAX_WEIGHT = 80;
		
		// 화면에 탑승 제한 안내 출력
		//  예시) "해당 놀이기구는 80키로 이상 탑승 금지!"
		System.out.println("해당 놀이기구는 "+ MAX_WEIGHT +"kg 이상 탑승 금지!");
	}
		
	/*
	 * 실습 예제 5.
	 * 	자료형의 종류가 다른 경우 형 변환이 발생하는데, 아래에 규칙에 따라 발생합니다. (해당하는 단어만 남겨주세요.)
	 *  1) 자료형의 크기가 (큰[O]/작은[X]) 방향으로 형 변환이 일어난다.
	 *  2) 자료형의 크기에 상관 없이 (정수[O]/실수[X]) 자료형보다 (정수[X]/실수[O]) 자료형이 우선된다.
	 */
	public static void example05() {
		// 아래 결과 값을 입력해 주세요.
		int num1 = 10;
		double dnum1 = 5.5;
		
		// 자동 형 변환 (Implicit Conversion)
		System.out.println(num1 + dnum1);		// 결과: 15.5

		// 명시적 형 변환 (Explicit Conversion)
		System.out.println(num1 + (int)dnum1); 	// 결과: 15
	}
		
	/*
	 * 실습 예제 6.
	 * 	사용자로부터 입력을 받을 수 있도록 하는 클래스로 Scanner가 있습니다.
	 * 	위의 [실습 예제 3] 항목을 사용자로부터 입력받도록 하여 아래 예시와 같이 출력해주세요.
	 *  예시) "내가 원하는 키는 165.2cm이고, 몸무게는 45kg입니다."
	 */
	public static void example06() {
		// 사용자에게 키를 입력받기 위해 "원하는 키를 입력해주세요: "를 화면에 출력
		System.out.print("원하는 키를 입력해주세요: ");
		double height; // 키를 보관하기 위한 변수
		int weight;    // 몸무게를 보관하기 위한 변수
		
		Scanner sc = new Scanner(System.in); // 사용자 입력을 받기 위해 선언
		
		// 사용자로부터 키 입력 받기
		height = sc.nextDouble();
		
		
		// 사용자에게 몸무게를 입력받기 위해 "원하는 몸무게를 입력해주세요: "를 화면에 출력
		System.out.print("원하는 몸무게를 입력해주세요: ");
		
		
		// 사용자로부터 몸무게 입력 받기
		weight = sc.nextInt();
		
		// 화면에 결과 출력 (예시 참고)
		System.out.println("내가 원하는 키는 "+ height +"cm이고, 몸무게는 "+ weight +"kg입니다.");
		System.out.printf("내가 원하는 키는 %1.1fcm이고, 몸무게는 %dkg입니다.", height , weight);
		sc.close();
	}
}
