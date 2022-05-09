import 'package:flutter/material.dart';
import 'package:shop_app/shared/styles/colors.dart';

Widget defaultFormField({
  String? Function(String?)? onChange,
  required String? Function(String?)? validate,
  required TextEditingController controller,
  void Function()? suffixPressed,
  required TextInputType type,
  required IconData prefix,
  required String label,
  bool readOnly = false,
  Function()? onTab,
  bool isPassword = false,
  IconData? suffix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validate,
      onChanged: onChange,
      obscureText: isPassword,
      onTap: onTab,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffix: GestureDetector(
          onTap: ()
          {
            suffixPressed;
          },
          child: Icon(
            suffix,
            color: defaultColor,
          ),
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
