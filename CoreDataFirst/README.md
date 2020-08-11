# RSS Project

Project that uses apple's RSS Generator to fetch movies and display in a collection view. Like an app such as Spotify, user needs to be able to favorite albums.

The project requires use of core data for persistence and MVVM architecture. Even though I configured the Data Model, I was not able to satisty all requirements. Besides that, the app works. 

One of the most difficult tasks was sending data from the detail view to the main collection view controller. I used a closure for that. Every time the user favorites an album in the detail view, it executes the closure that alters the heart icon in the cell and reloads the collection view. 

## after update

Now the app reads from the core data. The favorite status is persisted. 