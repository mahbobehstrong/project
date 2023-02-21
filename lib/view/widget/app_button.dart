import 'package:flutter/material.dart';
import 'package:test2/view/theme/app_colors.dart';
import 'package:test2/view/theme/app_text_style.dart';

enum ButtonState { idle, loading }

enum UserType { user, manager }

class AppButton extends StatelessWidget {
  Function? onPressed;
  ButtonState state;
  String text;
  double? width;
  final Color? color;
  AppButton(
      {Key? key,
      this.onPressed,
      required this.state,
      required this.text,
        this.color,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (state == ButtonState.loading) {
          return;
        }
        onPressed!.call();
      },
      child: SizedBox(
        width: width ?? double.infinity,
        height: 40,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color??AppColors.orange
          ),
          child:state==ButtonState.loading?
              SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                  strokeWidth: 1.5,
                  color: AppColors.whiteColor,
                ),
              )
              : Text(text,style: AppTextStyle.whiteFont18),
        ),
      ),
    );
  }
}
