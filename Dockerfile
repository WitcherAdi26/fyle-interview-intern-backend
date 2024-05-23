FROM python:3.8

WORKDIR /

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV FLASK_APP=core/server.py
RUN rm core/store.sqlite3
RUN flask db upgrade -d core/migrations/

# Testing app before creating images
RUN pytest -vvv -s tests/ 

RUN rm core/store.sqlite3
RUN flask db upgrade -d core/migrations/

# For Coverage 
RUN pytest --cov=core /tests

RUN rm core/store.sqlite3
RUN flask db upgrade -d core/migrations/

EXPOSE 7755

CMD ["bash","run.sh"]