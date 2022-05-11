import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultFormField({
  String? Function(String?)? onChange,
  String? Function(String?)? onSubmit,
  required String? Function(String?)? validate,
  required TextEditingController controller,
  Function? suffixPressed,
  required TextInputType type,
  required IconData prefix,
  IconData? suffix,
  required String label,
  bool readOnly = false,
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
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: IconButton(
          icon: Icon(suffix),
          onPressed: (){
            suffixPressed!();
          },
        ),
        border: const OutlineInputBorder(),
      ),
    );


Widget defaultButton({
  double width = double.infinity,
  double height = 45.0,
  Color backgroundColor = Colors.blue,
  required Function() function,
  required String text,
}) => Container(
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
      style: const TextStyle(color: Colors.white,fontSize: 18,
      ),
    ),
  ),
);

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));


void navigateAndRemoveUntil(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

void showToast({
  required String text,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

// enum
enum ToastState {success, error, warning}

Color? chooseToastColor(ToastState state)
{

  Color? color;

  switch(state)
  {
    case ToastState.success:
      color =  Colors.green;
      break;
    case ToastState.error:
      break;
    case ToastState.warning:
      break;
  }

  switch(state)
  {
    case ToastState.error:
      color =  Colors.red;
      break;
    case ToastState.success:
      break;
    case ToastState.warning:
      break;
  }

  switch(state)
  {
    case ToastState.warning:
      color =  Colors.amber;
      break;
    case ToastState.success:
      break;
    case ToastState.error:
      break;
  }

  return color;
}
