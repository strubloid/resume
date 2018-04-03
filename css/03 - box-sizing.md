

## How to fix the issue with width 33.33%
```
* {
    box-sizing: border-box
}
```
 
## box-sizing: border-box

1. Any padding will be ignored
2. Any border will be ignored
3. the width will ignore the padding and border

```
a {
    width: 200px
    padding: 10px;
    border: 10px
}
```
* we have for all our elements the border-box, so it is being added the padding and the botder to the element width
the width for any 'a' will be 200px always!
