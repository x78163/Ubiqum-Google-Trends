library("devtools")
library("ggplot2")
library("gtrendsR")
library("rvest")

# Usage
# gtrends(keyword, geo = "", time = "today+5-y", gprop = c("web", "news",
#                                                          "images", "froogle", "youtube"), category = 0, hl = "en-US")
# Arguments

# keyword A character vector with the actual Google Trends query keywords. Multiple
# keywords are possible using gtrends(c("NHL","NBA", "MLB", "MLS")).



# geo A character vector denoting geographic regions for the query, default to “all” for
# global queries. Multiple regions are possible using gtrends("NHL", c("CA", "US")).

# time A string specifying the time span of the query. Possible values are:
#   "now 1-H" Last hour
# "now 4-H" Last four hours
# "now 1-d" Last day
# "now 7-d" Last seven days
# "today 1-m" Past 30 days
# "today 3-m" Past 90 days
# "today 12-m" Past 12 months
# "today+5-y" Last five years (default)
# "all" Since the beginning of Google Trends (2004)
# "Y-m-d Y-m-d" Time span between two dates (ex.: "2010-01-01 2010-04-03")

# gprop A character string defining the Google product for which the trend query if preformed.
# Valid options are:
#   • "web" (default)
# • "news"
# • "images"
# • "froogle"
# • "youtube"

# category A character denoting the category, defaults to “0”.

# hl A string specifying the ISO language code (ex.: “en-US” or “fr”). Default is
# “en-US”. Note that this is only influencing the data returned by related topics.

googleGeo = ""#leave empty for global
googleTime= "today 12-m"  #currently set 

singleTerm = c("Ubiqum")
multipleTerm = c("Ubiqum", "code academy", "machine learning") # up to 5 maximum search terms in one multiple term search

singleSearch1=gtrends(singleTerm, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")

Sys.sleep(sample(1:10, 1))

multipleSearch1=gtrends(multipleTerm, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")

Sys.sleep(sample(1:10, 1))

#------------Breakout Tables---------------------------

singleGeo1 = singleSearch1$interest_by_region
singleRelated1 =singleSearch1$related_queries
singleInterest1 = singleSearch1$interest_over_time


multipleGeo1 = multipleSearch1$interest_by_region
multipleRelated1 =multipleSearch1$related_queries
multipleInterest1 = multipleSearch1$interest_over_time

#------------Plots---------------------------
plot(singleSearch1)

plot(multipleSearch1)
