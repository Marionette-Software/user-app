import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:gql_websocket_link/gql_websocket_link.dart';
import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Initialize the GraphQL client
/// [url] is the url of the GraphQL server (without https://, optional)
/// [token] is the token of the user (optional)

Client initClientWithHeader({String? url, String? token}) {
  final HttpLink link;
  var userBox = Hive.box<UserConfigData>(Constants.userConfig);
  var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
  UserConfigData userData = userBox.getAt(0)!;
  GlobalConfigData globalData = box.getAt(0)!;

  final headers = {
    "Authorization": "Bearer ${token ?? userData.token}",
  };
  link = HttpLink(
    'https://${url ?? globalData.url}/graphql',
    defaultHeaders: headers,
  );
  final client = Client(
    link: link,
    cache: Cache(
      store: MemoryStore(),
    ),
  );
  return client;
}

Client initClient(String url) {
  final HttpLink link;
  link = HttpLink('https://$url/graphql');
  final client = Client(
    link: link,
    cache: Cache(
      store: MemoryStore(),
    ),
  );
  return client;
}

Client subscriptionClient(String url) {
  final WebSocketLink link;
  link = WebSocketLink(
    null,
    autoReconnect: true,
    reconnectInterval: const Duration(seconds: 30),
    // initialPayload: () => {
    //   "subscriptionParam": arg,
    // },
    channelGenerator: () => WebSocketChannel.connect(
      Uri.parse('wss://$url/graphql'),
      protocols: ['graphql-ws'],
    ),
  );
  final client = Client(
    link: link,
    cache: Cache(
      store: MemoryStore(),
    ),
  );
  return client;
}
