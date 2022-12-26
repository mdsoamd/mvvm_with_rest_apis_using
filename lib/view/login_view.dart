import 'package:flutter/material.dart';
import 'package:mvvm_with_rest_apis_using/res/components/round_button.dart';
import 'package:mvvm_with_rest_apis_using/utils/Utils.dart';
import 'package:mvvm_with_rest_apis_using/utils/routes/routes_name.dart';

import '../utils/routes/routes.dart';




class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode  emailFocusNode = FocusNode();
  FocusNode  passwordFocusNode = FocusNode();



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obscurePassword.dispose();
  }

  
  
  
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height * 1 ;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

             TextFormField(
              controller: _emailController,
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              
              decoration: InputDecoration(
                    hintText: "Enter email",
                    labelText: "Email",
                    prefixIcon: Icon(Icons.alternate_email),
                    
               ),
               onFieldSubmitted: (value) {
                 Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);    //* <-- fieldFocusChange() Function call
               },
             ),
             




             ValueListenableBuilder(             //* <-- ValueListenableBuilder Use
              valueListenable: _obscurePassword, 
              builder:(context, value, child) {
              return  TextField(
              controller: _passwordController,
              obscureText:_obscurePassword.value,
              focusNode: passwordFocusNode,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                    hintText: "Enter password",
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock_open_outlined),
                    suffixIcon: InkWell(
                      onTap: () {
                        _obscurePassword.value = ! _obscurePassword.value;  //* <-- This Password Show or Hide Using code
                      },
                      child: Icon(
                        _obscurePassword.value ?
                        Icons.visibility_off_outlined:
                        Icons.visibility
                        
                        ))
               ),
             );
            },
          ),





            SizedBox(height: hight * .1,),






              RoundButton(title: "login", onPerss:(){

                if(_emailController.text.isEmpty){

                    Utils.ftushBarErrorMessage("Please enter email", context);           //* <-- This ftushBarErrorMessage() Function Call

                }else if(_passwordController.text.isEmpty){

                   Utils.ftushBarErrorMessage("Please enter password", context);          //* <-- This ftushBarErrorMessage() Function Call

                }else if(_passwordController.text.length < 6){

                  Utils.ftushBarErrorMessage("Please enter 6 digit password", context);    //* <-- This ftushBarErrorMessage() Function Call

                }else{

                    print("Api Hit");

                }
                
                  
              })




           
        ],))
    );
  }
}