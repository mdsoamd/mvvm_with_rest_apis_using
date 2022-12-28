import 'package:flutter/material.dart';
import 'package:mvvm_with_rest_apis_using/utils/routes/routes.dart';
import 'package:mvvm_with_rest_apis_using/utils/routes/routes_name.dart';
import 'package:mvvm_with_rest_apis_using/view/login_view.dart';
import 'package:mvvm_with_rest_apis_using/view_model/auth_view_model.dart';
import 'package:mvvm_with_rest_apis_using/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(create:(context) => AuthViewModel(),),
        ChangeNotifierProvider(create:(context) => UserViewModel(),),
    ],
     child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      // home: LoginScreen();
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
    )
    );

    

  }
}


