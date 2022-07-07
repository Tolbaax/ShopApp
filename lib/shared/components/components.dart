import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/modules/products/Product_details_screen.dart';
import 'package:shop_app/shared/styles/colors.dart';

import '../bloc/cubit/cubit.dart';

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

Widget buildListProduct(model, context, {bool isOldPrice = true}) {
  ShopCubit cubit = ShopCubit.get(context);
  return GestureDetector(
    onTap: () {
      navigateTo(context, ProductDetailsScreen(productId: model.id));
    },
    child: Padding(
      padding: const EdgeInsetsDirectional.all(20.0),
      child: SizedBox(
        height: 120.0,
        child: Row(
          children: [
            SizedBox(
              height: 120.0,
              width: 120.0,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage('${model.image}'),
                    width: 120.0,
                    height: 120.0,
                  ),
                  if (model.discount != 0 && isOldPrice)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.redAccent,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 2.0),
                      child: const Text(
                        'DISCOUNT',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    '${model.name}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      richText(
                        text: '${model.price}',
                        color: defaultColor,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (model.discount != 0 && isOldPrice)
                        Text(
                          '${model.oldPrice}',
                          style: TextStyle(
                            fontSize: 14.0,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.grey[700],
                            color: Colors.grey[700],
                          ),
                        ),
                      const Spacer(),
                      IconButton(
                        icon: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: cubit.favorites[model.id]
                              ? defaultColor
                              : Colors.grey,
                          child: const Icon(
                            Icons.favorite_rounded,
                            size: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        splashRadius: 20.0,
                        splashColor: cubit.favorites[model.id]
                            ? Colors.grey
                            : defaultColor,
                        onPressed: () {
                          cubit.changeFavorites(productId: model.id);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

//============================================================================

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

Widget deleteButton(context) {
  return InkWell(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.12,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: defaultColor,
            )),
        child: const Icon(
          Icons.delete_outline,
          color: defaultColor,
        ),
      ),
    ),
    highlightColor: Colors.transparent,
    radius: 0.0,
  );
}

//===========================================================================
