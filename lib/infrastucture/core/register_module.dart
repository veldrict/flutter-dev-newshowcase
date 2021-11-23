import 'package:code_id_flutter/code_interceptors/code_interceptors.dart';
import 'package:code_id_flutter/code_interfaces/storage/i_storage.dart';
import 'package:code_id_flutter/code_services/code_services.dart';
import 'package:code_id_flutter/code_services/services/network_service.dart';

import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @Named('baseUrl')
  String get baseUrl => 'https://fakestoreapi.com';

  @preResolve
  @lazySingleton
  Future<NetworkService> network({
    @Named('baseUrl') required String baseUrl,
  }) async {
    IStorage storage = Storage;
    await storage.openBox('auth');
    final _client = NetworkService(baseUrl: baseUrl);

    _client.addInterceptors([
      AuthInterceptor(storage: storage, authKey: 'token'),
    ]);
    return _client;
  }
}
