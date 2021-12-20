import 'package:code_id_flutter/code_id_flutter.dart';

import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @Named('baseUrlA')
  String get baseUrlA => 'https://fakestoreapi.com';

  @Named('baseUrlB')
  String get baseUrlB => 'http://api.fakeshop-api.com';

  @Named('networkA')
  @preResolve
  Future<INetworkService> networkA({
    @Named('baseUrlA') required String baseUrl,
  }) async {
    return _setupNetwork(baseUrl);
  }

  @Named('networkB')
  @preResolve
  Future<INetworkService> networkB({
    @Named('baseUrlB') required String baseUrl,
  }) async {
    return _setupNetwork(baseUrl);
  }

  Future<INetworkService> _setupNetwork(String baseUrl) async {
    IStorage storage = Storage;
    await storage.openBox('auth');
    final _client = NetworkService(baseUrl: baseUrl);

    _client.addInterceptors([
      AuthInterceptor(storage: storage, authKey: 'token'),
    ]);
    return _client;
  }
}
