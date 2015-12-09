# DBpediaSpotlightR
Sends text to the [DBpedia Spotlight](https://github.com/dbpedia-spotlight/dbpedia-spotlight/wiki) API and returns results as a data frame

## Installation
```
library(devtools)
install_github("cbdavis/DBpediaSpotlightR")
```

## Usage
```
library(DBpediaSpotlightR)
text = "First documented in the 13th century, Berlin was the capital of the Kingdom of Prussia 
        (1701–1918), the German Empire (1871–1918), the Weimar Republic (1919–33) and the 
        Third Reich (1933–45). Berlin in the 1920s was the third largest municipality in the world. 
        After World War II, the city became divided into East Berlin -- the capital of 
        East Germany -- and West Berlin, a West German exclave surrounded by the Berlin Wall 
        from 1961–89. Following German reunification in 1990, the city regained its status 
        as the capital of Germany, hosting 147 foreign embassies."
df = dbpediaSpotlight(text)

# There are seven columns returned
# compare the entities found given parts of the original text
df[,c("URI", "surfaceForm")]
```
This will give you results like:

|URI | surfaceForm|
|----|------------|
|http://dbpedia.org/resource/Nazi_Germany | Third Reich|
|http://dbpedia.org/resource/Berlin | capital of East Germany|

## Similar projects
[Pyspotlight](https://github.com/ubergrape/pyspotlight) does the same in python and currently has more configuration options.
