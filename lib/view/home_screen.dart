import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_with_rest_apis_using/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/routes/routes_name.dart';



class HomeScreen extends StatefulWidget {


  const HomeScreen({Key? key,}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {

     final userPreferences = Provider.of<UserViewModel>(context);  //* Logout Function access

     return Scaffold(
      appBar: AppBar(
        actions: [
            InkWell(
              onTap: (){

                 userPreferences.remove().then((value){     //* Token remove Function call  (user logout)
                 Navigator.popUntil(context, (route) => route.isFirst);
                 Navigator.pushReplacementNamed(context, RoutesName.login);

              });

              },
              child: Center(child: Text("Logout"))),
              SizedBox(width: 10,)
        ],
      ),  
      body: Column(
        children: [

        ],
      ),
     );
  }
}