import re
import os

def format_sql(sql):
    # 1. 주석 형식 변경
    sql = re.sub(r'/\*\s?([a-zA-Z0-9_ㄱ-힣\s]+)\s?\*/', r'\n/* \1 */\n', sql)

    # 2. SELECT, INSERT, DELETE, UPDATE를 줄 시작에 배치 (서브쿼리 제외)
    sql = re.sub(r'(?<!\w)(SELECT|INSERT|DELETE|UPDATE)(?!\w)', r'\n\1', sql)

    # 3. FROM, WHERE, AND, ORDER BY, GROUP BY 정렬
    main_clauses = r'(FROM|WHERE|AND|ORDER BY|GROUP BY)'
    sql = re.sub(f'({main_clauses})', r'\n    \1', sql)

    # 4. 콤마 정렬
    sql = re.sub(r',\s*', r',\n    ', sql)

    # 5. 서브쿼리 처리 (150자 이상일 경우)
    def format_subquery(match):
        subquery = match.group(1)
        if len(subquery) > 150:
            subquery = format_sql(subquery)  # 재귀적으로 서브쿼리 포맷팅
            subquery = re.sub(r'\n', r'\n    ', subquery)  # 들여쓰기 추가
        return f'({subquery})'

    sql = re.sub(r'\((SELECT[^()]+)\)', format_subquery, sql)

    # 줄바꿈 및 공백 정리
    sql = re.sub(r'\s+', ' ', sql).strip()  
    sql = re.sub(r'\s*\n\s*', '\n', sql)

    return sql

def modify_sql(input_file, output_file):
    # 파일 읽기
    with open(input_file, 'r', encoding='utf-8') as file:
        content = file.read()

    # 정규식 패턴과 대체 문자열
    patterns = [
        (r'/\*\s?([a-zA-Z0-9_ㄱ-힣\s]+)\*/', r'\n/* \1 */\n'),
        (r'\s?(SELECT|INSERT|DELETE|UPDATE)\s', r'\n\1 '),
        (r',', r'\n     , '),
        (r'\s(FROM)\s', r'\n  \1 '),
        (r'\s(INNER JOIN)\s', r'\n \1\n       '),
        (r'\s(LEFT OUTER JOIN)\s', r'\n  \1\n       '),
        (r'\s(RIGHT OUTER JOIN)\s', r'\n \1\n       '),
        (r'\s(ON)\s', r'\n    \1 '),
        (r'\s(AND)\s', r'\n   \1 '),
        (r'(\sWHERE\s|\sORDER\s|\sGROUP\s)', r'\n\1'),
        (r'(\sBY\s)', r'\1\n       '),
        (r'\r?\n([^\s,/])', r'\1'),  # 수정된 7번 패턴
        (r'\r?\n[\s]*$', r''),  # 8번 패턴: 줄 끝의 공백 제거
        (r',\s\s', r', ')
    ]

    # 각 패턴을 순서대로 적용
    for pattern, replacement in patterns:
        content = re.sub(pattern, replacement, content, flags=re.MULTILINE | re.IGNORECASE)

    # 쿼리문 분리 및 구분선 추가
    queries = content.split('{')
    formatted_queries = []
    for query in queries:
        if query.strip():  # 빈 쿼리 제외
            formatted_queries.append(query.strip() + ';\n' + '-' * 50 + '\n{')

    # 수정된 내용을 파일에 쓰기
    with open(output_file, 'w', encoding='utf-8') as file:
        file.write('\n'.join(formatted_queries))

    print(f"SQL 문이 수정되어 {output_file}에 저장되었습니다.")

# 파일 경로 설정
script_dir = os.path.dirname(os.path.abspath(__file__))
input_file = os.path.join('D:/workspace/git_project/yawooch/projects/python/input_sql.log')
output_file = os.path.join('D:/workspace/git_project/yawooch/projects/python/modified_sql.sql')

# 파일 존재 여부 확인
if os.path.exists(input_file):
    modify_sql(input_file, output_file)
else:
    print(f"오류: {input_file} 파일을 찾을 수 없습니다.")
    print("현재 작업 디렉토리:", script_dir)
