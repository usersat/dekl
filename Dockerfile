FROM python:3.11-slim

# Устанавливаем временную зону
ENV TZ=Europe/Minsk

# Устанавливаем tzdata для правильного времени
RUN apt-get update && \
    apt-get install -y tzdata && \
    rm -rf /var/lib/apt/lists/*

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы проекта
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Запускаем скрипт
CMD ["python", "start.py"]
