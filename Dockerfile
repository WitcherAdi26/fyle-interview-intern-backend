FROM python:3.8

# Specifying working directory
WORKDIR /

COPY requirements.txt .

# install pre-requisites
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# For Testing apis and collecting Coverage Reports 
ENV FLASK_APP=core/server.py
RUN rm core/store.sqlite3
RUN flask db upgrade -d core/migrations/

# For testing and coverage reports 
RUN pytest --cov=core /tests

RUN rm core/store.sqlite3
RUN flask db upgrade -d core/migrations/

# app ready to use

# app will be listening on port 7755
EXPOSE 7755

# entry point
CMD ["bash","run.sh"]