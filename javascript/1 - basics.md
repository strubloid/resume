
# how to load js only for mobile

```

// only for mobile
if(($j(window).width() < 768 && $j(window).height() < 1024 ) || ($j(window).width() < 1024 && $j(window).height() < 768 ))
{

    alert('mobile');

}
```