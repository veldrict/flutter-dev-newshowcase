import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code_id_flutter/code_services/code_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_newshowcase/injection.dart';
import 'package:flutter_dev_newshowcase/presentation/routes/app_routes.gr.dart';
import 'package:flutter_dev_newshowcase/simple_bloc_delegate.dart';
import 'package:injectable/injectable.dart';

void main() async {
  await Storage.init();
  await configureInjection(Environment.dev);
  // runApp(const MyApp());
  // await runZoned(() async { const MyApp()});
  await BlocOverrides.runZoned(
    () async => runApp(const MyApp()),
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppRoute _appRoute = AppRoute(GlobalKey<NavigatorState>());
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      routeInformationParser: _appRoute.defaultRouteParser(),
      routerDelegate: _appRoute.delegate(),
    );
  }
}
