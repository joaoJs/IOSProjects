# MVC

MVC stands for Model View Controller. It is a design pattern that allows us to separate code based on its role. 

View --> The UI. That's the part that the user interacts with. In a basic app it can be the UI elements that are displayed to the user (ex. an UITableViewCell)

Controller  --> it is a layer between the view and the model. Usually that is where we have the business logic. The input comes from the view and is used as a data to either alter the models or to alter information on the UI.

Model --> Model represents an entity that is used in order to store data. It can be an user for example. It will store state and behavior for the User type. Generally for each Model we have a table in a database. One of the techniques used to facilitate this relationship is ORM (Object Relational Mapping).


## Advantages: 
MVC is easy to understand and reason about, since each layer (tier) has a very clear purpose. It helps us organize the project, specially by having a folder for the Views, one for the Controllers and onde for the Models.

Separation of concerns.

MVC architecture helps us to develop more loosely coupled systems.

## Disadantages:
Controller can grow bigger as the app grows, thus creating a code that is "hard-to-maintain". The more views are added, the more logic will be added to the Main View Controller making the code in the controller long, unreadable and very hard to maintain.

As the controller grows, it also stops following the Single Responsibility Principle. 

## Example 

https://github.com/joaoJs/IOSProjects/tree/master/FizzBuzz/Programmatic/Programmatic

## Author 

Joao Campos
