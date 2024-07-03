import 'package:hummus_admin_panel/core/networkV2/models/network_exception.dart';
import 'package:hummus_admin_panel/core/networkV2/models/network_method.dart';
import 'package:hummus_admin_panel/core/networkV2/services/network/delete_network_service.dart';
import 'package:hummus_admin_panel/core/networkV2/services/network/get_netowrk_service.dart';
import 'package:hummus_admin_panel/core/networkV2/services/network/post_network_multipart_service.dart';
import 'package:hummus_admin_panel/core/networkV2/services/network/put_network_multipart_service.dart';
import 'package:hummus_admin_panel/core/networkV2/services/network/put_network_service.dart';
import 'package:logger/logger.dart';

import 'post_network_service.dart';
import 'network_service.dart';
import 'package:http/http.dart' as http;

class NetworkServiceFactory {
  static NetworkService<T> create<T>(NetworkMethod method, String errorKey,
      {Duration timeoutDuration = const Duration(seconds: 30)}) {
    final client = http.Client();
    final logger = Logger();

    switch (method) {
      case NetworkMethod.get:
        return GetNetworkService<T>(client, logger, errorKey,
            timeoutDuration: timeoutDuration);
      case NetworkMethod.post:
        return PostNetworkService<T>(client, logger, errorKey,
            timeoutDuration: timeoutDuration);
      case NetworkMethod.postMultipart:
        return PostMultipartNetworkService<T>(client, logger, errorKey,
            timeoutDuration: timeoutDuration);
      case NetworkMethod.delete:
        return DeleteNetworkService<T>(client, logger, errorKey,
            timeoutDuration: timeoutDuration);
      case NetworkMethod.putMultipart:
        return PutMultipartNetworkService<T>(client, logger, errorKey,
            timeoutDuration: timeoutDuration);
      case NetworkMethod.put:
        return PutNetworkService<T>(client, logger, errorKey,
            timeoutDuration: timeoutDuration);
      default:
        throw NetworkException("Unsupported method: $method");
    }
  }
}
