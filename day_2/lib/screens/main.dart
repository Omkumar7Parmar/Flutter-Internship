import 'package:flutter/material.dart';
import 'screen2.dart'; // Ensure this matches your filename

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputFormScreen(), // Starting with the form screen
    );
  }
}

class InputFormScreen extends StatefulWidget {
  const InputFormScreen({super.key});

  @override
  State<InputFormScreen> createState() => _InputFormScreenState();
}

class _InputFormScreenState extends State<InputFormScreen> {
  // 1. GlobalKey to identify the form and trigger validation
  final _formKey = GlobalKey<FormState>();

  // 2. Controllers to retrieve the text values
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // 3. Clean up controllers when the widget is removed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Form"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey, // Assign the key to the Form widget
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // EMAIL FIELD
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress, // Optimized for email input
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                // Validation Logic
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email"; // Error if empty
                  }
                  if (!value.contains('@')) {
                    return "Enter a valid email address"; // Error if missing @
                  }
                  return null; // Valid
                },
              ),
              const SizedBox(height: 20),

              // PASSWORD FIELD
              TextFormField(
                controller: _passwordController,
                obscureText: true, // Hides characters for security
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "Password must be at least 6 characters"; // Error if too short
                  }
                  return null; // Valid
                },
              ),
              const SizedBox(height: 30),

              // SUBMIT BUTTON
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // Full-width button
                ),
                onPressed: () {
                  // Trigger validation for all fields in the form
                  if (_formKey.currentState!.validate()) {
                    // 4. Show entered data using a SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Logging in as: ${_emailController.text}"),
                        backgroundColor: Colors.green,
                      ),
                    );

                    // Navigate to your second screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const secondScreen()),
                    );
                  }
                },
                child: const Text("SUBMIT", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}