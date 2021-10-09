library(jsonlite)
url <- 'https://codeforces.com/api/user.rating?handle=ExitCode'
document <- fromJSON(file=url, method='C')
yelp <- stream_in(file(url))
str(yelp)?
flat_yelp <- flatten(yelp)
str(flat_yelp)
yelp_tbl <- as.data.frame(flat_yelp)