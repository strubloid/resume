

## Configurations
```
npm install jest babel-jest @babel/preset-env @babel/preset-react react-test-renderer --save-dev
```
and
```
npm install jest-cli
```
## Creation of .babelrc
```
{
  "env": {
    "development": {
      "plugins": ["transform-es2015-modules-commonjs"]
    },
    "test": {
      "plugins": ["transform-es2015-modules-commonjs", "@babel/plugin-proposal-class-properties"],
      "presets": [
        "@babel/preset-react"
      ]
    }
  }
}
```
## .jshintrc
```
{
  "node": true,
  "browser": true,
  "esversion": 6
}
```

