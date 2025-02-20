# 기본 이미지로 Python 3.11 선택
FROM python:3.11-slim

# 작업 디렉토리 설정
WORKDIR /app

# 환경 변수 설정
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# 시스템 패키지 설치
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# 의존성 파일 복사 및 설치
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 프로젝트 파일 복사
COPY . .

# 포트 설정
EXPOSE 8000

# 실행 명령어
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
