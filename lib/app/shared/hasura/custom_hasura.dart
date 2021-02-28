import 'package:hasura_connect/hasura_connect.dart';

import '../constants.dart';

class CustomHasuraConnect {
  HasuraConnect _hasuraConnect;

  HasuraConnect get hasura => _hasuraConnect;

  _initConfig([HasuraConnect client]) {
    if (client != null) {
      _hasuraConnect = client;
    } else {
      final interceptor = _HasuraInterceptors();
      _hasuraConnect = HasuraConnect(BASE_URL, interceptors: [interceptor]);
    }
  }

  CustomHasuraConnect([HasuraConnect client]) {
    _initConfig(client);
  }
}

class _HasuraInterceptors extends Interceptor {
  @override
  Future<void> onConnected(HasuraConnect connect) async {
    return connect;
  }

  @override
  Future<void> onDisconnected() async {
    return;
  }

  @override
  Future onError(HasuraError request) async {
    return request;
  }

  @override
  Future onRequest(Request request) async {
    print("ON REQUEST");
    request.headers['x-hasura-admin-secret'] = HASURA_ADM_SECRECT;
    return request;
  }

  @override
  Future onResponse(Response data) async {
    return data;
  }

  @override
  Future<void> onSubscription(Request request, Snapshot snapshot) async {}

  @override
  Future<void> onTryAgain(HasuraConnect connect) async {}
}
