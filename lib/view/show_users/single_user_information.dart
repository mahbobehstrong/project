import 'package:flutter/material.dart';
import 'package:test2/view/theme/app_colors.dart';
import 'package:test2/view/theme/app_text_style.dart';


class ShowUserInformation extends StatelessWidget {
  var user;
   ShowUserInformation({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: Text(user['name'],style: AppTextStyle.whiteFont18),
      ),
      body: _buildBody(),
    );
  }

 Widget _buildBody() {
    return Container();
 }
}
