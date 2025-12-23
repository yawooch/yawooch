import json
import pandas as pd

def read_json_and_save_table(json_file_path, output_file_path):
    try:
        # JSON 파일 열기
        with open(json_file_path, 'r', encoding='utf-8') as file:
            data = json.load(file)
            
        # JSON 데이터를 pandas DataFrame으로 변환
        df = pd.DataFrame(data)
        
        # 콘솔에 출력
        print("\n=== 데이터 테이블 ===")
        print(df)
        
        # DataFrame을 탭으로 구분된 텍스트 파일로 저장
        df.to_csv(output_file_path, 
                 sep='\t',              # 탭으로 구분
                 encoding='utf-8',      # UTF-8 인코딩 사용
                 index=False,           # 인덱스 번호 제외
                 na_rep='NaN')         # 결측값 표시 방법
        
        print(f"\n데이터가 {output_file_path}에 저장되었습니다.")
        return df
    
    except FileNotFoundError:
        print("파일을 찾을 수 없습니다.")
    except json.JSONDecodeError:
        print("올바른 JSON 형식이 아닙니다.")
    except Exception as e:
        print(f"오류가 발생했습니다: {str(e)}")

# 사용 예시
if __name__ == "__main__":
    json_file_path = "D:/workspace/git_project/yawooch/projects/python/crawlResult/jobs/jobs_202501302303.json"        # JSON 파일 경로
    output_file_path = "D:/workspace/git_project/yawooch/projects/python/output.txt"     # 출력할 텍스트 파일 경로
    df = read_json_and_save_table(json_file_path, output_file_path)