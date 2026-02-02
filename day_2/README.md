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
