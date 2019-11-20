## testing  access to the Scopus API

## Step one: install needed packages
library(tidyverse)
library(bibliometrix)
library(rscopus)

## Step two: Set your API key
set_api_key("875146d79ec70b39b9fcbc099b07e321")

##test that it exists. If so, this function will return TRUE.
have_api_key()

## Step three: try a search to see if your access works
UA_info <- get_affiliation_info(affil_name = "University of Alberta")

## Read in our list of authors
mecenames <- read.csv("mecenames.csv", header = TRUE)

## add in a column for the affiliatiomn
mecenames$affiliation <- "alberta"

## Get the Scopus IDs of these authors
## for this function we need the API key as a variable
api_key = get_api_key()
mece_authors <- idByAuthor(mecenames, api_key)

## Normally: replace any missing IDs
## For today's purposes, we will create our ID vector by omitting the missing IDs
id <- mece_authors$id[!is.na(mece_authors$id)]

## Download the bnibliographic collection for these authors
papers <- retrievalByAuthorID(id = id, remove.duplicated = TRUE, country = FALSE)
