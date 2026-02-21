import 'package:flutter/material.dart';
import 'package:http/http.dart';

// For Successful POST req = https://jsonplaceholder.typicode.com/posts
// For Error POST req = https://jsonplaceholder.typicode.com/error-test


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late final args1 = ModalRoute.of(context)!.settings.arguments as FormArguments1;
  bool hasError = false;
  String errorMessage = "";
  void postData() async {
    try{
      // Use respective url for successful and unsuccessful post request
      Response response = await post(Uri.parse("https://jsonplaceholder.typicode.com/posts"), body: {
        "firstName": args1.first,
        "lastName": args1.last
      });
      if(response.statusCode == 201) {
        setState(() {
          hasError = false;
        });
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Data posted successfully!"), backgroundColor: Colors.green),
        );
        Navigator.pop(context);
      }
      else{
        setState(() {
          hasError = true;
          errorMessage = "Server Error";
        });
        if(!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Server Error"), backgroundColor: Colors.red),
        );
        Navigator.pop(context);
      }
    }
    catch(e){
      setState(() {
        hasError = true;
        errorMessage = e.toString();
      });
    }

  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => postData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: hasError
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMessage),
            SizedBox(height: 20),
            BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        )
            : CircularProgressIndicator(),
      ),
    );
  }
}


class FormArguments1 {
   final String first;
   final String last;

  FormArguments1({required this.first, required this.last});

}




