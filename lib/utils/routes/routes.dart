import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_with_rest_apis_using/utils/routes/routes_name.dart';
import 'package:mvvm_with_rest_apis_using/view/home_screen.dart';
import 'package:mvvm_with_rest_apis_using/view/login_view.dart';

class Routes {
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginView());

      case RoutesName.home:
        return MaterialPageRoute( builder: (BuildContext context) =>HomeScreen());   

      default:
        return MaterialPageRoute(builder: (context) {
          return Center(
            child: Text("No routes defined"),
          );
        });
    }
  }
}
