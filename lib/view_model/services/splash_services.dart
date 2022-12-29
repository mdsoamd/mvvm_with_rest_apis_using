import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_with_rest_apis_using/model/user_model.dart';
import 'package:mvvm_with_rest_apis_using/utils/routes/routes_name.dart';
import 'package:mvvm_with_rest_apis_using/view_model/user_view_model.dart';


class SplashServices {

 Future<UserModel> getUsertData() => UserViewModel().getUser();


 void checkAuthentictation(BuildContext context)async{

  getUsertData().then((value){
    print(value.token.toString());
    if(value.token.toString() == 'null' || value.token.toString() == ''){
      Future.delayed(Duration(seconds: 3));
      Navigator.pushNamed(context, RoutesName.login);
    }else{
       Future.delayed(Duration(seconds: 3));
       Navigator.pushNamed(context, RoutesName.home);
     
    }

  }).onError((error, stackTrace){
     if(kDebugMode){
      print(error);
     }
  });
  
 }
  
  
}