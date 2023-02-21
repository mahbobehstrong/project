import 'package:flutter/material.dart';
import 'package:test2/view/show_users/single_user_information.dart';
import 'package:test2/view/show_users/user_listTile.dart';
import 'package:test2/view/theme/app_colors.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class ListUsers extends StatefulWidget {
  List allUsers;
   ListUsers({super.key,required  this.allUsers});

  @override
  State<ListUsers> createState() => _ListUsersState();
}


class _ListUsersState extends State<ListUsers> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget.allUsers.length,
        itemBuilder: (BuildContext context,index){
        var user=widget.allUsers[index];
        return GestureDetector(
          onTap: (){
            Get.to(ShowUserInformation(user: user));

          },
          child: Card(
            color: AppColors.green.withOpacity(index.isEven?0.4:0.8),
            child: userListTile(Title: user['name'], Subtitle: user['username'],user:index.isEven? user:null),
          ),
        );
      }),
    );
  }
  
}