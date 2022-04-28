import 'package:code_id_storage/code_id_storage.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_newshowcase/domain/auth/i_auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  AuthRepository();
  @override
  Future<Either<Unit, Unit>> checkAuth() async {
    try {
      // await Storage.openBox('Auth');
      // Storage.putDatum(key: 'token', value: '123');
      // String? token = Storage.getData(key: 'token') as String?;
      // if (token != null) {
      //   return right(unit);
      // }

      await Storage.openBox('Users');
      Iterable listUsers = [
        {'user': 'John', 'password': '123'},
        {'user': 'Doe', 'password': '123'}
      ];
      await Storage.clear();
      await Storage.putListData(dataList: listUsers);
      IList? datas = Storage.getListData();
      debugPrint(datas.toString());
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
