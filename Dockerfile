FROM python:3.12
RUN pip install --upgrade pip

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV FLASK_ENV=production
ENV FLASK_APP=wsgi.py

EXPOSE 8001

RUN apt update && apt install -y curl

HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
CMD curl -f http://localhost:8001/health || exit 1

CMD ["gunicorn", "--bind", "0.0.0.0:8001", "wsgi:application"]
