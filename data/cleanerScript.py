#A script for cleaning the data for the steam project
import pandas as pd
import ast

#load data, and drop duplicates/unnamed games
df = pd.read_csv("gameDataUnfiltered.csv")
df.head()
df = df.drop_duplicates()
df = df.dropna(subset="Title")

#Pick the columns that I want to keep
df = df[[
    "Title",
    "Original Price",
    "Release Date",
    "Link",
    "All Reviews Number",
    "Developer",
    "Supported Languages",
    "Popular Tags",
    "Game Features"
    ]]

#Get rid of the dollar sign in the price column, and convert Free -> 0.00
df["Original Price"] = df["Original Price"].str.replace("$", "", regex=False)
df["Original Price"] = df["Original Price"].replace("Free", "0.00")
df["Original Price"] = pd.to_numeric(df["Original Price"], errors="coerce")

#In the columns below, they are originally stored as a string formated like "[x, y, z]"
#We will turn this format of "[x, y, z]" into "x, y, z", which will help with normalization later

df["Supported Languages"] = df["Supported Languages"].apply(ast.literal_eval)
df["Supported Languages"] = df["Supported Languages"].apply(
    lambda x: ", ".join(x)
)

df["Popular Tags"] = df["Popular Tags"].apply(ast.literal_eval)
df["Popular Tags"] = df["Popular Tags"].apply(
    lambda x: ", ".join(x)
)

df["Game Features"] = df["Game Features"].apply(ast.literal_eval)
df["Game Features"] = df["Game Features"].apply(
    lambda x: ", ".join(x)
)

df.to_csv("cleanedData.csv", index=False)