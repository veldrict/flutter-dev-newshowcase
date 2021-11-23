import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_newshowcase/presentation/routes/app_routes.gr.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) {
        return AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () {
                context.pushRoute(const CartRouter());
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.blue,
              ),
            )
          ],
        );
      },
      routes: const [ProductsRouter(), ProfileRouter()],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 40,
            ),
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              SalomonBottomBarItem(
                selectedColor: Colors.redAccent,
                icon: const Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                title: const Text('Home'),
              ),
              SalomonBottomBarItem(
                selectedColor: Colors.blue.shade200,
                icon: const Icon(
                  Icons.person_outline,
                  size: 30,
                ),
                title: const Text('Profile'),
              ),
            ]);
      },
    );
  }
}
