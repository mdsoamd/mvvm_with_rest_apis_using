
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm_with_rest_apis_using/data/app_expositions.dart';
import 'package:mvvm_with_rest_apis_using/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseAPIServices{



  @override
  Future getGetApiRespons(String url) async{
    // TODO: implement getGetApiRespons
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 3));
      responseJson = returnResponse(response);
      
    } on SocketException {
      throw FetchDataException('No Internet Conncetion');
    }
    return responseJson;
    
    
  }







  @override
  Future getPostApiRespons(String url,dynamic data)async {
    // TODO: implement getPostApiRespons
   dynamic responseJson;
    try {
     Response response = await post(
      Uri.parse(url),
      body: data

     ).timeout(Duration(seconds: 10));
      
    } on SocketException {
      throw FetchDataException('No Internet Conncetion');
    }
    return responseJson;
  }







dynamic returnResponse (http.Response response){

  switch(response.statusCode){
      case 200:
       dynamic responseJson = jsonDecode(response.body);
       return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
       throw UnauthorisedException(response.body.toString());
      default :
       throw FetchDataException(' Error accured white communicating with server '+
              'with status code' +response.statusCode.toString());
     }
  
  
}


  

}