app_key=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbF9hZGRyZXNzIjoiY21od2FuZzkyNjE3QGdtYWlsLmNvbSIsImlzcyI6IkFQUyBPQXV0aDIgQXV0aGVudGljYXRvciIsImlhdCI6MTY5OTYwNTE4NiwibmJmIjoxNjk5NjA1MTg2LCJleHAiOjE4NTcyODUxODYsInVpZCI6ImNtaHdhbmciLCJ0b2tlbkNyZWF0b3IiOiJjbWh3YW5nIn0.mg3qEFw8tByTTbxO4J7T4KdbEBD48SbrpYbJZ48Mq3E

base_url="https://ladsweb.modaps.eosdis.nasa.gov/archive/allData/465"
dst="/Users/cheyennehwang/Developer/GitHub/gq-notebook-containers/ndvi"

sensors=(
    N07_AVH13C1
    N09_AVH13C1
    N11_AVH13C1
    N14_AVH13C1
    N16_AVH13C1
    N18_AVH13C1
    N19_AVH13C1
)

for s in "${sensors[@]}"; do
    src=${base_url}/$s
    echo $src
    wget -e robots=off -m -np -R .html,.tmp -nH --cut-dirs=2 ${src} --header "Authorization: Bearer ${app_key}" -P ${dst}
done