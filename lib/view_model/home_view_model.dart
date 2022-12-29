
import 'package:flutter/cupertino.dart';
import 'package:mvvm_with_rest_apis_using/data/response/api_response.dart';
import 'package:mvvm_with_rest_apis_using/model/get_data_model.dart';
import 'package:mvvm_with_rest_apis_using/model/movies_model.dart';
import 'package:mvvm_with_rest_apis_using/repository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier{

  final _myRepo = HomeRepository();

  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieListModel>response){
    moviesList = response;
    notifyListeners();
  }

  

  Future<void> fatchMoviesListApi ()async{

      setMoviesList(ApiResponse.loading());

       print('data loading');

      _myRepo.fetchMoviesList().then((value){

       setMoviesList(ApiResponse.completed(value));

       print('data this --> $value');

    }).onError((error, stackTrace){

       setMoviesList(ApiResponse.error(error.toString()));

    });
    print('End Run');
  }













  // ApiResponse<GetDataModel> moviesList = ApiResponse.loading();

  // setMoviesList( ApiResponse<GetDataModel>response){
  //   moviesList = response;
  //   notifyListeners();
  // }

  

  // Future<void> fatchMoviesListApi ()async{
  //    setMoviesList( ApiResponse.loading());
  //    _myRepo.fetchMoviesList().then((value){
  //      setMoviesList(ApiResponse.completed(value));
  //   }).onError((error, stackTrace){
  //      setMoviesList(ApiResponse.error(error.toString()));
  //   });
  // }
  
  
}