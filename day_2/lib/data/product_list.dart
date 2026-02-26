final List<Map<String, dynamic>> productList = [
  {
    "name":"Dog",
    "description": "This is a Dog"
  },
  {
    "name":"Cat",
    "description": "This is a Cat"
  },
  {
    "name":"Duck",
    "description": "This is a Duck"
  },
];

class ScreenArguments {
  final String name;
  final String description;

  ScreenArguments({required this.name, required this.description});
}

class FormArguments {
  final String firstName;
  final String lastName;
  final String email;

  FormArguments({required this.firstName, required this.lastName, required this.email});
}

