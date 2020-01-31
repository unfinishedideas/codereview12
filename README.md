# Parks API
## Epicodus Code Review 12
##### 1/31/2020

## Purpose
This API stores and recalls information on state and national parks across the USA.

## Installation
* Install Ruby 2.5.7 on your machine
* Install SQL 12.1 with Postgres on your machine
* Clone the git repository at _https://github.com/unfinishedideas/codereview10.git_
* Navigate to folder and run Bundle install from terminal
* In terminal navigate to the folder and run `rake db:create` to create the database
* Next run `rake db:migrate` to get the tables created
* Optionally run `rake db:seed` to generate a series of random parks
* Finally `rails s` to start the server. You should now be able to make API calls from localhost:3000 (ie: `localhost:3000/parks`)

## End Points
| Functionality | API Call |
| ------------- | -------- |
| Get a list of all the parks |`GET` `/parks/` |  
| Get a list of parks by state name |`GET` `/parks/?state={state_name}`|  
| Get a list of all national parks |`GET` `/parks/?national=true`|  
| Get a particular park by id |`GET` `/parks/{:id}`|  
| Get a particular park by park name |`GET` `/parks/?name={park name}`|
| Get a random park | `GET` `/parks/?random=true` |
| Post a new park. National is optional (defaults to false) | `POST` `/parks/?name={park name}&state={state name}&national={true or false}` |
| Update a parks info. National is optional (defaults to false) | `PATCH` `/parks/{park id}/?name={park name}&state={state name}&national={true or false}` |
| Delete a park | `DELETE` `/parks/{park id}` |

## Known Bugs
* None at present

## Technologies Used
**Rails 5.2.4.1**  
_for project creation, API functionality_

**Ruby 2.5.7**  
_for back-end business logic and functionality_

**SQL Postrgres (12.1)**  
_for database management_

## Support and contact
If you have any issues viewing this site or any general questions about it please email me at
_PeteTheBeatWells@gmail.com_
