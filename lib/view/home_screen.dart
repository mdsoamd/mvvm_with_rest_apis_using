import 'package:flutter/material.dart';
import 'package:mvvm_with_rest_apis_using/view_model/user_view_model.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatefulWidget {


  const HomeScreen({Key? key,}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        actions: [
        
            InkWell(
              onTap: (){
               final logout = Provider.of<UserViewModel>(context,listen: false);
               
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