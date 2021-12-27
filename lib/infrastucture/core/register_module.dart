import 'package:code_id_network/code_id_network.dart';
import 'package:code_id_storage/code_id_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @Named('baseUrl')
  String get baseUrlA => 'https://fakestoreapi.com';

  @preResolve
  Future<INetworkService> network({
    @Named('baseUrl') required String baseUrl,
  }) async {
    return _setupNetwork(baseUrl);
  }

  Future<INetworkService> _setupNetwork(String baseUrl) async {
    IStorage storage = Storage;
    await storage.openBox('auth');
    final _client = NetworkService(baseUrl: baseUrl);

    _client.addInterceptors([
      AuthInterceptor(
        storage: storage,
        authKey: 'token',
        authHeadersBuilder: (token) {
          if (token != null) {
            return {'token': token};
          }
          return null;
        },
      ),
    ]);
    return _client;
  }
}
