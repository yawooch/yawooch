def read_input_file(file_path):
    """
    텍스트 파일을 읽어오는 함수
    
    Args:
        file_path (str): 입력 파일 경로
    
    Returns:
        str: 파일 내용
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            return file.read()
    except FileNotFoundError:
        print(f"오류: {file_path} 파일을 찾을 수 없습니다.")
        return None
    except Exception as e:
        print(f"파일 읽기 오류: {str(e)}")
        return None

def convert_text_to_table(text, delimiter='\t'):
    """
    다중행 텍스트를 테이블 형식으로 변환하는 함수
    
    Args:
        text (str): 변환할 텍스트
        delimiter (str): 구분자 (기본값: '\t')
    
    Returns:
        str: 테이블 형식으로 변환된 텍스트
    """
    if not text:
        return "변환할 텍스트가 없습니다."

    # 텍스트를 행으로 분리
    lines = [line.strip() for line in text.strip().split('\n')]
    
    # 각 행을 구분자로 분리
    table_data = [line.split(delimiter) for line in lines]
    
    # 모든 행의 열 개수를 첫 번째 행과 동일하게 맞추기
    max_cols = len(table_data[0])
    for i in range(len(table_data)):
        while len(table_data[i]) < max_cols:
            table_data[i].append('')

    # 문자열 실제 표시 길이를 계산하는 함수
    def get_display_length(s):
        length = 0
        for char in s:
            if (0xAC00 <= ord(char) <= 0xD7A3) or \
               (0x3131 <= ord(char) <= 0x314E) or \
               (0x314F <= ord(char) <= 0x3163):
                length += 2
            else:
                length += 1
        return length

    # 각 열의 최대 길이 계산
    col_widths = []
    for col in range(max_cols):
        width = max(len(row[col].strip()) for row in table_data)  # 실제 문자열 길이
        display_width = max(get_display_length(row[col].strip()) for row in table_data)  # 표시 길이
        col_widths.append((width, display_width))
    
    # 테이블 생성
    result = []
    
    # 상단 테두리 생성
    top_border = '┌'
    for i, (_, display_width) in enumerate(col_widths):
        top_border += '─' * (display_width + 2)
        top_border += '┐' if i == len(col_widths) - 1 else '┬'
    result.append(top_border)
    
    # 테이블 내용 생성
    for i, row in enumerate(table_data):
        # 행 내용 추가
        formatted_row = '│'
        for j, cell in enumerate(row):
            content = cell.strip()
            actual_width, display_width = col_widths[j]
            padding = display_width - get_display_length(content)
            formatted_row += f' {content}{" " * padding} │'
        result.append(formatted_row)
        
        # 행 구분선 추가
        if i < len(table_data) - 1:
            middle_border = '├'
            for k, (_, display_width) in enumerate(col_widths):
                middle_border += '─' * (display_width + 2)
                middle_border += '┤' if k == len(col_widths) - 1 else '┼'
            result.append(middle_border)
    
    # 하단 테두리 생성
    bottom_border = '└'
    for i, (_, display_width) in enumerate(col_widths):
        bottom_border += '─' * (display_width + 2)
        bottom_border += '┘' if i == len(col_widths) - 1 else '┴'
    result.append(bottom_border)
    
    return '\n'.join(result)

def save_output(table, output_file='output_table.txt'):
    """
    변환된 테이블을 파일로 저장하는 함수
    
    Args:
        table (str): 저장할 테이블 문자열
        output_file (str): 출력 파일 경로
    """
    try:
        with open(output_file, 'w', encoding='utf-8') as file:
            file.write(table)
        print(f"테이블이 {output_file}에 저장되었습니다.")
    except Exception as e:
        print(f"파일 저장 오류: {str(e)}")

def main():
    # input_file = 'C:/Users/sdream/Documents/work/python/crawlResult/jobs/jobs_250207.txt'
    input_file = 'D:/workspace/git_project/yawooch/projects/python/input_txt.txt'
    output_file = 'D:/workspace/git_project/yawooch/projects/python/output_table.txt'
    
    # 입력 파일 읽기
    input_text = read_input_file(input_file)
    if input_text is None:
        return
    
    # 테이블 변환
    table = convert_text_to_table(input_text)
    
    # 결과 출력 및 저장
    print("\n변환된 테이블:")
    print(table)
    save_output(table, output_file)

if __name__ == "__main__":
    main()