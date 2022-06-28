import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/bloc/cubit/cubit.dart';
import 'package:shop_app/shared/bloc/cubit/states.dart';

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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.apps,
                ),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings',
              ),
            ],
            onTap: (index) {
              cubit.changeBottom(index);
              pageController.animateToPage(
                index,
                duration: const Duration(microseconds: 500),
                curve: Curves.ease,
              );
            },
          ),
        );
      },
    );
  }
}
