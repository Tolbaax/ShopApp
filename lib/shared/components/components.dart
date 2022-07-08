import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/shared/styles/colors.dart';

Widget defaultFormField({
  String? Function(String?)? onChange,
  String? Function(String?)? onSubmit,
  required String? Function(String?)? validate,
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function()? suffixTab,
  bool isPassword = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validate,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      obscureText: isPassword,
      style: const TextStyle(fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: (suffix != null)
            ? InkWell(
                onTap: suffixTab,
                child: Icon(
                  suffix,
                ),
                radius: 0.0,
                highlightColor: Colors.transparent,
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

Widget richText({
  required String text,
  double size = 20.0,
  Color color = Colors.black,
}) {
  return RichText(
      text: TextSpan(children: [
    WidgetSpan(
        child: Transform.translate(
      offset: const Offset(-1, -5),
      child: Text(
        '\$',
        style: TextStyle(
          color: color,
        ),
        textScaleFactor: 1.15,
      ),
    )),
    TextSpan(
        text: text,
        style: TextStyle(
          fontSize: size,
          color: color,
        )),
  ]));
}

//==========================================================================

Widget backButton(context) {
  return Padding(
    padding: const EdgeInsetsDirectional.all(6.0),
    child: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: defaultColor,
            )),
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: defaultColor,
        ),
      ),
      highlightColor: Colors.transparent,
      radius: 0.0,
    ),
  );
}

//========================================================================
