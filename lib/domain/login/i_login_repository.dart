import 'package:fpdart/fpdart.dart';

abstract class ILoginRepository {
  Future<Either<Unit, Unit>> onLogin({
    required String username,
    required String password,
  });
}
