import os
import psycopg2
from psycopg2.extras import RealDictCursor
from fastapi import FastAPI
from dotenv import load_dotenv

load_dotenv()


app = FastAPI()

def connect_db():
    #connect db to api
    conn = psycopg2.connect(
    database = os.getenv("DB_NAME"),
    user = os.getenv("DB_USER"),
    password = os.getenv("DB_PASSWORD"),
    host = os.getenv("DB_HOST"),
    port = os.getenv("DB_PORT"),
    cursor_factory=RealDictCursor #dictionary format
    )

    return conn 

def close_db(cursor, conn):
    cursor.close()
    conn.close()

#endpoint showing all games in our db
@app.get("/games")
def get_games(limit = 10):

    conn = connect_db()

    #our query
    cursor = conn.cursor() 
    cursor.execute(f"SELECT * FROM games LIMIT {limit}")
    games = cursor.fetchall()

    cursor.close()
    conn.close()

    return games

#return games by specific name
@app.get("/title")
def get_title(title = "", limit = 5):
    conn = connect_db()
    cursor = conn.cursor()

    cursor.execute("""
        SELECT *
        FROM games
        WHERE Title ILIKE %s
        LIMIT %s
        """, (f"%{title}%",limit))

    result = cursor.fetchall()
    close_db(cursor, conn)
    return result


#reutrn games made by a specific developer
@app.get("/developer")
def get_developer(dev = "", limit = 5):
    conn = connect_db()

    #query
    cursor = conn.cursor()
    cursor.execute(f"""
        SELECT games.*, developers.Developer 
        FROM games
            JOIN game_developers ON games.gameid = game_developers.gameid
            JOIN developers ON game_developers.devid = developers.devid
        WHERE developers.developer ILIKE %s
        LIMIT %s
        """, (f"%{dev}%", limit))
    result = cursor.fetchall()
    close_db(cursor, conn)
    return result


#return games based off language
@app.get("/language")
def get_language(language="", limit=5):
    conn = connect_db()
    cursor = conn.cursor()

    cursor.execute(""" 
    SELECT games.*, languages.language
    FROM games
        JOIN game_languages ON games.gameid = game_languages.gameid
        JOIN languages ON languages.langid = game_languages.langid
    WHERE languages.language ILIKE %s
    LIMIT %s;
    """, (f"%{language}",limit))

    result = cursor.fetchall()
    close_db(cursor, conn)
    return result
    