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

|URI | surfaceForm|
|----|------------|
|http://dbpedia.org/resource/Document | documented|
|http://dbpedia.org/resource/19th_century | 13th century|
|http://dbpedia.org/resource/East_Berlin | Berlin|
|http://dbpedia.org/resource/Capital_city | capital|
|http://dbpedia.org/resource/Kingdom_of_Prussia | Kingdom of Prussia|
|http://dbpedia.org/resource/German_Empire | German Empire|
|http://dbpedia.org/resource/Weimar_Republic | Weimar Republic|
|http://dbpedia.org/resource/Nazi_Germany | Third Reich|
|http://dbpedia.org/resource/1920s | 1920s|
|http://dbpedia.org/resource/Municipality | municipality|
|http://dbpedia.org/resource/World_War_II | World War II|
|http://dbpedia.org/resource/City | city|
|http://dbpedia.org/resource/Division_%28mathematics%29 | divided|
|http://dbpedia.org/resource/East_Berlin | East Berlin|
|http://dbpedia.org/resource/Berlin | capital of East Germany|
|http://dbpedia.org/resource/West_Berlin | West Berlin|
|http://dbpedia.org/resource/West_Germany | West German|
|http://dbpedia.org/resource/Enclave_and_exclave | exclave|
|http://dbpedia.org/resource/Berlin_Wall | Berlin Wall|
|http://dbpedia.org/resource/German_reunification | German reunification|
|http://dbpedia.org/resource/City | city|
|http://dbpedia.org/resource/Status_quo | status|
|http://dbpedia.org/resource/Foreign_policy | foreign|
|http://dbpedia.org/resource/Diplomatic_mission | embassies|
