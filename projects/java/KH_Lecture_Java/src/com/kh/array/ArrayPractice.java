package com.kh.array;

import java.util.Arrays;

public class ArrayPractice
{
    public static void main(String[] args)
    {
    }
    /*
     * 배열 : " 같은 자료형의 "여러 개의 데이터"를 저장하는 공간
     * 
     * (1차원)배열 [선언방법] 자료형[] 배열이름 = new 자료형[데이터길이];
     * 
     * - 인덱스(index) : 배열에서 위치를 가르키는 숫자(0부터 시작한다.)
     * 
     * - 배열에 값을 저장하는 방법 
     *    배열이름[인덱스] = 값; 
     *    //배열의 인덱스 위치에 값을 저장 
     * - 배열에서 값을 참조하는 방법
     *    배열이름[인덱스] 
     *    //배열의 인덱스 위치의 값을 참조
     * - 배열의 초기화하는 방법 
     *      1) 자료형[] 배열이름 = new 자료형[]{값1, 값2, 값3,...};
     *      2) 자료형[] 배열이름 = {값1, 값2, 값3,...}; => 이때 중괄호({})안에 값은 선언된 자료형과 동일해야함.
     * - 배열 복사 
     *  (1) 얕은복사 : 배열의 주소값만 복사하여 실제 데이터는 한 곳에서 관리
     *       배열A = 배열B;
     *  (2) 깊은복사 : 새로운 배열객체를 생성해서 기존 배열의 데이터를 복사
     *      1) 반복문 사용 
     *          for(int i = 0; i < 배열B.length; i++) 
     *          {
     *              배열A[i] = 배열B[i];
     *          } 
     *      2) System.arraycopy(배열B, 배열B시작할위치,배열A, 배열A시작할위치, 배열B종료할 위치); 
     *      3) 배열A = Arrays.copyOf(배열B, 복사할데이터길이); 
     *      4) 배열A = 배열B.clone();
     * - foreach문 : 배열에서 사용할수 있는 반복문의 새로운 문법 
     *  ※ foreach라는 키워드를 사용하는 것이 아니라 다른언어에서 사용하는 foreach와 구조가 유사해서 보통 foreach라 부름 
     *      [사용방법] 
     *          for(자료형 변수명 : 배열) 
     *          { 
     *              // 변수명을 사용하면 첫번째 위치부터 마지막 위치까지 반복문이 돌면서 
     *              // 배열에 저장된 데이터를 사용할수 있음
     *          }
     * 
     * 
     */

    public void practice1()
    {
        // 데이터를 3개 보관할 수 있는 정수형 배열 선언 및 생성
        int[] numbers = new int[3];

        // 첫번째 위치에 55 값을 저장
        numbers[0] = 55;
        // 두번째 위치에 66 값을 저장
        numbers[1] = 66;
        // 세번째 위치에 99 값을 저장
        numbers[2] = 99;

        // 배열에 저장된 데이터를 처음 위치부터 출력
        // 인덱스를 사용해서 출력
        // 배열길이 : 배열이름.length
        for (int i = 0; i < numbers.length; i++)
        {
            System.out.println(numbers[i]);
        }

        for (int number : numbers)
        {
            System.out.println(number);
        }

        // 배열의 마지막 위치부터 출력
        for (int i = numbers.length - 1; i >= 0; i--)
        {
            System.out.println(numbers[i]);
        }
    }

    public void practice2()
    {
        // "국어", "수학", "영어" 라는 데이터를 초기화
        String[] subjects = new String[]
        {
                "국어", "수학", "영어"
        };

        // 정수형 배열에 70, 90, 60 이라는 데이터를 초기화
        int[] scores =
        {
                70, 90, 60
        };

        int total = 0;
        // 각 과목별로 점수를 출력하고, 총합과 평균을 출력
        for (int i = 0; i < subjects.length; i++)
        {
            System.out.printf("%s : %d\n", subjects[i], scores[i]);
            total += scores[i];
        }
        System.out.println("총점 : " + total);
        System.out.println("평균 : " + ((double) total / (double) scores.length));
    }

    public void practice3()
    {
        // 정수형 배열 1,3,5,7 값을 초기화
        int[] nums =
        {
                1, 3, 5, 7
        };
        // 또다른 정수형 배열 선언 및 생성
        int[] copyNums = new int[4];

        System.out.println("복사 전 배열(copy)의 주소값 : " + copyNums);

        copyNums = nums;

        System.out.println("원본 배열(nums)의 주소값 : " + nums);
        System.out.println("복사 후 배열(copyNums)의 주소값 : " + copyNums);

        // 두 배열 데이터를 출력
        // Arrays.toString(배열이름);
        // => 배열의 데이터를 [값1, 값2,...] 형태로 변환
        System.out.println("원본 배열(nums)     데이터 : " + Arrays.toString(nums));
        System.out.println("복사 배열(copyNums) 데이터 : " + Arrays.toString(copyNums));

        // 원본 배열에서 두번째 자리에 값을 + 10
        nums[1] += 10;

        System.out.println("... 원본 배열(nums) 두번째 자리에 + 10 : " + nums[1]);
        System.out.println("원본 배열(nums)     데이터 : " + Arrays.toString(nums));
        System.out.println("복사 배열(copyNums) 데이터 : " + Arrays.toString(copyNums));

        // 복사본 배열(copy)에서 첫번째 자리에 값 -5
        nums[0] += -5;

        System.out.println("... 원본 배열(nums) 첫번째 자리에 + 10 : " + nums[1]);
        System.out.println("원본 배열(nums)     데이터 : " + Arrays.toString(nums));
        System.out.println("복사 배열(copyNums) 데이터 : " + Arrays.toString(copyNums));

        // ※ 얕은 복사는 원본 배열의 값을 변경하거나 복사본 배열의 값을 변경하면
        // 서로에게 영향을 준다.

    }

    public void practice4()
    {
        // 배열길이가 3인 정수형 배열 선언
        // 초기값 : 3000, 5500, 8000
        int[] prices =
        {
                3000, 5500, 8000
        };
        int[] discountPrices = new int[prices.length];

        System.out.println("원본 배열(prices)의 주소값 : " + prices);
        System.out.println("복사본 배열(discountPrices)의 주소값 : " + discountPrices);

        // [1] 반복문 사용
        for (int i = 0; i < prices.length; i++)
        {
            // prices 배열의 i번쨰 데이터를
            // discountPrices 배열의 i번째위치에 저장(대입)
            discountPrices[i] = prices[i];
        }

        System.out.println("*********** 반복문 사용하여 복사 후 ***********");
        System.out.println("원본 배열(prices)의 주소값 : " + prices);
        System.out.println("복사본 배열(discountPrices)의 주소값 : " + discountPrices);

        System.out.println("원본 배열(prices)의           주소값 : " + Arrays.toString(prices));
        System.out.println("복사본 배열(discountPrices)의 주소값 : " + Arrays.toString(discountPrices));

        // 복사본 배열(discountPrices)에 20% 할인된 가격으로 변경
        for (int i = 0; i < discountPrices.length; i++)
        {
            discountPrices[i] = (int) (discountPrices[i] * 0.8);

            System.out.printf("정가 %d원에서 20%%할인 적용 후 %d원이 되었습니다.\n", prices[i], discountPrices[i]);
        }

        // ※ 깊은 복사는 원본 배열의 값을 변경하거나 복사한 배열의 값을 변경하더라도
        // 서로에게 영향을 주지 않는다.
    }
}
