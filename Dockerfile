FROM python:3.8

COPY . .

RUN pip install -r requirements.txt

RUN export FLASK_APP=core/server.py
RUN rm core/store.sqlite3
RUN flask db upgrade -d core/migrations/

RUN pytest -vvv -s tests/

RUN pytest --cov

CMD ["python","./core/server.py"]

# CMD ["flask","run","--host=0.0.0.0","--port=4000"]