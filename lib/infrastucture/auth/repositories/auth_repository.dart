import 'package:code_id_storage/code_id_storage.dart';
import 'package:flutter_dev_newshowcase/domain/auth/i_auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  AuthRepository();
  @override
  Future<Either<Unit, Unit>> checkAuth() async {
    try {
      await Storage.openBox('Auth');
      String? token = Storage.getData(key: 'token') as String?;
      if (token != null) {
        return right(unit);
      }
      return left(unit);
    } catch (e) {
      return left(unit);
    }
  }

  @override
  Future<void> close() async {
    await Storage.close();
  }
}
