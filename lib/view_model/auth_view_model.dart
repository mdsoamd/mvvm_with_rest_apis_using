
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_with_rest_apis_using/model/user_model.dart';
import 'package:mvvm_with_rest_apis_using/repository/auth_repository.dart';
import 'package:mvvm_with_rest_apis_using/utils/Utils.dart';
import 'package:mvvm_with_rest_apis_using/utils/routes/routes_name.dart';
import 'package:mvvm_with_rest_apis_using/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

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

        final userPreferences = Provider.of<UserViewModel>(context,listen: false);
        userPreferences.saveUser(           //* <-- Token saveUser Function call
          UserModel(
            token: value['token'].toString()
          )
        );

        Utils.ftushBarErrorMessage("Login Successfully", context); 
        Navigator.pushNamed(context, RoutesName.home);

       
     }).onError((error, stackTrace){
         setLoading(false);
         Utils.ftushBarErrorMessage(error.toString(),context);
         if(kDebugMode){ 
           print(error.toString());
         }
     });
  }



  //TODO Create sigUpApi Function
  Future<void> sigUpApi(dynamic data,BuildContext context)async{
      setSigUpLoading(true);
     _myRepo.sigUpApi(data).then((value){      //* <-- login function call
        setSigUpLoading(false);

        final userPreferences = Provider.of<UserViewModel>(context,listen: false);
        userPreferences.saveUser(            //* <-- Token saveUser Function call
          UserModel(
            token: value['token'].toString()
          )
        );


        Utils.ftushBarErrorMessage("SigUp Successfully", context);
        Navigator.pushNamed(context, RoutesName.home);
       if(kDebugMode){
          print(value.toString());
       }

     }).onError((error, stackTrace){
         setSigUpLoading(false);
          Utils.ftushBarErrorMessage(error.toString(),context);
         if(kDebugMode){ 
          print(error.toString());
       }
     });
  }


  
}