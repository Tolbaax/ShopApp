import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/search/search_screen.dart';
import 'package:shop_app/shared/bloc/cubit/cubit.dart';
import 'package:shop_app/shared/bloc/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Shop App',
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    navigateTo(
                      context,
                      SearchScreen(),
                    );
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavyBar(
              showElevation: true,
              itemCornerRadius: 24,
              selectedIndex: cubit.currentIndex,
              curve: Curves.easeIn,
              iconSize: 24.0,
              onItemSelected: (int index) {
                cubit.changeBottom(index);
              },
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  icon: const Icon(Icons.apps),
                  title: const Text('Home'),
                  activeColor: Colors.red,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: const Icon(Icons.category_outlined),
                  title: const Text('Categories'),
                  activeColor: Colors.purpleAccent,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: const Icon(Icons.favorite_rounded),
                  title: const Text(
                    'Favorites',
                  ),
                  activeColor: Colors.pink,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  activeColor: Colors.blue,
                  textAlign: TextAlign.center,
                ),
              ],
            ));
      },
    );
  }
}
