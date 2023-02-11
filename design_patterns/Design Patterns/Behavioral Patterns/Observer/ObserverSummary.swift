//
//  ObserverSummary.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 11.02.2023.
//

import Foundation

// MARK: - Observer

/*
 An observer is a behavioral design pattern that creates a subscription mechanism that allows one object to monitor and respond to events occurring in other objects.

 Let's call Publishers those objects that contain important or interesting state for others. The remaining objects that want to track changes in this state will be called Subscribers.

 The Observer pattern suggests storing inside the publisher object a list of references to subscriber objects, and the publisher does not have to maintain the list of subscriptions on its own. It will provide methods by which subscribers can add or remove themselves from the list.

When an important event occurs in the Publisher, it will iterate through the list of subscribers and notify them by calling a specific method on the subscriber objects.

 --- Structure ---

 1. The publisher owns internal state that is interesting for subscribers to track. The publisher contains a subscription mechanism: a list of subscribers and subscription/unsubscription methods.

 2. When the publisher's internal state changes, it notifies its subscribers. To do this, the publisher traverses through the list of subscribers and calls their notification method, which is set in the general subscriber interface.

 3. The subscriber defines the interface that the publisher uses to send the notification. In most cases, a single method is sufficient for this.

 4. Specific subscribers do something in response to a notification from the publisher. These classes must follow the common subscriber interface so that the publisher does not depend on specific subscriber classes.

 5. When a notification arrives, the subscriber needs to get the updated state of the publisher. The publisher can pass this state through the parameters of the notification method.

 A more flexible option is to pass the entire publisher object through parameters so that the subscriber can get the required data itself. Alternatively, the subscriber can permanently store a reference to the publisher object passed to it in the constructor.

 6. The client creates the publisher and subscriber objects and then registers the update subscribers with the publishers.
 
 --- Applicability ---

 When, after changing the state of one object, something needs to be done in others, but you do not know in advance which objects should react.

 The described problem can arise when developing user interface libraries, when you need to enable third-party classes to respond to button clicks.

 The Observer pattern allows any object with a subscriber interface to register to receive notifications about events occurring in publisher objects. When some objects should observe others, but only in certain cases.

 Publishers maintain dynamic lists. All observers can subscribe or unsubscribe from receiving notifications right during the execution of the program.
 
 --- Implementation steps ---

 1. Break your functionality into two parts: an independent core and optional dependent parts. The independent core will become the publisher. Dependent parts will become subscribers.

 2. Create a subscriber interface. Usually it is enough to define a single notification method in it.

 3. Create a publisher interface and describe subscription management operations in it. Remember that the publisher should only work with the public interface of the subscribers.

 4. You need to decide where to put the subscription maintenance code, because it is usually the same for all types of publishers. The most obvious way is to move this code into an intermediate abstract class from which all publishers will inherit.

 But if you are integrating the pattern into existing classes, it can be difficult to create a new base class. In this case, you can put the subscription logic in a helper object and delegate work from publishers to it.

 5. Create specific publisher classes. Implement them so that after each state change they send notifications to all their subscribers.

 6. Implement the notification method in specific subscribers. Don't forget to provide parameters through which the publisher could send some data related to the event that happened.

 Another option is also possible, when the subscriber, having received a notification, will itself take the necessary data from the publisher object. But in this case, you will be forced to bind the subscriber class to a specific publisher class.

 7. The client must create the required number of subscriber objects and sign them with publishers.
 
 --- Advantages and disadvantages ---

 + Publishers do not depend on specific classes of subscribers and vice versa.

 + You can subscribe and unsubscribe recipients on the fly.

 + Implements the principle of openness/closeness.

 - Subscribers are notified randomly.
 */

/*
 How can this be used in real life?

 - You can subscribe to websites
 - Follow feature on social media sites
 - Notifications in WhatsApp
 */
