from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from datetime import datetime
import time
import pandas as pd
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

def get_element_text(card, element_config, is_link=False):
    try:
        # 필수 입력값인 selector로 요소 찾기
        elements = card.find_elements(By.CSS_SELECTOR, element_config['selector'])
        
        if not elements:
            return ""
            
        # elOrdNum이 지정된 경우 해당 인덱스의 요소 선택, 없으면 첫 번째 요소 선택
        element_index = int(element_config.get('elOrdNum', 0))
        if element_index >= len(elements):
            element_index = 0
        
        selected_element = elements[element_index]
        
        # link 요소인 경우 href 속성 가져오기
        if is_link:
            text = selected_element.get_attribute('href')
        else:
            text = selected_element.text.strip()
        
        # splitWord가 지정된 경우 텍스트 분할
        if 'splitWord' in element_config and text:
            split_text = text.split(element_config['splitWord'])
            # splitOrdNum이 지정된 경우 해당 인덱스의 텍스트 선택, 없으면 첫 번째 텍스트 선택
            split_index = int(element_config.get('splitOrdNum', 0))
            if 0 <= split_index < len(split_text):
                text = split_text[split_index].strip()
        
        return text
    except Exception as e:
        print(f"요소 텍스트 추출 중 오류 발생: {str(e)}")
        return ""

def crawl_jobs(config):
    driver = setup_driver()
    all_jobs_list = []

    try:
        for site_config in config[1:]:
            print(f"\n=== {site_config['site']['korName']} 크롤링 시작 ===")
            print(f"URL: {site_config['url']}")
            jobs_list = []
            
            try:
                driver.get(site_config['url'])
                time.sleep(5)

                while len(jobs_list) < site_config.get('readCnt', 100):
                    try:
                        print("\n채용 카드 검색 중...")
                        job_cards = driver.find_elements(By.CSS_SELECTOR, site_config['elTag']['target']['selector'])
                        
                        if not job_cards:
                            print(f"채용 카드를 찾을 수 없습니다. (선택자: {site_config['elTag']['target']['selector']})")
                            break

                        print(f"발견된 채용 카드 수: {len(job_cards)}")
                        previous_len = len(jobs_list)
                        
                        for card in job_cards:
                            if len(jobs_list) >= site_config.get('readCnt', 100):
                                break
                                
                            try:
                                print("\n--- 채용 정보 추출 시도 ---")
                                # 각 요소의 텍스트 추출
                                title = get_element_text(card, site_config['elTag']['title'])
                                print(f"제목: {title}")
                                
                                company = get_element_text(card, site_config['elTag']['company'])
                                print(f"회사: {company}")
                                
                                area = get_element_text(card, site_config['elTag']['area'])
                                record = get_element_text(card, site_config['elTag']['record'])
                                print(f"경력: {record}")
                                print(f"지역: {area}")
                                
                                if 'link' in site_config['elTag']:
                                    link = get_element_text(card, site_config['elTag']['link'], is_link=True)
                                else:
                                    link = card.get_attribute('href')
                                print(f"링크: {link}")
                                
                                if title and link and link not in [job['link'] for job in jobs_list]:
                                    print("\n=== 새로운 채용정보 발견 ===")
                                    print(f"제목: {title}")
                                    print(f"회사: {company}")
                                    print(f"경력: {record}")
                                    print(f"지역: {area}")
                                    print(f"링크: {link}")
                                    print("=========================")
                                    
                                    jobs_list.append({
                                        'site_name': site_config['site']['korName'],
                                        'title': title,
                                        'company': company,
                                        'record': record,
                                        'area': area,
                                        'link': link,
                                        'source_url': site_config['url']
                                    })
                                else:
                                    if not title:
                                        print("제목이 없어 건너뜀")
                                    elif not link:
                                        print("링크가 없어 건너뜀")
                                    else:
                                        print("중복된 링크라 건너뜀")
                                        
                            except Exception as e:
                                print(f"개별 채용 정보 처리 중 오류 발생: {str(e)}")
                                continue
                        
                        print(f"\n현재 수집된 채용 정보: {len(jobs_list)}개")
                        
                        if previous_len == len(jobs_list):
                            print("새로운 채용 정보가 발견되지 않았습니다.")
                            
                        driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
                        time.sleep(3)
                        
                        if previous_len == len(jobs_list) and len(jobs_list) > 0:
                            print("3초 동안 새로운 채용 정보가 로드되지 않았습니다. 한 번 더 시도합니다.")
                            time.sleep(2)
                            driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
                            time.sleep(3)
                            
                            if previous_len == len(jobs_list):
                                print("더 이상 새로운 채용 정보를 찾을 수 없습니다.")
                                break
                            
                    except Exception as e:
                        print(f"페이지 처리 중 오류 발생: {str(e)}")
                        break

                all_jobs_list.extend(jobs_list)
                
            except Exception as e:
                print(f"사이트 처리 중 오류 발생: {str(e)}")
                continue

        # DataFrame 생성
        df = pd.DataFrame(all_jobs_list)
        
        # 현재 시간 생성
        current_time = datetime.now().strftime('%Y%m%d%H%M')
        base_path = 'D:/workspace/git_project/yawooch/projects/python/crawlResult/jobs'
        
        # JSON 파일 저장 (source_url 제외)
        json_path = f'{base_path}/jobs_{current_time}.json'
        df_json = df.drop('source_url', axis=1)  # source_url 컬럼 제외
        df_json.to_json(json_path, orient='records', force_ascii=False, indent=2)
        
        # 마크다운 파일 저장
        md_path = f'{base_path}/jobs_{current_time}.md'
        with open(md_path, 'w', encoding='utf-8') as f:
            f.write(f'# 채용정보 수집 결과\n\n')
            f.write(f'수집 시간: {current_time}\n\n')
            
            # 사이트별로 그룹화하여 저장
            for site_name in df['site_name'].unique():
                f.write(f'## {site_name}\n\n')
                site_data = df[df['site_name'] == site_name]
                
                for _, row in site_data.iterrows():
                    f.write(f'- [{row["title"]}]({row["link"]})\n')
                    f.write(f'    - 회사: {row["company"]}\n')
                    f.write(f'    - 지역: {row["area"]}\n')
                    f.write(f'    - 경력: {row["record"]}\n')
                f.write('\n')
        
        print(f"\n=== 크롤링 완료 ===")
        print(f"총 {len(df)}개의 채용정보를 수집했습니다.")
        print(f"결과가 다음 경로에 저장되었습니다:")
        print(f"- 마크다운: {md_path}")
        print(f"- JSON: {json_path}")
        
        return df

    except Exception as e:
        print(f"크롤링 중 오류 발생: {str(e)}")
        return None

    finally:
        driver.quit()

def main():
    print("채용정보 크롤링을 시작합니다...")
    
    # JSON 설정 파일 읽기
    try:
        with open('D:/workspace/git_project/yawooch/projects/python/crawling_config.json', 'r', encoding='utf-8') as f:
            config = json.load(f)
    except Exception as e:
        print(f"설정 파일 읽기 실패: {str(e)}")
        return

    result = crawl_jobs(config)
    
    if result is not None and not result.empty:
        print("\n수집된 채용정보 목록:")
        print(result)
    else:
        print("크롤링에 실패했거나 채용정보를 찾지 못했습니다.")

if __name__ == "__main__":
    main()