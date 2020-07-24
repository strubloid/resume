# Basic commands in NodeJS

# Create package.json
```
  npm init -y
```
> Will give the basic boilerplate basic **package.json**

# Adding dependencies
```
  npm i express nongoose ejs
```

# installing dev dependencies
```
npm i --save-dev nodemon
```
> This will allow us to automatically refresh our page

## extra configurations on package.json for the nodemon
```json
"scripts": {
    "devStart": "nodemon server.js"
  },
```
> note: you can see that must have the devStart inside of the scripts that you
will be running, so this will run like a cronjob for each second, and you
will see the changes on the fly

## To see that you must running
```
  npm run devStart
```


