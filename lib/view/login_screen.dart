import 'package:flutter/material.dart';
import 'package:mvvm_with_rest_apis_using/utils/Utils.dart';
import 'package:mvvm_with_rest_apis_using/utils/routes/routes_name.dart';

import '../utils/routes/routes.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
             Utils.toastMessage("Hello");
             Utils.ftushBarErrorMessage("Error", context);
             Utils.snackBar("No internet connection", context);
          },
          child: Text("Click"),
        ),
      )
    );
  }
}