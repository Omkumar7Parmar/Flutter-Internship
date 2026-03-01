# day_2

What is Flutter
Flutter is an open-source UI software development kit created by Google. It is used to build cross-platform (Android & IOS) applications from a single codebase.


What is a Widget
A widget is the basic building block of Flutter user interfaces. Everything is a widget-from a button and text to the layout and the app itself.


StatelessWidget vs StatefulWidget
StatelessWidget is a widget that does not change its state over time. It is used for static UI elements that do not require any dynamic behavior. 

StatefulWidget is a widget that can change its state over time. It is used for dynamic UI elements that require some interaction or dynamic behavior. 


Basic project structure
Project Structure in flutter is like this:

lib
├── main.dart
├── models
│   └── user.dart
├── screens
│   ├── home_screen.dart
│   └── settings_screen.dart
├── widgets
│   ├── custom_button.dart
│   └── custom_text_field.dart
└── utils
    └── constants.dart

Day 3

The Widgets i have used for the Practice tasks are MaterialApp, Scaffold, AppBar, Center, Column, Image, Text, ElevatedButton

Day 4
I used SingleChildScrollView for scrollable body.

Day 5
Screen flow explanation

On HomeScreen there is a Elevated button it uses Navigation.push and adds new screen to the navigation stack which is SecondScreen. 
after clicking the button second screen appears with back button which uses context and after clicking the back button it navigates to the previous screen which was HomeScreen. 
back button only appears when there is a screen underneath it in the stack thanks to AppBar, because when it doesn't have anything underneath in the stack back button doesn't appears

What navigation method you used
I used Navigation.push 

Day 6
I created 2 form fields, first Email and second for the Password
I used email validation which checks whether email is valid or not.
and also whether password fits in the strong password criteria. 

Day 7
Week 1 revision + Mini Project 

Day 8
Which advanced layout widgets you used - Stack
What layout issue you faced and how you fixed it:
I wasn't able to move the text in the center of the image
Then i found out about the alignment property of stack which moves the child widget as per the alignment, like i used center. 

Day 9
What dynamic data you used - List<Map> for Product List and used it in both ListView and GridView
Difference you observed between ListView and GridView :
ListView Displays item vertically by default and GridView helps to display the items in grid view (row x column)

Day 10
What data you passed between screens => Name, image, Description
Which widget you made reusable => ListView, Container
 
Day 11
What data you stored - String type data => Name
Where and why you used SharedPreferences - While fetching, saving, and clearing data
Data like name, login state or theme status SharedPreference is used. 
 
Day 12
Which concept was most challenging - LocalStorage 
Screenshot are attached in the root directory

Day 13
App navigation flow explanation - App Loads with HomeScreen, after clicking on "Second Screen" it navigates to 'SecondScreen'. Then after clicking on any option it navigates to 'ThirdScreen' to display the name and description.

Routes you created -
'HomeScreen'
'SecondScreen'
'ThirdScreen'

Day 14
What validations you applied - 
for FirstName and LastName = String must not be empty and at least have 4 characters.
for Email = String must not be empty and must consist "@"

How you handled user feedback
If input is not valid than form returns "Invalid Input" respectively to the Field type 

Day 15
What you understood about APIs
 APIs is used to communicate between application and the server to exchange data and making changes on the server.

Day 16
API you used - https://my-json-server.typicode.com/typicode/demo/posts
How you handled loading and error states
if loading state returns StatusCode 200 then hasError = false
if not then hasError = true and "Server Error" return in catch block


Day 17
Which API you used https://jsonplaceholder.typicode.com/
/posts for Success
/error-test for error 

How you handled API response
setState() => for status code 201 hasError = false
else hasError = true
Screenshots are attached for both scenarios 


Day 18
Model fields you created -
final int userId;
final int id;
final String title;
final String body;

How using models improved your code
Data we get from API is not always in a format we want so by using models allows me to clean it before it goes into the UI 

Day 19
How you handled different UI states
A loader is displayed while the data is being fetched from the API
if it returns null it displays NO Data Found
What error cases you considered
Server Error - 404 Status Code
Connection Error - No Internet Connection
No Data Found - Empty Data Fetched from API


Day 20
What state you managed
counter, switch(on/off toggle), isLoading (loader) 

When and why you used setState
counter state whenever user presses on + or - button for keep updating the counter
switch state whenever user presses on switch/toggle for keep updating the value of switch whether it is on or off
isLoading when user presses on Simple API call button for api call and changing after the API response either 200 or something else.

Day 21
Your folder structure
lib - 
    models/post_model.dart
    provider/post_provider.dart
    screens/
        - main.dart
        - home_screen.dart
    services/posts_service.dart

How Provider improved API handling
it separates the UI and API (business logic) which makes it clean and scalable.

Day 22
What changes you made
Added 2 reusable widgets, improved the folder structure to keep UI and API logic
How refactoring improved your project
Refactoring the folder structure made it easy to add new UI component, new features or even new API logic with providers without rewriting already written code

Day 23
Firebase features you implemented - email password signIn 
How authentication flow works in your app
User enters email password and creates account then goes to login screen to re-enter email and password and login. 
then navigate to homeScreen

Day 24
Firestore structure you used
collection with 3 fields - title, timestamp, userId

How CRUD operations work in your app
Create adds the new task, Read fetches and displays the stored tasks, Update modifies the existing tasks, Delete removes the task from existed tasks