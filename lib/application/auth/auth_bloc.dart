import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_dev_newshowcase/domain/auth/i_auth_repository.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _repo;

  AuthBloc(this._repo) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        started: () async {
          await Future.delayed(const Duration(seconds: 3));
          final resp = await _repo.checkAuth();

          // emit()
          emit(
            resp.fold(
              (l) => const AuthState.authenticated(),
              (r) => const AuthState.authenticated(),
            ),
          );
        },
      );
    });
  }

  @override
  Future<void> close() async {
    await _repo.close();
    return super.close();
  }
}
