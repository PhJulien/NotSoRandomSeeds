library(RCurl)
#require(RJSONIO)    
# library(jsonlite)
library(rjson)

https://api.stackexchange.com/docs/advanced-search#pagesize=100&order=desc&sort=creation&q=set.seed&tagged=r&filter=default&site=stackoverflow



#url <- "https://api.stackexchange.com/docs/advanced-search#pagesize=100&order=desc&sort=creation&q=set.seed&tagged=r&filter=default&site=stackoverflow"

url <- "https://api.stackexchange.com/2.2/search/advanced?pagesize=100&order=desc&sort=creation&q=set.seed&tagged=r&filter=default&site=stackoverflow"

content <- getURL(url)
f <- fromJSON(url, method='C')


#### In python

import json, requests

url = 'https://api.stackexchange.com/2.2/search/advanced'

params = dict(
    pagesize='100',
    order='desc',
    sort='creation',
    q='set.seed',
	tagged='r',
	filter='default',
	site='stackoverflow'
)

resp = requests.get(url=url, params=params)
data = json.loads(resp.text)



