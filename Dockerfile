FROM ubuntu:26.04

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl wget git build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://quarto.org/download/latest/quarto-linux-x86_64.deb -o quarto.deb && \
    dpkg -i quarto.deb && rm quarto.deb && quarto --version

RUN apt-get update && apt-get install -y \
    python3.11 python3.11-venv python3.11-dev python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["quarto", "render"]
