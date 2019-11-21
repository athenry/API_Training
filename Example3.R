## testing  access to the Scopus API

## Install and load needed packages
## install.packages("tidyverse")
## install.packages("bibliometrix")
## install.packages("rscopus")
library(tidyverse)
library(bibliometrix)
library(rscopus)

## Set your API key
set_api_key("INSERT YOUR KEY HERE")

## Test that the key is in. If so, this function will return TRUE.
have_api_key()

## Try a search to see if your access works
UA_info <- get_affiliation_info(affil_name = "University of Alberta")

## Read in our list of authors
DFNAME <- read.csv("FILENAME.csv", header = TRUE)

## add in a column for the affiliatiomn
DFNAME$affiliation <- "alberta"

## Get the Scopus IDs of these authors
## for this function we need the API key as a variable
api_key = get_api_key()
NEWDF <- idByAuthor(DFNAME, api_key)

## Normally: replace any missing IDs
## For today's purposes, we will create our ID vector by omitting the missing IDs
id <- NEWDF$id[!is.na(NEWDF$id)]

## Download the bnibliographic collection for these authors
papers <- retrievalByAuthorID(id = id, api_key = api_key)
M <- papers$M

## We can now use the bibliometrix package to get a nice overview of this collection - see Report.Rmd



