# Use python runtime
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements.txt file to /app working directory
COPY requirements.txt /app

# Install all dependencies from requirements.txt
RUN pip3 install -r requirements.txt

# Copy the contents to the container
COPY . /app

# Define environment variable
ENV FLASK_APP=core/server.py

# Set DB
RUN export FLASK_APP=core/server.py
# RUN rm core/store.sqlite3
RUN flask db upgrade -d core/migrations/

# EXPOSE port 7755
EXPOSE 7755

# Run the shell script to start the server
CMD ["bash", "run.sh"]