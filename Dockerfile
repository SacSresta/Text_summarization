FROM python:3.8-slim-buster

# Install build dependencies
RUN apt-get update && \
    apt-get install -y gcc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Create a virtual environment
RUN python3 -m venv /app/venv

# Activate the virtual environment and install dependencies
COPY . /app
RUN . /app/venv/bin/activate && \
    pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir --upgrade accelerate && \
    pip uninstall -y transformers accelerate && \
    pip install --no-cache-dir transformers accelerate

# Set the virtual environment as the default for CMD
ENV VIRTUAL_ENV=/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

CMD ["python3", "app.py"]
