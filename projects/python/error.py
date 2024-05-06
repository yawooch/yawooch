## 예외처리

#print 구문오류내기 

## EOL End Of Line 행에 마지막에 문제가 있다.
## SyntaxError: unexpected EOF while parsing
#print("구문오류내기"

## 많이 내는 오류 
## 1. SyntaxError : 구문 오류
## 2. IndentationError : 들여쓰기 에러

## =============================================================================
## 1. Value Error
# def division():
    # num1 = input(int("첫번째 정수 입력 > "))
    # num2 = input(int("두번째 정수 입력 > "))
    # return print(f"{num1}을 {num2}로 나눈 값은 {num1/num2}입니다.")

# division()

## PS C:\python> & C:/Python38/python.exe c:/python/error.py
## 첫번째 정수 입력 > 정수
## Traceback (most recent call last):
##   File "c:/python/error.py", line 19, in <module>
##     division()
##   File "c:/python/error.py", line 15, in division
##     num1 = int(input("첫번째 정수 입력 > "))
## ValueError: invalid literal for int() with base 10: '정수'


## =============================================================================
## 2. TypeError
# def division():
    # num1 = input("첫번째 정수 입력 > ")
    # if num1.isdigit():
        # num2 = input("두번째 정수 입력 > ")
        # if num2.isdigit():
            # return print(f"{num1}을 {num2}로 나눈 값은 {int(num1)/int(num2)}입니다.")
        # else:
            # print("정수를 입력하세요")
    # else:
        # print("정수를 입력하세요")
# division()
## PS C:\python> & C:/Python38/python.exe c:/python/error.py
## 첫번째 정수 입력 > 10
## 두번째 정수 입력 > 0
## Traceback (most recent call last):
##   File "c:/python/error.py", line 43, in <module>
##     division()
##   File "c:/python/error.py", line 38, in division
##     return print(f"{num1}을 {num2}로 나눈 값은 {num1/num2}입니다.")
## TypeError: unsupported operand type(s) for /: 'str' and 'str'


## =============================================================================
## 3. KeyboardInterrupt
# def division():
    # num1 = input("첫번째 정수 입력 > ")
    # if num1.isdigit():
        # num2 = input("두번째 정수 입력 > ")
        # if num2.isdigit() and num2 != "0":
            # return print(f"{num1}을 {num2}로 나눈 값은 {int(num1)/int(num2)}입니다.")
        # else:
            # print("정수를 입력하세요")
    # else:
        # print("정수를 입력하세요")
# division()

## PS C:\python> & C:/Python38/python.exe c:/python/error.py
## 첫번째 정수 입력 > 5
## 두번째 정수 입력 > Traceback (most recent call last):
##   File "c:/python/error.py", line 67, in <module>
##     division()
##   File "c:/python/error.py", line 60, in division
##     num2 = input("두번째 정수 입력 > ")
## KeyboardInterrupt


## 위와같이 예외가 발생할 확률이 높다.


## =============================================================================
## try - except
# def division():
    # try:
        # num1 = input("첫번째 정수 입력 > ")
        # num2 = input("두번째 정수 입력 > ")
        # return print(f"{num1}을 {num2}로 나눈 값은 {int(num1)/int(num2)}입니다.")
    # except:
        # print("0이 아닌 숫자로된 정수를 입력해주세요")
# division()
## =============================================================================
## ValueErro, ZeroDivisionError, KeyboardInterrupt
# def division():
    # try:
        # num1 = input("첫번째 정수 입력 > ")
        # num2 = input("두번째 정수 입력 > ")
        # return print(f"{num1}을 {num2}로 나눈 값은 {int(num1)/int(num2)}입니다.")
    # except ValueError:
        # print("숫자로된 정수를 넣어주세요")
    # except ZeroDivisionError:
        # print("0을 입력하지 마세요")
    # except BaseException as e:
        # print(e)
    # except BaseException:
       # print("오류가 발생했습니다.")


# division() # 1.
# help(ValueError) # 2.
# help(ZeroDivisionError) # 2.
# help(KeyboardInterrupt) # 2.

## =============================================================================
## ex 1)
# def division():
    # try:
        # num1 = input("첫번째 정수 입력 > ")
        # num2 = input("두번째 정수 입력 > ")
        # return print(f"{num1}을 {num2}로 나눈 값은 {int(num1)/int(num2)}입니다.")
    # except BaseException as e:
        # print(e)
    # finally:
        # print("정상적으로 나누기 함수가 호출되었습니다.")
# division()
## ex 2)
# def division():
    # try:
        # num1 = int(input("첫번째 정수 입력 > "))
        # num2 = int(input("두번째 정수 입력 > "))
        # result = num1 / num2
    # except Exception:
        # print("오류가 발생했어요")
    # else:
        # print("정상적으로 나누기 함수가 호출되었습니다.")
        # return print(f"{num1}을 {num2}로 나눈 값은 {result}입니다.")
# division()