from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from datetime import datetime
import time
import pandas as pd
import os
import json
    # pip install selenium pandas
    # pip install webdriver-manager
def setup_driver():
    # Chrome 옵션 설정
    chrome_options = Options()
    # chrome_options.add_argument('--headless')  # 헤드리스 모드 비활성화
    chrome_options.add_argument('--ignore-certificate-errors')  # SSL 인증서 오류 무시
    chrome_options.add_argument('--ignore-ssl-errors')  # SSL 오류 무시
    chrome_options.add_argument('--disable-gpu')  # GPU 가속 비활성화
    chrome_options.add_argument('--disable-blink-features=AutomationControlled')  # 자동화 감지 방지


    # Chrome 드라이버 설정
    service = Service(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=service, options=chrome_options)
    return driver

def crawl_wanted_jobs(config):
    driver = setup_driver()
    all_jobs_list = []

    try:
        for site in config:
            jobs_list = []
            driver.get(site['url'])
            time.sleep(3)

            while len(jobs_list) < site.get('readCnt', 100):
                job_cards = driver.find_elements(By.CSS_SELECTOR, '.JobCard_JobCard__Tb7pI a')
                
                for card in job_cards:
                    if len(jobs_list) >= site.get('readCnt', 100):
                        break
                        
                    try:
                        title = card.find_element(By.CSS_SELECTOR, '.JobCard_JobCard__body__position__CyaGY').text.strip()
                        company = card.find_element(By.CSS_SELECTOR, '.CompanyNameWithLocationPeriod_CompanyNameWithLocationPeriod__company__j_pad').text.strip()
                        record_element = card.find_element(By.CSS_SELECTOR, '.CompanyNameWithLocationPeriod_CompanyNameWithLocationPeriod__location__FHNmN')
                        record_text = record_element.text
                        area = record_text.split(' · ')[0].strip()
                        record = record_text.split(' · ')[1].strip() if ' · ' in record_text else record_text
                        link = card.get_attribute('href')
                        
                        if title and link:
                            jobs_list.append({
                                'title': title,
                                'company': company,
                                'record': record,
                                'area': area,
                                'link': link,
                                'source_url': site['url'],
                                'site_name': site.get('siteName', '이름 없음')  # siteName 추가
                            })
                    except Exception as e:
                        print(f"채용 정보 처리 중 오류 발생: {str(e)}")
                        continue
                
                print(f"현재 수집된 채용 정보: {len(jobs_list)}개")
                driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
                time.sleep(2)
            
            all_jobs_list.extend(jobs_list)

        df = pd.DataFrame(all_jobs_list)
        
        # 결과 저장
        current_time = datetime.now().strftime('%Y%m%d%H%M')
        base_path = 'D:/workspace/git_project/yawooch/projects/python/crawlResult/jobs'
        
        # 디렉토리가 없는 경우 생성
        os.makedirs(base_path, exist_ok=True)
        
        # 마크다운 파일 저장
        md_path = f'{base_path}/jobs_{current_time}.md'
        with open(md_path, 'w', encoding='utf-8') as f:
            f.write('# 채용정보 수집 결과\n\n')
            f.write(f'수집 시간: {current_time}\n\n')
            
            # 사이트별로 그룹화하여 저장
            for site_name in df['site_name'].unique():
                f.write(f'## {site_name}\n\n')
                site_jobs = df[df['site_name'] == site_name]
                for _, row in site_jobs.iterrows():
                    f.write(f'- [{row["title"]}]({row["link"]})\n')
                    f.write(f'    - {row["company"]}\n')
                    f.write(f'    - {row["area"]}\n')
                    f.write(f'    - {row["record"]}\n\n')

        # JSON 파일 저장
        json_path = f'{base_path}/jobs_{current_time}.json'
        df.to_json(json_path, orient='records', force_ascii=False, indent=2)
        
        print(f"총 {len(all_jobs_list)}개의 채용정보를 수집했습니다.")
        print(f"결과가 다음 경로에 저장되었습니다:")
        print(f"- 마크다운: {md_path}")
        print(f"- JSON: {json_path}")
        
        return df

    except Exception as e:
        print(f"크롤링 중 오류 발생: {str(e)}")
        return None

    finally:
        driver.quit()

def print_config_info(config):
    print("\n=== 크롤링 설정 정보 ===")
    for idx, site in enumerate(config, 1):
        print(f"\n[사이트 {idx}]")
        print(f"사이트명: {site.get('siteName', '이름 없음')}")
        print(f"URL: {site['url']}")
        print(f"수집 목표: {site.get('readCnt', '설정 없음 (기본값: 100)')} 건")
        
        if 'elTag' in site:
            print("선택자 정보:")
            for key, value in site['elTag'].items():
                print(f"  - {key}: {value}")
        else:
            print("선택자 정보: 기본 a 태그 사용")
        print("-" * 50)

def main():
    print("Wanted 채용정보 크롤링을 시작합니다...")
    
    try:
        config_path = './crawling_config.json'
        print(f"\n설정 파일 경로: {os.path.abspath(config_path)}")
        
        if not os.path.exists(config_path):
            print(f"설정 파일이 없습니다: {config_path}")
            return
            
        with open(config_path, 'r', encoding='utf-8') as f:
            config = json.load(f)
            print_config_info(config)
            
    except Exception as e:
        print(f"설정 파일 읽기 실패: {str(e)}")
        import traceback
        traceback.print_exc()
        return

    try:
        result = crawl_wanted_jobs(config)
        
        if result is not None and not result.empty:
            print("\n=== 수집 결과 요약 ===")
            print(f"총 수집된 건수: {len(result)}")
            print("\n수집된 데이터 샘플 (처음 5개):")
            print(result[['title', 'company', 'area']].head())
        else:
            print("크롤링에 실패했거나 채용정보를 찾지 못했습니다.")
    except Exception as e:
        print(f"크롤링 실행 중 오류 발생: {str(e)}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main()