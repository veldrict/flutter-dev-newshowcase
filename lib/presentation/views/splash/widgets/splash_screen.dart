import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_newshowcase/application/auth/auth_bloc.dart';

import 'package:flutter_dev_newshowcase/presentation/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () => null,
          eitherAuthOrNot: (either) {
            either.match(
              (l) => context.replaceRoute(const LoginRouter()),
              (r) => context.replaceRoute(const LandingRouter()),
            );
          },
        );
      },
      child: const Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
