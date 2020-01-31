# Parks API
## Epicodus Code Review 12
##### 1/31/2020
| Functionality | API Call |
| ------------- | -------- |
| Get a list of all the parks |`GET` `/parks/` |  
| Get a list of parks by state name |`GET` `/parks/?state={state_name}`|  
| Get a list of all national parks |`GET` `/parks/?national=true`|  
| Get a particular park by id |`GET` `/parks/{:id}`|  
| Get a particular park by park name |`GET` `/parks/?name={park name}`|
| Post a new park. National is optional (defaults to false) | `POST` `/parks/?name={park name}&state={state name}&national={true or false}` |
| Update a parks info. National is optional (defaults to false) | `PATCH` `/parks/{park id}/?name={park name}&state={state name}&national={true or false}` |
| Delete a park | `DELETE` `/parks/{park id}` |
