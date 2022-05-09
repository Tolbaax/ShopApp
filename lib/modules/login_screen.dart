import 'package:flutter/material.dart';
import 'package:shop_app/modules/register_screen.dart';
import 'package:shop_app/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LOGIN',
                    style: Theme.of(context).textTheme.headline4!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Login now to browse our hot offers',
                    style: Theme.of(context).textTheme.bodyText1!
                        .copyWith(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 30,
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
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      prefix: Icons.password,
                      suffix: Icons.visibility_outlined,
                      isPassword: true,
                      suffixPressed: () {
                        setState(() {});
                      },
                      label: 'Password',
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Password';
                        }
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                      function: () {
                        formKey.currentState!.validate();
                        FocusScope.of(context).unfocus();
                        print(emailController.text);
                        print(passwordController.text);
                      },
                      text: 'LOGIN'),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {
                          navigateTo(context, const RegisterScreen());
                        },
                        child: const Text('REGISTER'),
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
  }
}
