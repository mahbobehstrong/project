import 'package:flutter/material.dart';
import 'package:test2/view/show_users/show_users.dart';
import 'package:test2/view/theme/app_colors.dart';
import 'package:test2/view/theme/app_text_style.dart';
import 'package:test2/view/widget/app_button.dart';
import 'package:get/get.dart';
import 'package:test2/controller/login_controller.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  LoginController loginController=LoginController();
  ButtonState loginPageButtonState=ButtonState.idle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:AppColors.whiteColor,
        body: _buildBody(),);
  }

 Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _showBackIcon(),
            _showAppName(),
            _showForm(),
            _loginButton(),
            _forgotpassword(),
        

          ],
        ),
      ),
    );
 }

 Widget _showBackIcon() {
    return   Row(

      children: [
        const Icon(Icons.arrow_back_ios_rounded),
        TextButton(
            onPressed: () {},
            child: Text(
              "Back",
              style: AppTextStyle.black87Font18,
            )),

      ],
    );
 }

 Widget _showAppName() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60,top: 60),
      child: Container(
        alignment: Alignment.center,
        child: RichText(
            text: TextSpan(
                text: "d",
                style: AppTextStyle.orangeFont18Bold,
                children: [
                  TextSpan(
                      text: "ev",
                      style: AppTextStyle.black87Font18),
                  TextSpan(text: "rnz")
                ])),
      ),
    );
 }

 Widget _showForm() {
    return Form(
      key: loginController.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            Text(
              "Email id",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Container(
                height: 45,
                child: TextFormField(
                  onChanged: (String? value){
                    loginController.email=value!;
                  },
                  validator: (String? value){
                    if(value!.length<5){
                      return "email is not valid";
                    }
                    return null;
                  },
                  decoration: _decoration(),
                ),
              ),
            ),
            Text(
              "Password",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Container(
                  height: 45,
                  child: TextFormField(
                    onSaved: (String? value){
                      loginController.password=value!;
                    },
                    validator: (String? value){
                      if(value!.length<5){
                        return "password is not valid";
                      }
                      return null;
                    },

                    obscureText: true,
                    decoration: _decoration(),
                  ),
                ),
            ),
            
          ],
        ));
 }

 InputDecoration _decoration() {
    return const InputDecoration(
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide.none));
 }

 Widget _loginButton() {
    return AppButton(state:loginPageButtonState,text: "login",onPressed: ()async{

      setState(() {
        loginPageButtonState=ButtonState.loading;
      });

      await getDataFromServer();
      setState(() {
        loginPageButtonState=ButtonState.idle;

      });
//      Navigator.push(context, MaterialPageRoute(builder: (context){
//        return ShowUser();
//      }));
    Get.to(ShowUser());
    },);
 }

  Widget _forgotpassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }

  Future<int> getDataFromServer() async{
    await Future.delayed(Duration(milliseconds: 200));
    return 1;
  }
}
