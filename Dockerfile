FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

WORKDIR /app
COPY . /app

RUN pip install --upgrade pip
RUN pip install playwright
RUN pip install -r requirements.txt
RUN python -m playwright install chromium


CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "7860"]
