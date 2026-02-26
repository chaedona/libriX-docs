import sys
import re

with open(sys.argv[1], 'r', encoding='utf-8') as f:
    lines = f.readlines()

result = []
in_code_block = False
buffer = []

def flush_buffer():
    if buffer:
        result.append(' '.join(l.rstrip('\n').rstrip() for l in buffer) + '\n')
        buffer.clear()

for line in lines:
    # 코드블록 토글
    if re.match(r'^\s*(`{3,}|~{3,})', line):
        flush_buffer()
        in_code_block = not in_code_block
        result.append(line)
        continue

    if in_code_block:
        result.append(line)
        continue

    # 빈 줄 → 문단 구분 유지
    if line.strip() == '':
        flush_buffer()
        result.append('\n')
        continue

    # 헤딩, 리스트, 표, 구분선은 단독 줄 유지
    if re.match(r'^(#{1,6} |[-*+] |\d+\. |[|]|---+|===+)', line):
        flush_buffer()
        result.append(line)
        continue

    # 일반 텍스트는 버퍼에 모아서 이어붙임
    buffer.append(line)

flush_buffer()

# 전처리된 내용을 .tmp 파일로 저장
with open(sys.argv[1] + '.tmp', 'w', encoding='utf-8') as f:
    f.writelines(result)
