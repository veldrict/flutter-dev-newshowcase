import 'dart:html';

import 'package:code_id_flutter/code_id_flutter.dart';

import 'package:flutter_dev_newshowcase/domain/login/i_login_repository.dart';
import 'package:fpdart/fpdart.dart';

import 'package:injectable/injectable.dart';

@LazySingleton(as: ILoginRepository)
class LoginRepository implements ILoginRepository {
  final INetworkService _networkService;
  const LoginRepository(this._networkService);

  @override
  Future<Either<Unit, Unit>> onLogin({
    required String username,
    required String password,
  }) async {
    try {
      IStorage storage = Storage;
      await storage.openBox('auth');
      var resp = await _networkService.postHttp(
        path: '/login',
        content: {
          'username': username,
          password: password,
        },
      );

      return resp.fold(
        (l) => left(unit),
        (r) {
          Map<String, dynamic> json = r as Map<String, dynamic>;
          storage.putDanum(key: 'token', value: json['token']);
          return right(unit);
        },
      );
    } catch (e) {
      return left(unit);
    }
  }
}
