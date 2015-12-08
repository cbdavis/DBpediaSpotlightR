# Some useful keyboard shortcuts for package authoring:
#
#   Build documentation        devtools::document()
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

library(httr)
library(jsonlite)

#' Download annotations from the DBpedia Spotlight service
#'
#' @param text The text to be processed.  Character vectors are currently not supported
#' @param apiURL The URL of the API service.  By default, the official DBpedia Spotlight API will be used.  If \code{"sztaki"} is set, then the one hosted by sztaki.hu will be used.  A custom URL can be specified as well.
#' @param responseFileName If specified, this will be the file where the json response is saved, otherwise only the data frame will be returned by this function.  This file will contain the results of the analysis along with a record of the original text to be parsed.
#' @param verbose Whether curl should be verbose when sending and retrieving the data from the API
#' @return A data frame containing information related to the entities extracted from the text.
#' @examples
#' library(DBpediaSpotlightR)
#' dbpediaSpotlight("Berlin was the capital of the Kingdom of Prussia")
#' dbpediaSpotlight("Berlin was the capital of the Kingdom of Prussia", apiURL="sztaki")
#' dbpediaSpotlight("Berlin was the capital of the Kingdom of Prussia",
#'                  apiURL="sztaki",
#'                  responseFileName="Berlin.json")
#' @export
dbpediaSpotlight <- function(text, apiURL = "dbpedia", responseFileName="", verbose=TRUE) {
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

  if (responseFileName != ""){
    fileConn<-file(responseFileName)
    writeLines(jsonText, fileConn)
    close(fileConn)
  }

  jsonData = fromJSON(jsonText)
  df = as.data.frame(jsonData$Resources)
  colnames(df) = gsub("@", "", colnames(df))
  return(df)
}
