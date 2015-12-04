# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

library(httr)
library(jsonlite)

dbpediaSpotlight <- function(text, apiURL = "dbpedia", saveResponse=FALSE, responseFileName="", verbose=TRUE) {
  if (apiURL == "dbpedia"){
    annotationURL = "http://spotlight.dbpedia.org/rest/annotate"
  } else if (apiURL == "sztaki"){
    annotationURL = "http://spotlight.sztaki.hu:2222/rest/annotate"
  } else { #assume that the user knows what they're doing and use whatever they provide
    annotationURL = apiURL
  }

  if (verbose){
    response = POST(url = annotationURL, body=list(text=text), encode="form", verbose())
  } else {
    response = POST(url = annotationURL, body=list(text=text), encode="form")
  }

  jsonText = rawToChar(response$content)

  if (saveResponse){
    if (responseFileName != ""){
      fileConn<-file(responseFileName)
      writeLines(jsonText, fileConn)
      close(fileConn)
    } else {
      warning("responseFileName needs to be specified if saveResponse=TRUE")
    }
  }

  jsonData = fromJSON(jsonText)
  df = as.data.frame(jsonData$Resources)
  colnames(df) = gsub("@", "", colnames(df))
  return(df)
}
