FROM python:alpine

WORKDIR /app

COPY . /app

RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 9417

USER 1000

CMD ["python3", "/ethtool-exporter.py", "-l", "0.0.0.0:9417"]
