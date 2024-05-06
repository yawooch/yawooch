#문자열 인덱싱 - 문자를 추출하는 방법
#print("index"[-5] )
#print("index"[-4] )
#print("index"[-3] )
#print("index"[-2] )
#print("index"[-1] )

#text = "String index"
#print(text[1])
#print(text[2])
#print(text[3])
#print(text[4])
#print(text[5])
#print(text[6])

#문자열 슬라이싱 - 문자열 안에 있는 문자들을 추출하는 기법

#사용방법 
#print("0123456789"[0:8])#0~8까지 문자 추출

text = "0123456789"

#print(text[0:7])
#print(text[:10])

#음수
#print(text[-8:-1])
text = "Python is easy"
#print(text[-14:])
#print(text[-14:-7])

# 스텝 - 몇번째 씩 끊어서 추출할수 있는 기능
# 음수를 넣어준다면 거꾸로 출력해줌
#text = "0123456789"
# print(text[0:10:2])
# text = "Python"
# print(text[::-2]) # nhy

weather = "맑음"
temperature = 20 
chance_shower = 13.5
# print("오늘의 날씨는 %s 기온은 %d도 입니다. 비가내릴 확률은 %.1f%%입니다."%(weather,temperature, chance_shower))
# print("오늘의 날씨는 {0} 기온은 {1}도 입니다. 비가내릴 확률은 {2}입니다.".format(weather,temperature,chance_shower))
# print("{0:} {1:d} {1:f} {1:o} {1:x}  ".format(weather,temperature,chance_shower))
# {1:d}
# {1:f} 
# {1:o} 8진수
# {1:x}16진수

#정렬
left = "left"
right = "right"
middle = "middle"
# print("({:<10s}), ({:^10s}),({:>10s})".format(left, middle, right))
# =>(left      ), (  middle  ),(     right)
# print("({2:!>10.4s}), ({1:@^10.3s}),({0:#<10.2s})".format(left, middle, right))
# => (!!!!!!righ), (@@@mid@@@@),(le########)

# f - String
weather = "맑음"
temperature = 20
# print(f"오늘의 날씨는 {weather}이며, 기온은 {temperature}도 입니다.")
print(f"2곱하기 30의결과값 = {2*30}")