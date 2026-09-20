
FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    gcc \
    curl \
    default-libmysqlclient-dev \
    pkg-config

COPY requirements.txt .

RUN pip install --no-cache-dir mysqlclient -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
