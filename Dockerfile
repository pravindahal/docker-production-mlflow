FROM python:3.8.7

COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade wheel pip && \
    pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["mlflow", "server"]
