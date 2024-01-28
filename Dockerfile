FROM python:slim

WORKDIR /usr/src/app
RUN apt update && \
    apt upgrade && \
    apt install -y curl

COPY requirements.txt .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt 

COPY . .
EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
