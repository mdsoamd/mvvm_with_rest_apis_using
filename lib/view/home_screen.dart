
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_with_rest_apis_using/data/response/status.dart';
import 'package:mvvm_with_rest_apis_using/utils/Utils.dart';
import 'package:mvvm_with_rest_apis_using/utils/routes/routes_name.dart';
import 'package:mvvm_with_rest_apis_using/view_model/home_view_model.dart';
import 'package:mvvm_with_rest_apis_using/view_model/user_view_model.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatefulWidget {


  const HomeScreen({Key? key,}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



 HomeViewViewModel homeViewViewModel = HomeViewViewModel();  //TODO Create object HomeViewViewModel with Provider Class

  


  @override
  void initState() {
    // TODO: implement initState
    homeViewViewModel.fatchMoviesListApi();   //* <-- This fatchMoviesListApi() Function Call
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
     return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home Page"),
        actions: [
          InkWell(
            onTap: (){
              userPreferences.remove().then((value){             //* <-- User Token remove call
                 Navigator.pushNamed(context, RoutesName.login);
              });
            },
            child: Center(child: Text("Logout"),),
          ),
          SizedBox(width: 20,)
        ],
      ),  
      body: ChangeNotifierProvider<HomeViewViewModel>(create: (context) => homeViewViewModel,
      child: Consumer<HomeViewViewModel>(builder: (context, value, child) {

        switch(value.moviesList.status){
          case Status.LOADING:
           return Center(child: CircularProgressIndicator());

          case Status.ERROR:
           return InkWell(
            onTap: (() {
              value.fatchMoviesListApi();
            }),
            child: Center(child:Text(value.moviesList.message.toString())));

          case Status.COMPLETED:

           return ListView.builder(
           itemCount: value.moviesList.data!.movies!.length,
            itemBuilder:(context, index) {

              return Card(
                    child: ListTile(
                      leading: Image.network(value.moviesList.data!.movies![index].posterurl.toString(),

                      errorBuilder: (context, error, stackTrace) {      //* <-- errorBuilder use
                        return Icon(Icons.error,color: Colors.red,); //* <-- image corrupt or url Mina koy issue hoga to Icons.error Show karega
                      },

                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,

                      ),
                      
                      title: Text(value.moviesList.data!.movies![index].title.toString()),
                      subtitle: Text(value.moviesList.data!.movies![index].year.toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(Utils.averageRating(value.moviesList.data!.movies![index].ratings!).toStringAsFixed(1)),   //* <-- Utils class averageRating() Function Call
                          Icon(Icons.star,color: Colors.yellow,)

                        ],
                      ),
                    ),
              );
           },);

         default:
         return Text("NO Data");
          
        }
        
        return Column(
        children: [
           
        ],
      );
      },),


      )
     );
  }
}



















// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:http/http.dart' as http;

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   var url = "https://api.publicapis.org/entries";
//   var data;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getData();
//   }
  

//   getData()async{
//      var res =  await http.get(Uri.parse(url));
//      data = jsonDecode(res.body);
//      setState(() {
       
//      });
//   }
  
  
//   @override
//   Widget build(BuildContext context) {
//      return Scaffold(
//       body: ListView.builder(
//         itemCount: data['entries'].length,
//         itemBuilder:(context, index) {
//          return Text(data['entries'][index]['API']);
//       },),
//      );
//   }
// }