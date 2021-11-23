import 'package:auto_route/auto_route.dart';
import 'package:flutter_dev_newshowcase/presentation/auth/login/login_page.dart';
import 'package:flutter_dev_newshowcase/presentation/auth/register/register_page.dart';
import 'package:flutter_dev_newshowcase/presentation/landing/cart/cart_page.dart';
import 'package:flutter_dev_newshowcase/presentation/landing/landing_page.dart';
import 'package:flutter_dev_newshowcase/presentation/landing/products/detail/products_detail_page.dart';
import 'package:flutter_dev_newshowcase/presentation/landing/products/products_page.dart';
import 'package:flutter_dev_newshowcase/presentation/landing/profile/profile_page.dart';
import 'package:flutter_dev_newshowcase/presentation/routes/routes.dart';
import 'package:flutter_dev_newshowcase/presentation/splash/splash_page.dart';

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
            ]),
        AutoRoute(
          name: 'ProfileRouter',
          path: Routes.profile,
          page: ProfilePage,
        ),
      ],
    ),
    AutoRoute(
      name: 'CartRouter',
      path: Routes.cart,
      page: CartPage,
    ),
  ],
)
class $AppRoute {}
