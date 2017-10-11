import requests

url = 'http://128.199.224.160:3002'
username = 'danube'
s = requests.Session()
s.get(url)
count = 0
while True:
    count += 1
    if count % 10 == 0:
        print('Working on request {}'.format(count))
    r = s.post(url, data={'username': username})
    if 'ideal stats' in r.text.lower():
        print(r.text)
        print('Found ideal stats.')
        break
