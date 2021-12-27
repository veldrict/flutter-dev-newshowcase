import 'package:fpdart/fpdart.dart';

abstract class IAuthRepository {
  Future<Either<Unit, Unit>> checkAuth();
  Future<void> close();
}
