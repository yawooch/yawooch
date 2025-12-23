import os
from datetime import datetime
import re

def sort_key(item, columns=None):
    if columns is None:
        # 컬럼을 지정하지 않은 경우 전체 컬럼을 순서대로 정렬
        columns = list(range(len(item)))
    
    def get_type_order(s):
        # 빈 문자열 체크
        if not s:
            return 5  # 빈 문자열은 마지막 순위
            
        # 첫 글자의 타입으로 우선순위 부여
        first_char = s[0]
        if re.match(r'[a-zA-Z]', first_char):
            return 0  # 1순위: 영어
        elif re.match(r'[가-힣]', first_char):
            return 1  # 2순위: 한글
        elif re.match(r'[0-9]', first_char):
            return 2  # 3순위: 숫자
        elif re.match(r'[\[\](){}]', first_char):
            return 3  # 4순위: 괄호 ([]{})
        else:
            return 4  # 5순위: 특수문자 및 기타
    
    result = []
    for col in columns:
        if col < len(item):
            s = item[col]
            # (타입 우선순위, 실제 문자열) 형태로 반환
            result.append((get_type_order(s), s.lower()))  # 대소문자 구분 없이 정렬
    
    return result

def sort_file(input_file, columns=None):
    # 파일 읽기
    with open(input_file, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    # 헤더와 데이터 분리
    header = lines[0]
    data = [line.strip().split('\t') for line in lines[1:]]  # 헤더 제외하고 데이터만 처리
    
    # 정렬
    sorted_data = sorted(data, key=lambda x: sort_key(x, columns))
    
    # 출력 파일명 생성
    base_name = os.path.basename(input_file)
    file_name = os.path.splitext(base_name)[0]
    current_date = datetime.now().strftime('%y%m%d')
    output_file = f'sorted_{file_name}_{current_date}.txt'
    output_path = os.path.join(os.path.dirname(input_file), output_file)
    
    # 정렬된 데이터 저장 (헤더 포함)
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(header)  # 헤더 먼저 쓰기
        for row in sorted_data:
            f.write('\t'.join(row) + '\n')
    
    return output_path

def main():
    # 직접 파일 경로 지정 (raw 문자열 사용)
    input_file = r"D:/workspace/git_project/yawooch/projects/python/crawlResult/jobs/distinct_jobs_250305_250305.txt"
    # 또는 이중 백슬래시 사용
    # input_file = "C:\\Users\\sdream\\Documents\\work\\python\\crawlResult\\jobs\\distinct_jobs_250219_25021.txt"
    
    # 정렬할 컬럼 지정
    # columns = None
    columns = [1]
    
    try:
        output_file = sort_file(input_file, columns)
        print(f"정렬이 완료되었습니다. 결과가 다음 파일에 저장되었습니다: {output_file}")
    except Exception as e:
        print(f"오류가 발생했습니다: {str(e)}")

if __name__ == "__main__":
    main()