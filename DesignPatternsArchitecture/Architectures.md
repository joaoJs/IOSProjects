# Architectures

When starting a new project or feature, one should spend some time thinking to the architectural pattern to use. With a good analysis, it is possible to avoid spending days on refactoring because of a messy codebase.

## MVC

This pattern divides an interactive application in to 3 parts.

model — contains the core functionality and data

view — displays the information to the user (more than one view may be defined)

controller — handles the input from the user


This is done to separate internal representations of information from the ways information is presented to, and accepted from, the user. It decouples components and allows efficient code reuse.
Usage
Architecture for World Wide Web applications in major programming languages.
Web frameworks such as Django and Rails.

Some of the disadvantages of the MVC pattern are: It contributes to having a Massive View Controller and Lack of incremental benefit – UI applications are already factored into components, and achieve code reuse and independence via the component architecture, leaving no incremental benefit to MVC.

## MVP

It’s one of the first alternatives to MVC and is a good attempt to decouple the Controller and the View.

With MVP you have a new layer called Presenter which contains the business logic. The View—your UIViewController and any UIKit components—is a dumb object, which is updated by the Presenter and has the responsibility to notify the Presenter when an UI event is fired. Since the Presenter doesn’t have any UIKit references, it is very easy to test.


## MVVM

MVVM stands for Model View View Model.

Model -> Represents the data to be modeled. 

View -> Display the visual elements and controls on the screen. They are typically subclasses of UIView.

View Model -> Layer with the business logic that transform model information into values that can be displayed on a view. 


This model is useful because it reduces the roles for the view controller. Logic that transform mondel into a representation for a view will be placed here. For example, you can use a view model to transform a Date into a date-formatted String, a Decimal into a currency-formatted String, or many other useful transformations. In MVC, this "model-to-view" logic would be placed in the view controller. And since view controllers are already doing a lot, this helps avoid the "massive view controller" issue. These are some of the main tasks for the view controller: handling viewDidLoad and other view lifecycle events; handling view callbacks via IBActions.

MVVM also uses the UI binding. UI Binding is a bridge between the View and ViewModel—mono or bidirectional—and lets communicate these two layers in a completely transparent way.

There are libraries that help implementing this data binding. 

RxSwift: This is the Swift version of the family ReactiveX. It allows you to write functional reactive programming (FRP) and thanks to the internal library RxCocoa you are able to bind View and ViewModel easily.

MVVM is a good choice for being powerful, scalable and not so complex.  However, this pattern it lacks the routing management.
A new layer - Coordinator - is needed to get the power of MVVM and routing in the same patterns. It becomes: Model-View-ViewModel-Coordinator (MVVM-C)

## MVVM-C

Model-View-ViewModel-Coordinator

This is like the MVVM but with an extra layer called coordinator. The coordinator is responsible for injecting dependencies to the View and View Model. This action is called Dependency Injection. The DIs are configured in the start() method and, the coordinator needs to be the entry point of the application since it is responsible for adding the dependencies. Dependency Injection also makes testing the view and view model easier, since you can inject mock of the dependencies from the test as well.
 In order for a class to be a Coordinator, it needs to cater to the Coordinator protocol. 


## VIPER

View, Interactor, Presenter, Entity, Routing

Very good example to showcase saparation of concerns. However can get unecessarily complex. 

The five layers are: 

View -> is the user interface.

Interactor -> layer between the presenter and the data. It takes direction from the presenter.

Presenter -> directs data between the view and interactor, taking user actions and calling to router to move the user between views.

Entity -> Model -> represents application data.

Router -> handles navigation between screens.

## Flux

View -> User interface.

Action -> User interaction with the app results in Actions. 

Dispatcher -> Actions are sent to the dispatcher where payload is handled in order to change state.

Store -> Keeps the state of the app. It broadcasts changes to the UIView that will re render accordingly. 

