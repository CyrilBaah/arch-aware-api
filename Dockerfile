
FROM python:3.11-alpine

WORKDIR /app

# Only copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy only necessary files (use .dockerignore to exclude unnecessary files)
COPY . .

EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
