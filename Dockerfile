FROM python:3.13
RUN pip install --upgrade pip

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

ENV FLASK_ENV=production
ENV FLASK_APP=wsgi.py

EXPOSE 5000

RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "wsgi:application"]