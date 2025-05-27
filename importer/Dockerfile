FROM python:3.11
WORKDIR /app
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh
COPY import.py .
RUN pip install psycopg2
CMD ["/wait-for-it.sh", "postgres:5432", "--", "python", "import.py"]

