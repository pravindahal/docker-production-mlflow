FROM python:3.8.5

COPY requirements.txt .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

ENTRYPOINT ["mlflow", "server"]
