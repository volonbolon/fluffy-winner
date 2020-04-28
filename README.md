# fluffy-winner

## Definitions
I choose not to integrate any third-party dependency, not because I want to reinvent the wheel, but because I want to show my code, and not how to include a Cocoa Pod, which is fairly easy. 

I'm not using, for instance, any redux library. Instead, I'm using a custom observable object. In a production app, I most likely choose ReSwift. 

I've chosen not to use core data, and instead retrieve data from the network each time the app opens. Core Data is great, but it is more involved, and I wanted to speed up things. Data being said, because all low level interactions are handle in a framework, we can easily replace the network layer with one backed by Core Data or any other data base (Realm, SQLite), and the rest of the app wouldn't need to be changed at all. 

That's not to say the code base is layered in just one module. I've split it in different frameworks. The purpose is to encapsulate responsibilities. 

 We have the main module, which, in turns, consume services from 

- FluffyWinner_iOS: A framework responsible to handle controllers and user interactions. 
- FluffyWinnerUIKit: Mostly  in charge of extends and bridge UIKIt services
- FluffyWinnerKit: A framework in charge of handling low-level interactions, abstracting network interactions, disk and things not actually related to UIKit

## Architecture
The main drive of the architecture is modularity. Not just to reuse, but more importantly to easily test and integrate. 

I'm also adopting inverse injection. Once again, the main goal is testing. We can easily mock dependencies when testing, and we can also swap APIs on the fly if needed (think, for instance, in easily swap environments)

The injection is performed in `AppDependencyContainer`, here we manage to create the controllers and its dependencies, this is the actual repository of controls, but we can easily create an umbrella of dependecies containers. Let's say we have an app that requires login, we can have two containers, with different API clients to handle logged and non logged calls. 

To better handle dependencies, I'm departing from nib views. NSLayoutConstraints are not tame, but I found them to be easier to handle in code. Because of that, I've subclassed UIViewController and UIView. 

The controllers themselves are pretty slim, They are injected with a UIView, and a model. The model is in charge of managing interactions with low level APIs (encapsulated in FluffyWinnerKit)m and group together view, and the responders. 

The responders are defined in protocols, once again to easily swap them if required. Here i'm using the view controllers are ux responders, but anything could be used. 

For table views, I'm also defining data source independently, and injecting them to the appropriate view. 

User interaction, especially those that require asynchronous tasks, are handled by `UseCase`. A use case is an atomic object that will carry on with a single task. 
 
Models are used to expose data to the rest of the app. As said before, consumers don't know were models came from. It just would the same a local data store, or a remote API. We abstract away the complexity of the repositories. 

Repositories are used to retrieve data, and produce models. We have a protocol that defines interfaces used by consumers, and we then have two actual implemtations. One getting things from the API, and one faking responses. 


