--Populate our subtables using info from raw table


/*
Populate games table:
INSERT INTO games (Title, Price, Release_Date, Link, Reviews)
SELECT Title, Price, Release_Date, Link, Reviews
FROM games_raw;
*/


/*
Populate developers table. Seperates comma separated values
INSERT INTO developers (Developer)
SELECT DISTINCT TRIM(developer)
FROM games_raw
CROSS JOIN LATERAL
    unnest(string_to_array(Developers, ',')) AS developer
WHERE Developers IS NOT NULL
  AND TRIM(developer) <> '';
*/

/*
Populate the junction table gameDev
INSERT INTO game_developers (GameID, DevID)
SELECT DISTINCT
   g.GameID,
   d.DevID
FROM games_raw gr
JOIN games g
    ON gr.link = g.Link
CROSS JOIN LATERAL
    unnest(string_to_array(gr.developers, ',')) AS dev_name
JOIN developers d
    ON d.developer = TRIM(dev_name)
WHERE gr.Developers IS NOT NULL;
*/

/*
Populates lang table
INSERT INTO languages (language)
SELECT DISTINCT TRIM(lang)
FROM games_raw 
CROSS JOIN LATERAL
    unnest(string_to_array(Languages, ',')) AS lang
WHERE Languages IS NOT NULL
  AND TRIM(lang) <> '';
*/


--Populate the junction table between games and lang
/* INSERT INTO game_languages (GameID, LangID)
SELECT DISTINCT
   g.GameID,
   l.LangID
FROM games_raw gr
JOIN games g
    ON gr.link = g.Link
CROSS JOIN LATERAL
    unnest(string_to_array(gr.languages, ',')) AS lang_name
JOIN languages l
    ON l.language = TRIM(lang_name)
WHERE gr.languages IS NOT NULL;
*/

/*
--Populates tag table
INSERT INTO tags (Tag)
SELECT DISTINCT TRIM(tag)
FROM games_raw 
CROSS JOIN LATERAL
    unnest(string_to_array(Tags, ',')) AS tag
WHERE Tags IS NOT NULL
  AND TRIM(tag) <> '';
*/

/*
--Populate the junction table between games and tags
INSERT INTO game_tags (GameID, TagID)
SELECT DISTINCT
   g.GameID,
   t.TagID
FROM games_raw gr
JOIN games g
    ON gr.link = g.Link
CROSS JOIN LATERAL
    unnest(string_to_array(gr.tags, ',')) AS tag_name
JOIN tags t
    ON t.tag = TRIM(tag_name)
WHERE gr.tags IS NOT NULL;
*/

/*
--Populates features table
INSERT INTO features (Feature)
SELECT DISTINCT TRIM(ft)
FROM games_raw 
CROSS JOIN LATERAL
    unnest(string_to_array(Game_Features, ',')) AS ft
WHERE Game_Features IS NOT NULL
  AND TRIM(ft) <> '';
*/


--Populate the junction table between games and features
/*
INSERT INTO game_features (GameID, FeatureID)
SELECT DISTINCT
   g.GameID,
   f.FeatureID
FROM games_raw gr
JOIN games g
    ON gr.link = g.Link
CROSS JOIN LATERAL
    unnest(string_to_array(gr.game_features, ',')) AS feat_name
JOIN features f
    ON f.feature = TRIM(feat_name)
WHERE gr.game_features IS NOT NULL;
*/

SELECT *
FROM game_features
LIMIT 10;
