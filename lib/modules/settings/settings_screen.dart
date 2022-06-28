import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/bloc/cubit/cubit.dart';
import 'package:shop_app/shared/bloc/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';

import 'edit_Profile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsetsDirectional.all(20.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.person_outline,
                      size: 28,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Divider(
                  thickness: 1,
                ),
                ListTile(
                  leading: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    navigateTo(context, EditProfileScreen());
                  },
                ),
                const ListTile(
                  leading: Text(
                    'Change Password',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                const ListTile(
                  leading: Text(
                    'Privacy',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.graphic_eq,
                      size: 28,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'General',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Divider(
                  thickness: 1,
                ),
                ListTile(
                  leading: const Text(
                    'Dark Mode',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Switch(
                    value: ShopCubit.get(context).isDark,
                    onChanged: (value) {
                      ShopCubit.get(context).changeTheme(value);
                    },
                  ),
                ),
                ListTile(
                  leading: const Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Switch(
                    value: ShopCubit.get(context).isNotify,
                    onChanged: (value) {
                      ShopCubit.get(context).changeNotification(value);
                    },
                  ),
                ),
                const ListTile(
                  leading: Text(
                    'Language',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                const ListTile(
                  leading: Text(
                    'Country',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.logout,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'LOGOUT',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
