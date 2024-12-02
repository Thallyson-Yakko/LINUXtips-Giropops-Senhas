FROM python:3.11-slim


WORKDIR  /app

COPY . ./

RUN apt-get update  && pip install --upgrade pip 

RUN apt-get install -y redis-server curl  && pip install --no-cache-dir -r requirements.txt

ENV REDIS_HOST=redis-service

EXPOSE 6379

EXPOSE 5000

VOLUME /app/giropops-senhas

CMD ["flask", "run", "--host=0.0.0.0"]