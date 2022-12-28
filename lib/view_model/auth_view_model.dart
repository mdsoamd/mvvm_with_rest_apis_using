
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_with_rest_apis_using/repository/auth_repository.dart';
import 'package:mvvm_with_rest_apis_using/utils/Utils.dart';
import 'package:mvvm_with_rest_apis_using/utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier{
  
  final _myRepo = AuthRepository();    //TODO Create object AuthRepository class

  bool _loading = false;
  bool get loading => _loading;

  bool _sigUploading = false;
  bool get sigUploading => _sigUploading;

  

   //TODO Create  setLoading function
  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
 
  
  
  //TODO Create setSigUpLoading function
  setSigUpLoading(bool value){
    _sigUploading = value;
    notifyListeners();
  }

  


  


//TODO Create loginApi Function 
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



  //TODO Create sigUpApi Function
  Future<void> sigUpApi(dynamic data,BuildContext context)async{
      setSigUpLoading(true);
     _myRepo.sigUpApi(data).then((value){      //* <-- login function call
        setSigUpLoading(false);
        Utils.ftushBarErrorMessage("SigUp Successfully", context);
        Navigator.pushNamed(context, RoutesName.home);
       if(kDebugMode){
          print(value.toString());
       }
     }).onError((error, stackTrace){
         setSigUpLoading(false);
         if(kDebugMode){ 
          Utils.ftushBarErrorMessage(error.toString(),context);
          print(error.toString());
       }
     });
  }


  
}