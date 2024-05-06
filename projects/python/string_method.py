# 내장함수 : print()
# - 괄호안에 인자를 넣어서 사용
# 메서드 : .upper()
# - .(참조연산자)를 이용해서 특정한 데이터를 참조해서 사용


#문자열 메서드 예제
# text = "www.GOOGLE.com"
# print(len(text))
# => 14

# capitalize() - 문자열에서 첫글자를 대문자로 변환해준다.
# text2 = text.capitalize()
# print(text2)

# .upper() #문자열 전체를 대문자로 변경
# .lower() #문자열 전체를 소문자로 변경
# print(text.upper())
# print(text.lower())

# count, find, index
# print(text.count('G')) # 'G'의 갯수
# print(text.find('G')) # 'G' 위치값(index)
# print(text.find('G',5)) # index 5 이후에 찾아지는 'G' 위치값(index)
# find() & index() 
# print(text.find('X')) # 'G' 위치값(index) # -1
# print(text.index('X')) # 'G' 위치값(index) # 에러 발생
# =>
# -1
# Traceback (most recent call last):
  # File "c:/python/string_method.py", line 27, in <module>
    # print(text.index('X')) # 'G' 위치값(index)

# print(text.rfind('G'))  # 뒤에서부터 검색하여 'G' 위치값(index)
# print(text.rindex('G')) # 뒤에서부터 검색하여 'G' 위치값(index)


# replace()
# print(text.replace("GOOGLE", "NAVER"))#문자열 치환
# => www.NAVER.com

# split()
# print(text.split('.')) # 인자 값에 따라 문자열을 분리해준다.
# => ['www', 'GOOGLE', 'com']

#strip()
# text = "               www.GOOGLE.com                 "
# print(text.strip()) # 문자열 좌우의 공백을 지워주는 메서드 (문자 사이에 있는 공백은 지울수 없음)
# print(text.lstrip())
# print(text.rstrip())
