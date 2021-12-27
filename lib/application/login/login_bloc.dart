import 'package:bloc/bloc.dart';
import 'package:code_id_network/code_id_network.dart';

import 'package:flutter_dev_newshowcase/domain/login/i_login_repository.dart';
import 'package:flutter_dev_newshowcase/domain/login/login_objects.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ILoginRepository loginRepository;

  LoginBloc(this.loginRepository) : super(LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.when(
        usernameChange: (input) async =>
            emit(state.copyWith(username: LoginUsername(input))),
        passwordChange: (input) async =>
            emit(state.copyWith(password: LoginPassword(input))),
        submit: () async {},
      );
    });
  }
}
