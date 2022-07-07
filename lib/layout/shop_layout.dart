import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/cart/cart_screen.dart';
import 'package:shop_app/shared/bloc/cubit/cubit.dart';
import 'package:shop_app/shared/bloc/cubit/states.dart';
import 'package:shop_app/shared/styles/colors.dart';

import '../modules/categories/categories_screen.dart';
import '../modules/favorites/favorites_screen.dart';
import '../modules/products/product_screen.dart';
import '../modules/search/search_screen.dart';
import '../modules/settings/settings_screen.dart';
import '../shared/components/components.dart';

class ShopLayout extends StatelessWidget {
  var pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.get(context);
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
                splashColor: defaultColor,
                splashRadius: 20.0,
              ),
              IconButton(
                onPressed: () {
                  navigateTo(
                    context,
                    const CartScreen(),
                  );
                },
                icon: const Icon(Icons.shopping_cart_outlined),
                splashColor: defaultColor,
                splashRadius: 20.0,
              ),
            ],
          ),
          body: PageView(
            controller: pageController,
            children: const [
              ProductsScreen(),
              CategoriesScreen(),
              FavoritesScreen(),
              SettingsScreen(),
            ],
            onPageChanged: (newIndex) {
              cubit.changeBottom(newIndex);
            },
          ),
          bottomNavigationBar: BottomNavyBar(
            showElevation: true,
            itemCornerRadius: 24,
            selectedIndex: cubit.currentIndex,
            curve: Curves.ease,
            iconSize: 26.0,
            onItemSelected: (int index) {
              cubit.changeBottom(index);
              pageController.animateToPage(
                index,
                duration: const Duration(microseconds: 500),
                curve: Curves.easeIn,
              );
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: const Icon(Icons.apps),
                title: const Text('Home'),
                activeColor: Colors.red,
                inactiveColor: Colors.grey,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(Icons.category_outlined),
                title: const Text('Categories'),
                activeColor: Colors.purpleAccent,
                inactiveColor: Colors.grey,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(Icons.favorite_outline_sharp),
                title: const Text(
                  'Favorites',
                ),
                activeColor: Colors.pink,
                inactiveColor: Colors.grey,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(Icons.settings_outlined),
                title: const Text('Settings'),
                activeColor: Colors.blue,
                inactiveColor: Colors.grey,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
