import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_newshowcase/presentation/core/i10n/l10n.dart';
import 'package:flutter_dev_newshowcase/presentation/routes/app_routes.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    I10n i10n = I10n.of(context);
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
      routes: const [
        ProductsRouter(),
        FeedRouter(),
        OfficialStoreRouter(),
        WishListRouter(),
        TransactionRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
            margin: const EdgeInsets.symmetric(
              // horizontal: 20,
              vertical: 40,
            ),
            // itemShape: ,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              SalomonBottomBarItem(
                selectedColor: Colors.blueAccent,
                icon: const Icon(
                  Icons.home,
                  // size: 20,
                ),
                title: Text(i10n.home),
              ),
              SalomonBottomBarItem(
                selectedColor: Colors.blueAccent,
                icon: const Icon(
                  Icons.feed,
                  // size: 20,
                ),
                title: Text(i10n.feed),
              ),
              SalomonBottomBarItem(
                selectedColor: Colors.purple.shade400,
                icon: const Icon(
                  Icons.store,
                  // size: 20,
                ),
                title: Text(i10n.officialStore),
              ),
              SalomonBottomBarItem(
                selectedColor: Colors.blueAccent,
                icon: const Icon(
                  Icons.favorite,
                  // size: 20,
                ),
                title: Text(i10n.wishlist),
              ),
              SalomonBottomBarItem(
                selectedColor: Colors.blueAccent,
                icon: const Icon(
                  Icons.sticky_note_2_rounded,
                  // size: 20,
                ),
                title: Text(
                  i10n.transaction,
                  // softWrap: true,
                ),
              ),
            ]);
      },
    );
  }
}
