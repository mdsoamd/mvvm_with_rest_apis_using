import 'package:flutter/material.dart';
import 'package:mvvm_with_rest_apis_using/res/components/round_button.dart';
import 'package:mvvm_with_rest_apis_using/utils/Utils.dart';
import 'package:mvvm_with_rest_apis_using/utils/routes/routes_name.dart';
import 'package:mvvm_with_rest_apis_using/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/routes/routes.dart';




class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _LoginViewState();
}

class _LoginViewState extends State<SignUpView> {

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
    final authViewModel = Provider.of<AuthViewModel>(context);

    final hight = MediaQuery.of(context).size.height * 1 ;
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
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






              RoundButton(

                loading:authViewModel.sigUploading, 

                title: "SigUp", onPerss:(){

                if(_emailController.text.isEmpty){

                    Utils.ftushBarErrorMessage("Please enter email", context);           //* <-- This ftushBarErrorMessage() Function Call

                }else if(_passwordController.text.isEmpty){

                   Utils.ftushBarErrorMessage("Please enter password", context);          //* <-- This ftushBarErrorMessage() Function Call

                }else if(_passwordController.text.length < 6){

                  Utils.ftushBarErrorMessage("Please enter 6 digit password", context);    //* <-- This ftushBarErrorMessage() Function Call

                }else{
                    
                    Map data ={
                      'email':_emailController.text.toString(),
                      'password':_passwordController.text.toString()
                    };
                    authViewModel.sigUpApi(data,context);  //* sigUpApi Function call
                    print("Api Hit");

                }
                
                  
              }),

           SizedBox(height: hight * .05,),
           InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.login);
            },
            child: Text("Already have an account? Login"))






           
        ],))
    );
  }
}