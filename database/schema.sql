--Table with all the data in it. Will split off into smaller tables 


/*
CREATE TABLE games_raw(
    Title TEXT NOT NULL,
    Price NUMERIC(10, 2), -- up to 10 digits on the left, 2 after decimal
    Release_Date TEXT,
    Link TEXT,
    Reviews TEXT,
    Developers TEXT,
    Languages TEXT,
    Tags TEXT,
    Game_Features TEXT
);


-- Now we make smaller tables that are subsets of the big table above
CREATE TABLE games(
    GameID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Title TEXT NOT NULL,
    Price NUMERIC(10,2),
    Release_Date TEXT,
    Link TEXT,
    Reviews TEXT
);

CREATE TABLE developers(
    DevID GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Developer TEXT NOT NULL UNIQUE
);

CREATE TABLE gameDevelopers(
    GameID INTEGER,
    DevID INTEGER,

    PRIMARY KEY (GameID, DevID), --A combination of game and developer cannot be repeated

    FOREIGN KEY (GameID)
        REFERENCES games(GameID),
    
    FOREIGN KEY (DevID)
        REFERENCES developer(DevID)

    --every dev id and game id must have a corresponding dev/game in their respective tables
);

CREATE TABLE languages( 
    LangID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    Language TEXT NOT NULL UNIQUE
); 

CREATE TABLE game_languages( 
    GameID INTEGER, 
    LangID INTEGER, 
    PRIMARY KEY (GameID, LangID), 
    --A combination of game and language cannot be repeated 
    FOREIGN KEY (GameID) REFERENCES games(GameID), 
    FOREIGN KEY (LangID) REFERENCES languages(LangID)
    --every lang id and game id must have a corresponding language/game in their respective tables );

CREATE TABLE tags(
    TagID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Tag TEXT NOT NULL UNIQUE
);

CREATE TABLE game_tags( 
    GameID INTEGER, 
    TagID INTEGER, 
    PRIMARY KEY (GameID, TagID), 
    --A combination of game and tags cannot be repeated 
    FOREIGN KEY (GameID) REFERENCES games(GameID), 
    FOREIGN KEY (TagID) REFERENCES tags(TagID) 
    --every tag id and game id must have a corresponding tag/game in their respective tables 
); 

CREATE TABLE features( 
    FeatureID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    Feature TEXT NOT NULL UNIQUE 
); 

CREATE TABLE game_features( 
    GameID INTEGER, 
    FeatureID INTEGER, 
    PRIMARY KEY (GameID, FeatureID), 
    --A combination of game and features cannot be repeated 
    FOREIGN KEY (GameID) REFERENCES games(GameID), 
    FOREIGN KEY (TagID) REFERENCES features(FeatureID) 
    --every feature id and game id must have a corresponding feature/game in their respective tables 
);
*/


SELECT *
FROM games_raw
LIMIT 10;



