## 1 - Introduction


This report specifies the key components of the in-developing project. Contains all the software used and how their relations. It is our main goal to describe all the software and tactics that will be used by our team in order to achieve an successful project.

## 2 - Technological architecture

In the initial lectures was demanded the usage of an unknown framework in order to expand our levels or knowledge and create a more challengeable project.
To create the mobile app we've decided to use native Android alongside a few libraries that would complement mainly the user interface. We've decided to create an SQLite database in order to achieve a more user-friendly environment and the possibility of usage while not being connected to internet.
The web-app will be developed using the Ruby on Rails framework, allowing us to a fast and productive creation. We will also be using HTML5, CSS, jQuery and JavaScript.
As an agile project management tool we've chosen PivotalTracker and Slack to keep contact when required between the Scrum Master and the instructor.

## 3 - Logical architecture

[UML](https://jumpshare.com/v/MXKWSQRGowmBO71kTbwP)

## 4 - Physical architecture

[Physical Architecture](http://jmp.sh/1dI7AG6)

## 5 - Key design decisions

### Software patterns

* ###Model-View-Controller
We've chosen a framework that is MVC oriented in order to develop our web-app. It will improve our code and abstraction capabilities allowing the project to scale without getting absolutely incomprehensible.

* ### Active Record
We'll be leveraging Rails Active Record implementation which maps an object instance to a single database row, allowing us to read/update/delete it, or create a new database row by instatiating a new object of a given class.

* ###Template Method
Allows to re-use code without duplicate, allowing a faster development and simpler code changes.

* ###Observer
Allowing better flexibility.

### Security
The user passwords are encrypted using bcrypt that is a secure and sophisticated hash algorithm for hashing passwords.  

### Error Handling
Give a prompt response to the user explaining what was wrong with their request (with javascript), giving in this way a user-friendly interface.

## References
* [Ruby on Rails](http://rubyonrails.org)
* [Android Development Kit](https://developer.android.com)
* [Pivotal Tracker](https://www.pivotaltracker.com)