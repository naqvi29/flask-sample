# Use official lightweight Python image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port that Flask runs on
EXPOSE 5001

# Run the application using gunicorn (better for production)
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5001", "app:app"]
