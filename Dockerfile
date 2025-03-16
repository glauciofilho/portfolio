FROM python:3.13
RUN pip install --upgrade pip

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

ENV FLASK_ENV=production

EXPOSE 5000

RUN apt-get update && apt-get install -y curl

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "wsgi:application"]