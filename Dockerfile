FROM python:3.6.2-stretch

ENV FLASK_APP=/app/hello.py

EXPOSE 5000

RUN mkdir /app

COPY requirements.txt /app

RUN pip install -r /app/requirements.txt

COPY . /app

CMD ["flask", "run", "--host=0.0.0.0"]
