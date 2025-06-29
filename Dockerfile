# Use Python base image
FROM python:3.10

# Install system dependencies for pandas, scikit-learn, uvicorn[standard]
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    libffi-dev \
    libpq-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy code
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Start the FastAPI app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
