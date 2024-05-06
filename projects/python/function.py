# 함수 정의하기
# def 함수이름() :
    # 수행할 코드

# def menu() :
    # print("오늘의 메뉴")
    # print("오늘 점심 메뉴는 제육볶음입니다.")

# menu()

# def add(num1, num2) :
    # print(num1 + num2)
    # return num1 + num2
# print(add(1,2))

# def add(text1, text2) :
    # print(text1 + text2)
    # return text1 + text2
# print(add("홍","길동"))

def game(text):
    while True :
        print(text)
        keyword = input("끝말을 이어주세요 ")
        if text[-1] == keyword[0]:
            text = keyword
        else :
            print("끝말이 이어지지 않았습니다.")

game("함수호출")
