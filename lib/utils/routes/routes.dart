import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_with_rest_apis_using/utils/routes/routes_name.dart';
import 'package:mvvm_with_rest_apis_using/view/home_screen.dart';
import 'package:mvvm_with_rest_apis_using/view/login_view.dart';
import 'package:mvvm_with_rest_apis_using/view/signup_view.dart';
import 'package:mvvm_with_rest_apis_using/view/splash_view.dart';

class Routes {
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

     case RoutesName.splash:
        return MaterialPageRoute( builder: (BuildContext context) =>SplashView());   

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginView());

      case RoutesName.home:
        return MaterialPageRoute( builder: (BuildContext context) =>HomeScreen());   

      case RoutesName.sigUp:
        return MaterialPageRoute( builder: (BuildContext context) =>SignUpView());   

      default:
        return MaterialPageRoute(builder: (context) {
          return Center(
            child: Text("No routes defined"),
          );
        });
    }
  }
}
