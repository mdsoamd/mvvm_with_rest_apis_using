
import 'package:mvvm_with_rest_apis_using/data/network/NetworkAPIServices.dart';
import 'package:mvvm_with_rest_apis_using/model/get_data_model.dart';
import 'package:mvvm_with_rest_apis_using/model/movies_model.dart';
import 'package:mvvm_with_rest_apis_using/res/app_url.dart';

import '../data/network/BaseApiServices.dart';

class HomeRepository{

BaseAPIServices _apiServices = NetworkApiServices();  //TODO Create object NetworkApiServices class call


 // TODO Login Function Create
 Future<MovieListModel> fetchMoviesList()async{
  try {                      //*obj call                //* AppUrl class call loginEndPint url
    dynamic response = await _apiServices.getGetApiRespons(AppUrl.moviesListEndPint);             //* <-- getGetApiRespons Function call
    return MovieListModel.fromJson(response);
  } catch (e) {
     throw e;
  }
  

 }






//   //TODO Login Function Create
//  Future<GetDataModel> fetchMoviesList()async{
//   try {                      //*obj call                //* AppUrl class call loginEndPint url
//     dynamic response = await apiServices.getGetApiRespons(AppUrl.moviesListEndPint);             //* <-- getGetApiRespons Function call
//     return GetDataModel.fromJson(response);
//   } catch (e) {
//      throw e;
//   }
  
//  }


}