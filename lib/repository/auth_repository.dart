
import 'package:mvvm_with_rest_apis_using/data/network/BaseApiServices.dart';
import 'package:mvvm_with_rest_apis_using/data/network/NetworkAPIServices.dart';
import 'package:mvvm_with_rest_apis_using/res/app_url.dart';

class AuthRepository{

 BaseAPIServices apiServices = NetworkApiServices();  //TODO Create object NetworkApiServices class call




 //TODO Login Function Create
 Future<dynamic> login(dynamic data)async{
  try {                      //*obj call                //* AppUrl class call loginEndPint url
    dynamic response = await apiServices.getPostApiRespons(AppUrl.loginEndPint,data); //* <-- getPostApiRespons Function call
    return response;
  } catch (e) {
     throw e;
  }
  
 }






 //TODO SignUp Function Create
 Future<dynamic> sigUpApi(dynamic data)async{

  try {                      //*obj call                //* AppUrl class call registerEndPint url
    dynamic response = await apiServices.getPostApiRespons(AppUrl.registerEndPint, data);  //* <-- getPostApiRespons Function call
    return response;
  } catch (e) {
     throw e;
  }
  
 }







  
}