# Dockerfile

FROM python:3.9-slim-bookworm

# Install build dependencies for PyMySQL and basic utilities
RUN apt-get update && apt-get install -y --no-install-recommends gcc pkg-config default-libmysqlclient-dev wget bash && rm -rf /var/lib/apt/lists/*

# Download wait-for-it.sh directly inside the container during build
# This avoids any host OS permission issues
RUN wget -O /usr/local/bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh \
    && chmod +x /usr/local/bin/wait-for-it.sh

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose the port Flask runs on
EXPOSE 5000

# Command to run the Flask app (managed by entrypoint in docker-compose.yml)
CMD ["python", "app.py"]