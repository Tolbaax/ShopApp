import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/shared/styles/colors.dart';

Widget defaultFormField({
  String? Function(String?)? onChange,
  String? Function(String?)? onSubmit,
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?)? validate,
  required IconData prefix,
  IconData? suffix,
  required String label,
  Function()? onTab,
  bool isPassword = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validate,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      obscureText: isPassword,
      onTap: onTab,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: (suffix != null)
            ? InkWell(
                onTap: onTab,
                child: Icon(
                  suffix,
                  color: defaultColor,
                ),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );

//===================================================================
Widget defaultButton({
  double width = double.infinity,
  double height = 45.0,
  Color backgroundColor = defaultColor,
  required Function() function,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: backgroundColor,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );

//=========================================================================
void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndRemoveUntil(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

//===============================================================
Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

//===============================================================
void showToast({
  required String text,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

// enum
enum ToastState { success, error, warning }

Color? chooseToastColor(ToastState state) {
  Color? color;

  switch (state) {
    case ToastState.success:
      color = Colors.green;
      break;
    case ToastState.error:
      break;
    case ToastState.warning:
      break;
  }

  switch (state) {
    case ToastState.error:
      color = Colors.red;
      break;
    case ToastState.success:
      break;
    case ToastState.warning:
      break;
  }

  switch (state) {
    case ToastState.warning:
      color = Colors.amber;
      break;
    case ToastState.success:
      break;
    case ToastState.error:
      break;
  }

  return color;
}

//=====================================================================
