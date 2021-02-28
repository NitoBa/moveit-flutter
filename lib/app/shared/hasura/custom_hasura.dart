import 'package:hasura_connect/hasura_connect.dart';

import '../constants.dart';

class CustomHasuraConnect {
  HasuraConnect _hasuraConnect;

  HasuraConnect get hasura => _hasuraConnect;

  _initConfig([HasuraConnect client]) {
    if (client != null) {
      _hasuraConnect = client;
    } else {
      _hasuraConnect = HasuraConnect(BASE_URL);
    }
  }

  CustomHasuraConnect([HasuraConnect client]) {
    _initConfig(client);
  }
}
