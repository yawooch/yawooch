import requests
from bs4 import BeautifulSoup
from datetime import datetime
import os
import json

def scrape_naver_news():
    news_categories = {
        '정치': 'https://news.naver.com/section/100',
        '경제': 'https://news.naver.com/section/101',
        '사회': 'https://news.naver.com/section/102',
        '생활/문화': 'https://news.naver.com/section/103',
        'IT/과학': 'https://news.naver.com/section/105',
        '세계': 'https://news.naver.com/section/104'
    }
    
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
    }
    
    news_data = {}
    
    for category, url in news_categories.items():
        response = requests.get(url, headers=headers)
        soup = BeautifulSoup(response.text, 'html.parser')
        
        news_data[category] = {'main': [], 'sub': {}}
        
        # 메인 헤드라인 스크랩
        main_headlines = soup.select('.sa_text_title')[:3]
        for headline in main_headlines:
            title = headline.text.strip()
            link = headline['href']
            news_data[category]['main'].append({
                'title': title,
                'link': link
            })
        
        # 세부 카테고리 링크 추출
        sub_categories = soup.select('.ct_snb_nav_item a')
        for sub_category in sub_categories:
            sub_name = sub_category.text.strip()
            sub_url = 'https://news.naver.com' + sub_category['href']
            sub_response = requests.get(sub_url, headers=headers)
            sub_soup = BeautifulSoup(sub_response.text, 'html.parser')
            
            sub_headlines = sub_soup.select('.sa_text_title')[:3]
            news_data[category]['sub'][sub_name] = []
            for headline in sub_headlines:
                title = headline.text.strip()
                link = headline['href']
                news_data[category]['sub'][sub_name].append({
                    'title': title,
                    'link': link
                })
    
    return news_data

def save_to_json(news_data, filename):
    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(news_data, f, ensure_ascii=False, indent=2)

def save_to_markdown(news_data, filename):
    with open(filename, 'w', encoding='utf-8') as f:
        f.write("# 네이버 뉴스 스크랩\n\n")
        f.write(f"스크랩 시간: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        
        for category, data in news_data.items():
            f.write(f"## {category}\n\n")
            f.write("### 메인 헤드라인\n\n")
            for article in data['main']:
                f.write(f"- [{article['title']}]({article['link']})\n")
            f.write("\n### 세부 카테고리\n\n")
            for sub_category, articles in data['sub'].items():
                f.write(f"#### {sub_category}\n\n")
                for article in articles:
                    f.write(f"- [{article['title']}]({article['link']})\n")
            f.write("\n---\n\n")

if __name__ == "__main__":
    news_data = scrape_naver_news()
    
    if not any(news_data.values()):
        print("스크랩된 기사가 없습니다. 다음을 확인해주세요:")
        print("1. 인터넷 연결이 정상인지 확인하세요.")
        print("2. 네이버 뉴스 웹사이트의 구조가 변경되었을 수 있습니다.")
        print("3. 네이버에서 봇의 접근을 차단했을 수 있습니다.")
    else:
        current_time = datetime.now().strftime("%Y%m%d_%H%M%S")
        current_time_folder = datetime.now().strftime("%Y%m%d")
        
        # python 폴더가 없으면 생성
        if not os.path.exists(f'news_{current_time_folder}'):
            os.makedirs(f'news{current_time_folder}')
        
        # JSON 파일로 저장
        json_filename = os.path.join(f'news{current_time_folder}', f"naver_news_{current_time}.json")
        save_to_json(news_data, json_filename)
        print(f"JSON 파일 저장 완료: {json_filename}")
        
        # Markdown 파일로 저장
        md_filename = os.path.join(f'news{current_time_folder}', f"naver_news_{current_time}.md")
        save_to_markdown(news_data, md_filename)
        print(f"Markdown 파일 저장 완료: {md_filename}")
        
        total_articles = sum(len(data['main']) + sum(len(sub_articles) for sub_articles in data['sub'].values()) for data in news_data.values())
        print(f"총 {total_articles}개의 기사를 스크랩했습니다.")