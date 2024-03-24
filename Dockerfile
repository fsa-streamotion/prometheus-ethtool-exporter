FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN apt update \
    && apt install -y --no-install-recommends ethtool \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 9417

USER 1000

CMD [ "python", "./ethtool-exporter.py", "-L", "0.0.0.0", "-p", "9417" ]
