import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_with_rest_apis_using/model/user_model.dart';
import 'package:mvvm_with_rest_apis_using/utils/routes/routes_name.dart';
import 'package:mvvm_with_rest_apis_using/view_model/user_view_model.dart';


class SplashServices {

 Future<UserModel> getUsertData() => UserViewModel().getUser();   //* <-- getUser Function get and find    


 void checkAuthentictation(BuildContext context)async{

  getUsertData().then((value){      //* <-- getUser Function call

    if(kDebugMode){
      print(value.token.toString());
    }
   

    if(value.token.toString() == 'null' || value.token.toString() == ''){    //* <-- Token check
      Future.delayed(Duration(seconds: 3));

      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, RoutesName.login);

    }else{
      Future.delayed(Duration(seconds: 3));

      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, RoutesName.home);
     
    }

  }).onError((error, stackTrace){
     if(kDebugMode){
      print(error);
     }
  });
  
 }
  
  
}