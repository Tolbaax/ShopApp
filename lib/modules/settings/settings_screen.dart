import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/bloc/cubit/cubit.dart';

import '../../shared/bloc/cubit/states.dart';
import '../../shared/components/components.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        // var model = ShopCubit.get(context).userModel;
        // nameController.text = model!.data!.name!;
        // emailController.text = model.data!.email!;
        // phoneController.text = model.data!.phone!;
        return Padding(
          padding: const EdgeInsetsDirectional.all(20.0),
          child: Column(
            children: [
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
            ],
          ),
        );
      },
    );
  }
}
