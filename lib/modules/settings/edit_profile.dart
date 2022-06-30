import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/bloc/cubit/cubit.dart';
import 'package:shop_app/shared/bloc/cubit/states.dart';
import 'package:shop_app/shared/styles/colors.dart';

import '../../shared/components/components.dart';

class EditProfileScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopSuccessUpdateUserState) {
          if (state.loginModel.status!) {
            FocusScope.of(context).unfocus();
            showToast(
              text: state.loginModel.message!,
              state: ToastState.success,
            );
          } else {
            showToast(
              text: state.loginModel.message!,
              state: ToastState.error,
            );
          }
        }
      },
      builder: (context, state) {
        var model = ShopCubit.get(context).userModel;
        nameController.text = model!.data.name;
        emailController.text = model.data.email;
        phoneController.text = model.data.phone;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Welcome ${model.data.name.split(" ").elementAt(0)}...",
              maxLines: 1,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: defaultColor,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: ConditionalBuilder(
            condition: state is! ShopLoadingUserDataState,
            builder: (context) => Padding(
              padding: const EdgeInsetsDirectional.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    if (state is ShopLoadingUpdateUserState)
                      const LinearProgressIndicator(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Name';
                        }
                        return null;
                      },
                      prefix: Icons.person,
                      label: 'Name',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Email';
                        }
                        return null;
                      },
                      prefix: Icons.email,
                      label: 'Email',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Phone Number';
                        }
                        return null;
                      },
                      prefix: Icons.phone,
                      label: 'Phone',
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    defaultButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          ShopCubit.get(context).updateUserData(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                          );
                          return null;
                        }
                      },
                      text: 'UPDATE',
                    ),
                  ],
                ),
              ),
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
