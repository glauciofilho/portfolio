FROM python:3.13
RUN pip install --upgrade pip

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

ENV FLASK_ENV=production
ENV FLASK_APP=wsgi.py

EXPOSE 8001

RUN apt-get update && apt-get install -y curl

HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
CMD curl -f http://localhost:8001/health || exit 1

CMD ["gunicorn", "--bind", "0.0.0.0:8001", "wsgi:app"]
