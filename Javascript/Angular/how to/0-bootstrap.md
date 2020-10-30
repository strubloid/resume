# how to install bootstrap into an angular project?
## Command line
```
npm install ---save bootstrap
```

## Adding the bootstrap
You must modify the angular.json file as this configure the cli project, so it is necessary to add a new style to be loaded at the beginning of the app, you must change under projects -> "name of your project" -> architect -> build -> options -> styles:
```
"styles": [
  "node_modules/bootstrap/dist/css/bootstrap.min.css",
  "src/styles.css"
],
```
> this will load the bootstrap minified file first, and after will run the main style.css


