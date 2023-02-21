import 'package:flutter/material.dart';
import 'package:test2/model/api.dart';
import 'package:test2/view/show_users/list_users.dart';
import 'package:test2/view/theme/app_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class ShowUser extends StatefulWidget {
  const ShowUser({Key? key}) : super(key: key);

  @override
  _ShowUserState createState() => _ShowUserState();
}

class _ShowUserState extends State<ShowUser> {

  List users=[];
  bool isLoading=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUsersFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: Text("show all users"),
      ),
      body: _buildBody(),
    );
  }

  var spinkit =  SpinKitSpinningLines(
    color: AppColors.orange,
    size: 50.0,
  );

  Future _getUsersFromServer() async{

    //https://jsonplaceholder.typicode.com/users
//    String  url='${Api.baseURL}users';
//    String  url=Api.makeApi(address: "users");
    String  url=Api.makeApiTest("users");

    var response=await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List result =
      convert.jsonDecode(response.body);
//      users.addAll(result);
      for (var element in result) {
        users.add(element);
      }
    }
    setState(() {
      isLoading=false;
    });

  }

 Widget _buildBody() {
    if(isLoading){
      return Center(
        child: spinkit,
      );
    }else{
     return ListUsers(allUsers: users);
    }
 }
}


