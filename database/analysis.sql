--Perform some queries to learn more about our data, and some queries for general curiousity

--What are some of the most expensive games on steam?
SELECT *
FROM games
WHERE Price IS NOT NULL
ORDER BY Price DESC;


SELECT *
FROM games
WHERE reviews IS NOT NULL;


--Find a game based on a specific tag
SELECT games.*, tags.tag
FROM games
    JOIN game_tags ON games.gameid = game_tags.gameid
    JOIN tags ON tags.tagid = game_tags.tagid
        AND tags.tag = 'Adventure'
LIMIT 5;



--Find a game with a specific feature
SELECT games.*, features.feature
FROM games
    JOIN game_features ON games.gameid = game_features.gameid
    JOIN features ON features.featureid = game_features.featureid
        --AND features.feature = 'Single-player'
WHERE features.feature = 'Single-player'
LIMIT 5;



--Find games based off language
SELECT games.*, languages.language
FROM games
    JOIN game_languages ON games.gameid = game_languages.gameid
    JOIN languages ON languages.langid = game_languages.langid
WHERE languages.language = 'Japanese'
LIMIT 5;



--Find games based off developer
SELECT games.*, developers.developer
FROM games
    JOIN game_developers ON games.gameid = game_developers.gameid
    JOIN developers ON game_developers.devid = developers.devid
WHERE developers.developer LIKE 'Valve'
LIMIT 5;