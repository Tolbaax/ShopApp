import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/login/login_screen.dart';

import '../../layout/shop_layout.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state) {
          if (state is ShopRegisterSuccessState) {
            if (state.loginModel.status!) {
              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data.token,
              ).then((value) {
                token = state.loginModel.data.token;
                navigateAndRemoveUntil(context, ShopLayout());
              });
            } else {
              showToast(
                text: state.loginModel.message!,
                state: ToastState.error,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Padding(
                padding: const EdgeInsetsDirectional.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Register now to browse our hot offers',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        defaultFormField(
                            controller: nameController,
                            type: TextInputType.name,
                            prefix: Icons.person,
                            label: 'Name',
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Name';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 25.0,
                        ),
                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            prefix: Icons.email_outlined,
                            label: 'Email',
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Email';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 25.0,
                        ),
                        defaultFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            prefix: Icons.lock_outline_rounded,
                            suffix: ShopRegisterCubit.get(context).suffix,
                            suffixTab: () {
                              ShopRegisterCubit.get(context)
                                  .changePasswordVisibility();
                            },
                            isPassword:
                                ShopRegisterCubit.get(context).isPassword,
                            label: 'Password',
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Password';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 25.0,
                        ),
                        defaultFormField(
                            controller: phoneController,
                            type: TextInputType.phone,
                            prefix: Icons.phone,
                            label: 'Phone',
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Phone';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                ShopRegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                );
                              }
                              FocusScope.of(context).unfocus();
                            },
                            text: 'REGISTER',
                          ),
                          fallback: (BuildContext context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(fontSize: 17.0),
                            ),
                            TextButton(
                              onPressed: () {
                                navigateTo(
                                  context,
                                  LoginScreen(),
                                );
                              },
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(fontSize: 17.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
