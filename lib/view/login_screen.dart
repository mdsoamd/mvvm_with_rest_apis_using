import 'package:flutter/material.dart';
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
             Navigator.popUntil(context, (route) => route.isFirst);
             Navigator.pushReplacementNamed(context, RoutesName.home,arguments:{'name':"Saomd"} );     //* <--  yah Hai constructor Mein data send Karne Ka Tarika
          },
          child: Text("Click"),
        ),
      )
    );
  }
}