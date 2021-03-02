FROM python:3.8.7

COPY requirements.txt .

RUN pip install --upgrade wheel pip && \
    pip install -r requirements.txt

ENTRYPOINT ["mlflow", "server"]
