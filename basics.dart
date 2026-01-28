// Variables and data types
void main() {
  // Int DataType
  // Method 1: Declaring an integer variable

  int age = 25;
  print(age);

  // Method 2: Nullable integer declaration
  int? count;
  print(count);

  // Method 3: Using 'var' keyword
  // Dart infers it as int
  var year = 2026;
  print(year);

  // Double DataType
  // Method 1: Explicit declaration
  double pi = 3.14;
  print(pi);

  // Method 2: Nullable double
  double? percentage;
  print(percentage);

  // Method 3: Using 'var' keyword
  // Dart infers it as double
  var temperature = 36.6;
  print(temperature);

  // num DataType which is used for both Integer and Double Values
  num A = 122;
  print(A);
  A = 12.2;
  print(A);

  //BigInt DataType
  BigInt bigInt = BigInt.parse('123456789012345678901234567890');
  print(bigInt);

  // Declaring String
  String name;
  //Assigning String Value
  name = "Day 2";
  print(name);

  //Boolean DataType
  bool isTrue = true;
  print(isTrue);
  bool isFalse = false;
  print(isFalse);

  //List DataType
  //Variable sized
  List<String> names = ["Om", "Kumar", "Parmar"];
  print(names);

  //Fixed sized List
  List<int> var_name1 = List<int>.filled(5, 0);
  print(var_name1);

  //Set DataType
  Set<String> names1 = {"Om", "Kumar", "Parmar"};
  print(names);

  //Map DataType
  Map<String, int> ages = {"Om": 25, "Kumar": 26, "Parmar": 27};
  print(ages);

  //Runes DataType
  Runes runes = Runes('\u{1F600}');
  print(runes);

  //Symbol DataType
  Symbol symbol = #age;
  print(symbol);

  //null DataType
  Null null1 = null;
  print(null1);


  //var DataType
  var name1 = "Om";
  print(name1);

  //final DataType
  final name2 = "Om";
  print(name2);

  //const DataType
  const name3 = "Om";
  print(name3);

  //Operators
  int a = 10;
  int b = 20;
  bool x = true;
  bool y = false;
  
  print("a + b = ${a + b}");
  print("a - b = ${a - b}");
  print("a * b = ${a * b}");
  print("a / b = ${a / b}");
  print("a % b = ${a % b}");
  print("a > b = ${a > b}");
  print("a < b = ${a < b}");
  print("a >= b = ${a >= b}");
  print("a <= b = ${a <= b}");
  print("a == b = ${a == b}");
  print("a != b = ${a != b}");
  print("x || y = ${x || y}");
  print("x && y = ${x && y}");
  print("!x = ${!x}");
  print("a & b = ${a & b}");
  print("a | b = ${a | b}");
  print("a ^ b = ${a ^ b}");
  print("a << b = ${a << b}");
  print("a >> b = ${a >> b}");

// Types of Dart Comments
// Dart Single Line Comment.      // This is single line comment 

// Dart Multiline Comment.
/*
This is multiline comment
*/

// Dart Documentation Comment.

/// This is documentation comment

}
