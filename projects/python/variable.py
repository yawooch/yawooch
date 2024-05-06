# 지역변수(Local Variable) , 전역 변수(Global Variable)
# def jeju_potato() :
    # potato = "고구마"
    # print(potato)

# jeju_potato()
#print(potato)

# =================================================
#전역변수
# potato = "감자"

# def jeju_potato() :
    # print(potato)

# jeju_potato()

# =================================================
# Local  Variable Symbol
# Global Variable Symbol

# potato = "감자"

# def jeju_potato() :
    # print(potato)
    # potato = "고구마" #오류발생
    # print(potato)

# jeju_potato()

#전역변수 를 함수안에서 지칭할때 혼돈이 오기때문에 Global이라는 키워드를 사용해야함

# potato = "감자"

# def jeju_potato() :
    # global potato
    # print(potato)
    # potato = "고구마"
    # print(potato)

# jeju_potato()

# =================================================
# def add(num1, num2 =20, num3= 30) :
    # return num1 + num2 + num3

# print(add(num1= 10, num3= 2)) # 10 + 20 + 2

# =================================================
# 함수가 정의되는 시점에서의 변수도 중요하다.
# a, b = 20, 40

# def add(num1=a, num2 =b) :
    # return num1 + num2
# a, b = 10, 5
# print(add()) # 출력결과는 60이 나온다

# =================================================
# 가변 매개변수

# def add(*args):
    # sum = 0
    # for i in args :
        # sum+=i
    # print(sum)

# add(10,20,30,40)

# =================================================
# 키워드 매개변수
# def star_player(**kwargs):
    # for i in kwargs :
        # print(i)

# star_player(축구 = "손흥민", 야구 = "박용택", 농구 = "허재")

# def star_player(**kwargs):
    # for i, j in kwargs.items() :
        # if "서장훈" in kwargs.values():
            # print("농구는 서장훈이지")
        # else :
            # print("{}는 역시 {}지".format(i, j))

# star_player(농구 = "서장훈")

# 키워드 매개변수 입력시 순서
# 일반 매개변수 > 가변 매개변수 > 기본 매개변수 > 키워드 매개변수

# def func_a(name, *args, address = "한국", **kwargs):
    # print(name, args, address, kwargs)

# func_a("홍길동", "옛날", "사람", address="한양",직업 = "도둑")
# =================================================
# def max_min_search(*number) :
    # max_number = number[0]
    # min_number = number[0]
    # for num in number:
        # if num > max_number:
            # max_number = num
        # elif num < min_number :
            # min_number = num
    # return max_number, min_number

# print(max_min_search(15,30,4,60,7,80,32))

#다른 방법(튜플로 들어오므로)

# def max_min_search(*number) :
    # return max(number), min(number)

# print(max_min_search(15,30,4,60,7,80,32))

# python.org > documentation 
# 내장 함수를 찾아볼수 있는 방법

