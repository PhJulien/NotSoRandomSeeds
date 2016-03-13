import json, requests, re, sys

url = 'https://api.stackexchange.com/2.2/search/advanced'



#########
######### R
#########


params = dict(
    pagesize='100',
    order='desc',
    sort='creation',
    q='set.seed',
	tagged='r',
	filter='!9YdnSJ*_S',
	site='stackoverflow',
    page=1
)




seeds = []
processed_ids = []
cur = 1
max_queries = 100
goon = True

while goon:
    print >> sys.stderr, "Retrieving page " + str(cur)
    params["page"] = cur
    resp = requests.get(url=url, params=params)
    data = json.loads(resp.text)    
    for d in data['items']:
        id = d["question_id"]
        if not id in processed_ids:
            processed_ids.append(id)
            last_date = d["creation_date"]
            body = d["body"]
            ret = re.search("set\.seed\((\d+)\)", body)
            if ret != None:
                g = ret.group(0)
                g = g.replace("set.seed(", "").replace(")", "")
                seeds.append(int(g)) 
    if not data["has_more"]:
        goon = False
        print >> sys.stderr, "No more hits. Exiting."
    if data["quota_remaining"] < 1:
        goon = False
        print >> sys.stderr, "Quota exceeded. Exiting."
    if cur == max_queries:
        goon = False
        print >> sys.stderr, "Maximum queries threshold reached. Exiting."
    cur += 1
    

file = open("/Users/pjulien/Dropbox/Code/Seeds.20.01.2015.R.txt", "w")
for s in seeds:
    file.write(str(s) + "\n")
file.close()




##########
########## Python
##########



params = dict(
    pagesize='100',
    order='desc',
    sort='creation',
    q='seed',
	tagged='python',
	filter='!9YdnSJ*_S',
	site='stackoverflow',
    page=1
)




seeds = []
processed_ids = []
cur = 1
max_queries = 100
goon = True

while goon:
    print >> sys.stderr, "Retrieving page " + str(cur)
    params["page"] = cur
    resp = requests.get(url=url, params=params)
    data = json.loads(resp.text)    
    for d in data['items']:
        id = d["question_id"]
        if not id in processed_ids:
            processed_ids.append(id)
            last_date = d["creation_date"]
            body = d["body"]
            ret = re.search("seed\((\d+)\)", body)
            if ret != None:
                g = ret.group(0)
                g = g.replace("seed(", "").replace(")", "")
                seeds.append(int(g)) 
    if not data["has_more"]:
        goon = False
        print >> sys.stderr, "No more hits. Exiting."
    if data["quota_remaining"] < 1:
        goon = False
        print >> sys.stderr, "Quota exceeded. Exiting."
    if cur == max_queries:
        goon = False
        print >> sys.stderr, "Maximum queries threshold reached. Exiting."
    cur += 1
    

file = open("/Users/pjulien/Dropbox/Code/Seeds.20.01.2015.Python.txt", "w")
for s in seeds:
    file.write(str(s) + "\n")
file.close()
