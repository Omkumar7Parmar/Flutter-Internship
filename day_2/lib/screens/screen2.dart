import 'package:day_2/data/product_list.dart';
import 'package:flutter/material.dart';
import 'package:day_2/screens/screen3.dart';


class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}




class _SecondScreenState extends State<SecondScreen> {

  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose(){
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(right: 20, left: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: "Enter First Name", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Please Enter Name";
                  }
                  else if(value.length <= 3){
                    return "More Than 3 Characters";
                  }
                  else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20,),

              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: "Enter Last Name", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Please Enter Name";
                  }
                  else if(value.length <= 3){
                    return "More Than 3 Characters";
                  }
                  else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20,),

              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Enter Email", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Please Write Something";
                  }
                  else if(!value.contains("@")){
                    return "Invalid Email";
                  }
                  else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  Navigator.pushNamed(context, 'thirdScreen', arguments: FormArguments(firstName: _firstNameController.text, lastName: _lastNameController.text, email: _emailController.text));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Form Submitted"), backgroundColor: Colors.brown,));
                }
              }, child: Text("Submit")),
            ],
        )),
      ),
    );
  }
}
