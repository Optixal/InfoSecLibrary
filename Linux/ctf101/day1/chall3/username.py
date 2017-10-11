import requests

url = 'http://128.199.224.160:3002'
f = open('randomnames.txt', 'r')
s = requests.Session()
s.get(url)
for line in f:
    line = line.strip()
    r = s.post(url, data={'username': line})
    if 'ideal name' in r.text.lower():
        print('Found ideal username {}'.format(line))
        break
f.close()
