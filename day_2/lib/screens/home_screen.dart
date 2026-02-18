import 'package:flutter/material.dart';

import 'loading_screen.dart';

class HomeScreen extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();


   HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _form,
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: "Enter First Name", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Please Enter Name";
                  }
                  else{
                    return null;
                  }
                }
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
                  else {
                    return null;
                  }
                }
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                if(_form.currentState!.validate()){
                  Navigator.pushNamed(context, 'loadingScreen', arguments: FormArguments1(first: _firstNameController.text, last: _lastNameController.text));
                }
              },
                  child: Text("Post Data")),
            ],
          ),
        ),
      ),
    );
  }
}
