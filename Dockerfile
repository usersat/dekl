ENV TZ=Europe/Minsk
RUN apt-get update && apt-get install -y tzdata

FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "start.py"]
