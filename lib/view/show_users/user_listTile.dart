import 'package:flutter/material.dart';

class userListTile extends StatelessWidget {
  String Title;
  String Subtitle;
  var user;
  userListTile({super.key,required this.Title,required this.Subtitle, this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(Title),
      subtitle: Text(Subtitle),
      trailing:user==null?null: CircleAvatar(
        child: Text("${user['name'][0]}"),
      ),
    );
  }
}