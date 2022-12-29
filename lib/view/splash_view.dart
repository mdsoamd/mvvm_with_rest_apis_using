import 'package:flutter/material.dart';
import 'package:mvvm_with_rest_apis_using/view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


SplashServices splashServices = SplashServices();   //TODO Create Objcet SplashServices class



@override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.checkAuthentictation(context);     //* <-- checkAuthentictation Function call
  }




  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(child: Text("Splash Screen",style: Theme.of(context).textTheme.headline4,)),
     );
  }
}