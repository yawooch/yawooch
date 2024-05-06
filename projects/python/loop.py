# 반복문
# while 문
# i = 0
# while i < 6:
    # i = i + 1
    # print(i)
# else :
    # print("값이 {}이상이므로 종료합니다. ".format(i))

# fruits = ["사과", "바나나", "키위", "사과", "바나나", "망고"]
# print(fruits)
# fruit = input("빼낼 과일을 입력해주세요>")

# while fruit in fruits :
    # fruits.remove(fruit)

# print(fruits)
# print("{}를 보두 제거했습니다.".format(fruit))

# ---------------------------------------------------------------------
# if문과 while문을 같이 사용하는 방법
# 최소값과 최대값 입력
# min_num = int(input("최소값 입력"))
# max_num = int(input("최대값 입력"))
#홀수 짝수 리스트 생성
# odd_list = []
# even_list = []

#제어변수에 최소값 할당
# num = min_num

#최소값이 최대값보다 작을 경우 실행
# if min_num < max_num :
    # while num < max_num : #제어변수가 최댓값이 될때 까지 반복 실행
        # if num%2 ==0 :#짝수 , 홀수 판별
            # even_list.append(num)
        # else : 
            # odd_list.append(num)
        # num += 1
    # print("{}부터 {}까지의 짝수는 {}입니다.".format(min_num, max_num, even_list))
    # print("{}부터 {}까지의 홀수는 {}입니다.".format(min_num, max_num, odd_list))
# else : #최소값이 최대값보다 크거나 같을경우
    # print("최댓값 {}이 최솟값{}보다 크지 않습니다.".format(max_num, min_num))
# ---------------------------------------------------------------------
# Range함수

numbers = list(range(0, 10)) # [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
print(numbers)

numbers = list(range(-10, 0)) # [-10, -9, -8, -7, -6, -5, -4, -3, -2, -1]
print(numbers)

numbers = list(range(-10, 0, 2)) # [-10, -8, -6, -4, -2]
print(numbers)

numbers = list(range(-10, 10 // 2)) # 몫만 계산하는(정수형) 나눗셈 기호 //
print(numbers)

