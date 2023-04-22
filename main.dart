import 'package:flutter/material.dart';
import 'package:go_online/go_online.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final goOnline = GoOnline(); // Create instance of GoOnline class

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Online Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Go Online Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // Call the postData method
                  var response = await goOnline.postData({'name': 'John'}, 'users');

                  // Print the response to the console
                  print(response.body);
                },
                child: Text('Create User'),
              ),
              ElevatedButton(
                onPressed: () async {
                  // Call the getData method
                  var response = await goOnline.getData('users');

                  // Print the response to the console
                  print(response.body);
                },
                child: Text('Get Users'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
