# Start with a Python 3 base image
FROM python:3

# Set the working directory in the container
WORKDIR /app

# Install Flask and Redis libraries
RUN pip install Flask redis

# Copy the web application into the container
COPY . /app

# Set the "FLASK_APP" environment variable to the name of your application file
ENV FLASK_APP=app.py

# Expose port 5000 for the web service
EXPOSE 5000

# Define a command that starts the Flask application server
CMD ["flask", "run", "--host=0.0.0.0"]
