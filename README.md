# User API Documentation
<p align="center">
	<img src="public/RESTAPI-Banner-1.jpg">  
</p>

<h3> About </h3>
<p>
	CRUD users in the database and check their authentication
<p>
	
This application uses the next gems:
* [Bcrypt](https://rubygems.org/gems/bcrypt)
* [JWT](https://rubygems.org/gems/jwt)

Install gems with `bundle install`

### Usage
You can call HTTP requests in the API to serve JSON resources to an API client or client-side framework.
<br>
	
* User routes: 

| Verb | URI | Description |
|---|---|---|
| `GET` | /v1/users | Returns all the users. |
| `POST` |  /v1/users | Creates an user. |
| `GET` |  /v1/users/:id | Returns a specific user. |
| `PUT`| /v1/users/:id | Updates an user. |
| `DELETE`| /v1/users/:id | Deletes an user. |

<br>
	
* Password route:


| Verb | URI | Description |
|---|---|---|
| `PUT` | /v1/users/:user_id/passwords/:id | Updates an user password. |

<br>
	
* JWT Token
<p>The routes of update and delete for both user and password are protected with JWT Tokens. The HTTP request has to have a header with the "auth_token" in it for checking user permission.</p>

<br><br>

You can clone this app:


```
git clone git@github.com:gessicahug/user-api-app.git
```
```
cd user-api-app
```
```
bundle install
```
```
rails db:create db:migrate
```
```
rails server
```

How to test the app: 


```
rails test
```

