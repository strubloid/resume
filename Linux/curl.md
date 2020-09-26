
# Curl commands

## how to catch the url redirects
```
curl -v -L https://www.did.ie/internet-tablets/where/tablets-operating-system/windows 2>&1 | egrep "^> (Host:|GET)"
```

## how to catch the redirects
```
curl -IL https://www.did.ie/internet-tablets/where/tablets-operating-system/windows
```