import json
import pandas as pd
import os
# pip install tabulate
# pip install pandas tabulate
def read_json_file(file_path):
    """JSON 파일을 읽어서 데이터를 반환합니다."""
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            data = json.load(file)
        return data
    except FileNotFoundError:
        print(f"Error: 파일을 찾을 수 없습니다. ({file_path})")
        return None
    except json.JSONDecodeError:
        print(f"Error: JSON 파일 형식이 올바르지 않습니다. ({file_path})")
        return None

def save_as_txt(df, output_path):
    """DataFrame을 TXT 파일로 저장합니다."""
    try:
        with open(output_path, 'w', encoding='utf-8') as f:
            # 빈 줄 제거를 위해 splitlines()와 join 사용
            content = df.to_csv(sep='\t', index=False).strip()
            lines = [line for line in content.splitlines() if line.strip()]
            f.write('\n'.join(lines))
        print(f"파일이 저장되었습니다: {output_path}")
    except Exception as e:
        print(f"파일 저장 중 오류 발생: {e}")

def get_output_path(input_path):
    """입력 경로로부터 출력 파일 경로를 생성합니다."""
    from datetime import datetime
    date_suffix = datetime.now().strftime('%y%m%d')
    base_path = os.path.splitext(input_path)[0]
    return f"{base_path}_{date_suffix}.txt"

def display_json_as_table(data, output_path):
    """JSON 데이터를 테이블 형태로 출력하고 파일로 저장합니다."""
    if isinstance(data, dict):
        if all(isinstance(v, (str, int, float)) for v in data.values()):
            df = pd.DataFrame(data.items(), columns=['Key', 'Value'])
        else:
            df = pd.DataFrame([data])
    elif isinstance(data, list):
        df = pd.DataFrame(data)
    else:
        print("Error: 지원하지 않는 데이터 형식입니다.")
        return

    # 콘솔 출력시에도 빈 줄 제거
    content = df.to_csv(sep='\t', index=False).strip()
    lines = [line for line in content.splitlines() if line.strip()]
    print("\n" + '\n'.join(lines))
    print(f"\n총 {len(df)} 행의 데이터가 있습니다.")
    
    # TXT 파일로 저장
    save_as_txt(df, output_path)

def process_file_or_directory(path):
    """파일 또는 디렉토리를 처리합니다."""
    if os.path.isfile(path):
        if path.lower().endswith('.json'):
            data = read_json_file(path)
            if data:
                print(f"\n파일 처리 중: {path}")
                output_path = get_output_path(path)
                display_json_as_table(data, output_path)
        else:
            print(f"Error: JSON 파일이 아닙니다. ({path})")
    elif os.path.isdir(path):
        json_files = [f for f in os.listdir(path) if f.lower().endswith('.json')]
        if not json_files:
            print(f"Error: 디렉토리에 JSON 파일이 없습니다. ({path})")
            return
        
        # 모든 JSON 파일의 데이터를 하나의 리스트로 통합
        all_data = []
        for json_file in json_files:
            file_path = os.path.join(path, json_file)
            data = read_json_file(file_path)
            if data:
                print(f"\n파일 처리 중: {file_path}")
                if isinstance(data, list):
                    all_data.extend(data)
                else:
                    all_data.append(data)
        
        if all_data:
            # 폴더명을 기반으로 출력 파일명 생성
            folder_name = os.path.basename(path)
            from datetime import datetime
            date_suffix = datetime.now().strftime('%y%m%d')
            output_path = os.path.join(path, f"{folder_name}_{date_suffix}.txt")
            
            # 통합된 데이터를 하나의 파일로 저장
            df = pd.DataFrame(all_data)
            content = df.to_csv(sep='\t', index=False).strip()
            lines = [line for line in content.splitlines() if line.strip()]
            
            # 콘솔 출력
            print("\n" + '\n'.join(lines))
            print(f"\n총 {len(df)} 행의 데이터가 있습니다.")
            
            # 파일 저장
            try:
                with open(output_path, 'w', encoding='utf-8') as f:
                    f.write('\n'.join(lines))
                print(f"파일이 저장되었습니다: {output_path}")
            except Exception as e:
                print(f"파일 저장 중 오류 발생: {e}")
    else:
        print(f"Error: 유효하지 않은 경로입니다. ({path})")

def main():
    # 기본 경로를 폴더 경로로 설정
    default_path = r"D:/workspace/git_project/yawooch/projects/python/crawlResult/jobs"
    
    # 파일 또는 디렉토리 처리
    process_file_or_directory(default_path)

if __name__ == "__main__":
    main()

