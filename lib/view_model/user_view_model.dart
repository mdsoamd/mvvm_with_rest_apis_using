
import 'package:flutter/cupertino.dart';
import 'package:mvvm_with_rest_apis_using/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{





 //TODO User Save Token Function Create
  Future<bool> saveUser(BuildContext context, UserModel user)async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
     notifyListeners();
     return true;
  }
  




  //TODO User Get Token Function Create
  Future<UserModel> getUser()async{
   final SharedPreferences _sp = await SharedPreferences.getInstance();
   final String? token = _sp.getString('token');
      notifyListeners();
      return UserModel(
        token: token.toString()
      );
  }
  




  void remove()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    // sp.clear();
    sp.remove('token');

  }







  
}