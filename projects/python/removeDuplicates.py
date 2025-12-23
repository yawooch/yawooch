import pandas as pd
import os
from datetime import datetime

def remove_duplicates(file_path, columns=None):
    """
    탭으로 구분된 txt 파일에서 중복을 제거합니다.
    
    Args:
        file_path (str): 입력 파일 경로
        columns (list, optional): 중복 체크할 특정 컬럼명 리스트
    """
    try:
        # 탭으로 구분된 txt 파일 읽기
        df = pd.read_csv(file_path, sep='\t')
        
        # 원본 행 수
        original_count = len(df)
        
        # 중복 제거
        if columns:
            # 특정 컬럼 기준으로 중복 제거
            df_distinct = df.drop_duplicates(subset=columns, keep='first')
            print(f"지정된 컬럼 {columns}의 중복 제거 수행")
        else:
            # 모든 컬럼 기준으로 중복 제거
            df_distinct = df.drop_duplicates(keep='first')
            print("전체 행 기준 중복 제거 수행")
        
        # 중복 제거된 행 수
        distinct_count = len(df_distinct)
        
        # 결과 파일 경로 생성
        file_dir = os.path.dirname(file_path)
        file_name = os.path.basename(file_path)
        name_without_ext = os.path.splitext(file_name)[0]
        date_suffix = datetime.now().strftime('%y%m%d')
        output_path = os.path.join(file_dir, f"distinct_{name_without_ext}_{date_suffix}.txt")
        
        # 결과 저장
        content = df_distinct.to_csv(sep='\t', index=False).strip()
        lines = [line for line in content.splitlines() if line.strip()]
        
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write('\n'.join(lines))
        
        print(f"\n원본 데이터: {original_count}행")
        print(f"중복 제거 후: {distinct_count}행")
        print(f"제거된 중복: {original_count - distinct_count}행")
        print(f"\n결과가 저장되었습니다: {output_path}")
        
    except Exception as e:
        print(f"오류 발생: {e}")

def main():
    # 기본 파일 경로 설정
    default_path = r"D:/workspace/git_project/yawooch/projects/python/crawlResult/jobs/jobs_250305.txt"
    
    # 파일 처리
    # 전체 행 기준 중복 제거
    # remove_duplicates(default_path)
    
    # 특정 컬럼 기준 중복 제거의 예
    # columns = ['회사명', 'URL']  # 예시: 회사명과 URL이 같은 경우 중복으로 처리
    columns = ['title']
    remove_duplicates(default_path, columns)

if __name__ == "__main__":
    main() 