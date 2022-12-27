
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_with_rest_apis_using/repository/auth_repository.dart';
import 'package:mvvm_with_rest_apis_using/utils/Utils.dart';
import 'package:mvvm_with_rest_apis_using/utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier{
  
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;


  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  

  Future<void> loginApi(dynamic data,BuildContext context)async{
      setLoading(true);
     _myRepo.login(data).then((value){      //* <-- login function call
        setLoading(false);
        Utils.ftushBarErrorMessage("Login Successfully", context);
        Navigator.pushNamed(context, RoutesName.home);
       if(kDebugMode){
          print(value.toString());
       }
     }).onError((error, stackTrace){
         setLoading(false);
         if(kDebugMode){ 
          Utils.ftushBarErrorMessage(error.toString(),context);
          print(error.toString());
       }
     });
  }


  
}