--Table with all the data in it. Will split off into smaller tables 



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

/*
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

CREATE TABLE tags(
    TagID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Tag
)
*/
