import requests
from bs4 import BeautifulSoup

r = requests.get("https://www.melon.com/index.htm")
bs = BeautifulSoup(r.content, "html.parser")

## 가수의 목록
## 노래의 목록

song_name = []
artist_name = []

song = bs.select("table")
print(r)