# Jquery


## Show all Hidden Fields
```
$(document).ready(function() {
   $('div:hidden').each(function() {
      $(this).show();
      //Do your calculations on the children...
      $(this).hide();
   });
});
```