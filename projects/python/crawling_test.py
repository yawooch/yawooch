## 웹크롤링(웹 스크래핑) : 웹서비스정보를 가져와서 필요한 정보만 추출하는것
## 웹크롤링을 하는 도구 -> 웹 크롤러

# HTML & CSS : crawling_html_ex.html
# pip install requests
import requests

## =============================================================
# print(requests.get("https://www.naver.com")) # 200
##r = requests.get("https://www.naver.com")

## print(r.content)
##print(r.text)
## =============================================================
## parser
## BeautifulSoup
## pip install BeautifulSoup4
from bs4 import BeautifulSoup
#r = requests.get("https://www.naver.com")
#bs = BeautifulSoup(r.content, "html.parser")
## print(bs)

#p = bs.select("p")
#print(p)
#p = bs.select_one("p")
#print(p)
#print(p.text)
#p = bs.select("p")
#print(p)
#print(p[0].attrs)
#select = bs.select_one("div")
## div.[클래스이름] 클래스이름을 가지고 값을 가져오다.
## #[클래스이름] 클래스이름을 가지고 값을 가져오다.

#select = bs.find("div", {"class": "atcmp_footer"})
#print(select.text)

## =============================================================
## 체감온도 가져오기
r = requests.get("https://weather.naver.com/today/09590107?cpName=KMA")
bs = BeautifulSoup(r.content, "html.parser")

select = bs.select_one("div.weather_now > div.summary_img")
#weather_quick_inner list
print(select.text)
