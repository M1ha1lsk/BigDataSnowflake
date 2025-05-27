import os
import psycopg2
import csv

conn = psycopg2.connect(
    dbname="labdb",
    user="user",
    password="password",
    host="postgres", 
    port="5432"
)
cur = conn.cursor()

csv_folder = "/data"
for file in sorted(os.listdir(csv_folder)):
    if file.endswith(".csv"):
        path = os.path.join(csv_folder, file)
        print(f"Импорт {file}...")
        with open(path, encoding="utf-8") as f:
            next(f)
            cur.copy_expert("COPY mock_data FROM STDIN WITH CSV DELIMITER ',' QUOTE '\"'",f)
conn.commit()
cur.close()
conn.close()
