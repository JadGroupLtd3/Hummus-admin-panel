import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/core/networkV2/models/network_exception.dart';
import 'package:hummus_admin_panel/core/networkV2/models/typedefs.dart';

import 'network_service.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class GetNetworkService<T> extends NetworkService<T> {
  GetNetworkService(super.client, super.logger, super.errorKey,
      {super.timeoutDuration});

  @override
  FutureEitherType<T> request(String url,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      Map<String, String>? fields,
      Map<String, String>? files}) async {
    try {
      final response = await client
          .get(Uri.parse(url), headers: mergeHeaders(headers))
          .timeout(timeoutDuration);
      final result = processResponse(response);
      return Right(result);
    } on TimeoutException {
      return Left(TimeoutException("Request timeout"));
    } on http.ClientException catch (e) {
      return Left(NetworkException(e.toString()));
    } on SocketException {
      return Left(NoInternetException("No internet connection"));
    } catch (e) {
      handleError("GET", url, e);
      return Left(UnexpectedException(e.toString()));
    }
  }

  @override
  T parseResponseBody(dynamic responseBody) {
    return responseBody as T;
  }
}
