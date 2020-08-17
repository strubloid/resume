#HTTP verbs
> Where possible, API v3 strives to use appropriate HTTP verbs for each action.

| Verb	| Description  |
| ----- | ------------ | 
|HEAD	|Can be issued against any resource to get just the HTTP header info.|
|GET	|Used for retrieving resources.|
|POST	|Used for creating resources.|
|PATCH	|Used for updating resources with partial JSON data. For instance, an Issue resource has title and body attributes. A PATCH request may accept one or more of the attributes to update the resource. PATCH is a relatively new and uncommon HTTP verb, so resource endpoints also accept POST requests.|
|PUT	|Used for replacing resources or collections. For PUT requests with no body attribute, be sure to set the Content-Length header to zero.|
|DELETE	|Used for deleting resources.|
