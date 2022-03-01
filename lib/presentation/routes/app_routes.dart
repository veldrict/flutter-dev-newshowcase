import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_newshowcase/presentation/core/wrapper/profile/profile_wrapper_page.dart';
import 'package:flutter_dev_newshowcase/presentation/pages/landing/feed/feed_page.dart';
import 'package:flutter_dev_newshowcase/presentation/pages/landing/transaction/transaction_page.dart';
import 'package:flutter_dev_newshowcase/presentation/pages/official/official_page.dart';
import 'package:flutter_dev_newshowcase/presentation/routes/routes.dart';
import 'package:flutter_dev_newshowcase/presentation/pages.dart';

part 'app_routes.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      name: 'SplashRouter',
      path: Routes.main,
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(
      name: 'LoginRouter',
      path: Routes.login,
      page: LoginPage,
    ),
    AutoRoute(
      name: 'RegisterRouter',
      path: Routes.register,
      page: RegisterPage,
    ),
    AutoRoute(
      name: 'LandingRouter',
      path: Routes.landing,
      page: LandingPage,
      children: [
        AutoRoute(
          name: 'ProductsRouter',
          path: Routes.products,
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: ProductsPage,
            ),
            AutoRoute(
              path: ':productId',
              page: ProductsDetailPage,
            ),
          ],
        ),
        AutoRoute(
          name: 'FeedRouter',
          path: Routes.feed,
          page: FeedPage,
        ),
        AutoRoute(
          name: 'OfficialStoreRouter',
          path: Routes.officialStore,
          page: OfficialPage,
        ),
        AutoRoute(
          name: 'WishListRouter',
          path: Routes.wishList,
          page: WishlistPage,
        ),
        AutoRoute(
          name: 'TransactionRouter',
          path: Routes.transaction,
          page: TransactionPage,
        ),
      ],
    ),
    AutoRoute(
      name: 'ProfileRouter',
      path: Routes.profile,
      page: ProfileWrapperPage,
      children: [
        AutoRoute(
          path: '',
          page: ProfilePage,
        ),
        AutoRoute(
          name: 'EditProfileRouter',
          path: Routes.editProfile,
          page: EditProfilePage,
        ),
      ],
    ),
    AutoRoute(
      name: 'CartRouter',
      path: Routes.cart,
      page: CartPage,
    )
  ],
)
class AppRoute extends _$AppRoute {}
