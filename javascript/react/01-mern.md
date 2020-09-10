# Mern

## R Stands for React
* Its responsible for the client side
* This will be our frontend
* Validations in browser
* Will send requests for our backend (Node Express server)
> Note: react can't touch the backend

## N Stands for node, E stands for Express
* This is the server side
* We use Node for that
* we use the node express library for creation of the server
* we will be running all business logic there
* this will get a request from the react and responding back to it
* will return JSON to react(frontend)

## M Stands for MongoDb
* node express application send queries to the database server
* we never send any queries from the frontend, as its necessary to have database credentials, making this very easy to hack

## Frontend
### React SPA
* Routes (react-router-dom)
  *  Route Config + Page Components
* State Management (Hooks, Redux)
  * Redux Logic, React Hooks, Custom Hooks
* Components + Styling (Css)
  * Utility / UI Components

## Backend
### Decoupled Ends
* Backend == API
  * Both:
    * will be executed on a backend server
    * dont talk directly with the database
  * REST API
    * Combinations URLS + Http Verbs(= endpoints) for different actions
    * representational  State transfer
  * GraphQL API
    * One URL + Http verb (= one endpoint)
    * accept query commands

### Backend: Node + Express API
* Client -> Node/ Express -> Mongo Db
* Client can send
  * API Endpoints
    * POST /posts
    * GET /posts
    * GET /posts/:postId

# REST
* Uses a path + http method
* API is stateless and decoupled from any frontend, so you can create a mobile app for the application and will work perfectly
* It is a very common type of API
* It is also easy to document

## GET
Get a resource from the server

## POST
Post a resource to a server (Create or append resource)

## PUT
Create or override a resource

## PATCH
Update parts of an existent resource on the server

## DELETE
Delete a resource on the server

## OPTIONS
Determine whether follow-up request is allowed (sent automatically)
* This is attached automatically by the browser

# Graph QL
Client -> POST /graphql -> Has a body that contains the query that will be parsed by the node server
```
    {
        query {
            user {
                name
                age
            }
        }
    }
```
* query: that the operation that we  will be performing, its the graphql **key to identify** in this case it's a query
* user: its the **operation endpoint**, that is the place that our query will be asking for (ex: table user)
* name, age: those are the requested data from the **user endpoint**


# How we host?
* one computer with same domain (Node API + React SPA)
  * Node Express /api
  * Other requests will be redirecting to react App
  * Data is exchanged using JSON
* two separate servers
  * Node express handle the requests
  * React server handles the frontend and send request to the node express server


# commands
```
# unzip the compact thing

```
