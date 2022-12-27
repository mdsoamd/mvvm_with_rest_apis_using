
import 'package:mvvm_with_rest_apis_using/data/network/BaseApiServices.dart';
import 'package:mvvm_with_rest_apis_using/data/network/NetworkAPIServices.dart';
import 'package:mvvm_with_rest_apis_using/res/app_url.dart';

class AuthRepository{

 BaseAPIServices apiServices = NetworkApiServices();

 Future<dynamic> login(dynamic data)async{
  try {
    dynamic response = await apiServices.getPostApiRespons(AppUrl.loginEndPint,data); //* <-- getPostApiRespons Function call
    return response;
  } catch (e) {
     throw e;
  }
  
 }





 Future<dynamic> registerApi(dynamic data)async{

  try {
    dynamic response = await apiServices.getPostApiRespons(AppUrl.registerEndPint, data);
    return response;
  } catch (e) {
     throw e;
  }
  
 }
  
}