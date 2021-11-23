import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_newshowcase/application/auth/auth_bloc.dart';
import 'package:flutter_dev_newshowcase/presentation/routes/app_routes.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useAnimationController(duration: const Duration(seconds: 3));
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () => null,
          eitherAuthOrNot: (either) {
            either.match(
              (l) => context.replaceRoute(const LandingRouter()),
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
