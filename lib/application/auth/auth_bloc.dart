import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_dev_newshowcase/domain/auth/i_auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _repo;

  AuthBloc(this._repo) : super(const _Initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        started: () async {
          await Future.delayed(const Duration(seconds: 3));
          final resp = await _repo.checkAuth();
          // emit()
          emit(
            AuthState.eitherAuthOrNot(either: resp),
          );
        },
      );
    });
  }
}
