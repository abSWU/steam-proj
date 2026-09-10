import os
import psycopg2
from fastapi import FastAPI
from dotenv import load_dotenv

load_dotenv()


#connect db to api
conn = psycopg2.connect(
    database = os.getenv("DB_NAME"),
    user = os.getenv("DB_USER"),
    password = os.getenv("DB_PASSWORD"),
    host = os.getenv("DB_HOST"),
    port = os.getenv("DB_PORT")
)

cursor = conn.cursor() 

cursor.execute("SELECT * FROM languages")

data = cursor.fetchall()
for d in data:
    print(d)

conn.close()