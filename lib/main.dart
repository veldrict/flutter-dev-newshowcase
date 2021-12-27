import 'package:code_id_storage/code_id_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_newshowcase/application/cart/cart_bloc.dart';
import 'package:flutter_dev_newshowcase/injection.dart';
import 'package:flutter_dev_newshowcase/presentation/core/i10n/l10n.dart';
import 'package:flutter_dev_newshowcase/presentation/routes/app_routes.dart';

import 'package:flutter_dev_newshowcase/simple_bloc_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:injectable/injectable.dart';

void main() async {
  await Storage.init();
  await configureInjection(Environment.dev);
  // runApp(const MyApp());
  // await runZoned(() async { const MyApp()});
  await BlocOverrides.runZoned(
    () async {
      runApp(
        BlocProvider<CartBloc>(
          create: (context) => getIt<CartBloc>(),
          child: MyApp(),
        ),
      );
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AppRoute appRoute = AppRoute();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      routeInformationParser: appRoute.defaultRouteParser(),
      routerDelegate: appRoute.delegate(),
      localizationsDelegates: const [
        I10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: I10n.delegate.supportedLocales,
    );
  }
}
