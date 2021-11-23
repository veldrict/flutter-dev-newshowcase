import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_newshowcase/application/auth/auth_bloc.dart';
import 'package:flutter_dev_newshowcase/injection.dart';
import 'package:flutter_dev_newshowcase/presentation/splash/widgets/splash_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('SplashPage');
    return BlocProvider<AuthBloc>(
      create: (context) => getIt<AuthBloc>()..add(const AuthEvent.started()),
      child: const Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
