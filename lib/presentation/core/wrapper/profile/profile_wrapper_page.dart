import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_newshowcase/application/profile/profile_bloc.dart';
import 'package:flutter_dev_newshowcase/injection.dart';

class ProfileWrapperPage extends StatelessWidget {
  const ProfileWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => getIt<ProfileBloc>(),
      child: const AutoRouter(),
    );
  }
}
