FROM python:3.10-slim

WORKDIR /app

# Copy all files
COPY . .

# Install dependencies
RUN pip install fastapi uvicorn scikit-learn pandas numpy

# Run the FastAPI app
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]