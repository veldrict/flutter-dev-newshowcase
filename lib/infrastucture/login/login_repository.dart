import 'package:flutter_dev_newshowcase/domain/login/i_login_repository.dart';
import 'package:fpdart/fpdart.dart';

import 'package:injectable/injectable.dart';

@LazySingleton(as: ILoginRepository)
class LoginRepository implements ILoginRepository {
  @override
  Future<Either<Unit, Unit>> onLogin({
    required String username,
    required String password,
  }) {
    // TODO: implement onLogin
    throw UnimplementedError();
  }
}
