import 'package:either_dart/either.dart';
import 'package:hummus_admin_panel/core/networkV2/models/network_exception.dart';
import 'package:hummus_admin_panel/core/networkV2/models/typedefs.dart';


import 'network_service.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class PostMultipartNetworkService<T> extends NetworkService<T> {
  PostMultipartNetworkService(super.client, super.logger, super.errorKey,
      {super.timeoutDuration});

  @override
  FutureEitherType<T> request(String url,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      Map<String, String>? fields,
      Map<String, String>? files}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      headers?.forEach((key, value) {
        request.headers[key] = value;
      });

      fields?.forEach((key, value) {
        request.fields[key] = value;
      });

      if (files != null) {
        for (var entry in files.entries) {
          request.files
              .add(await http.MultipartFile.fromPath(entry.key, entry.value));
        }
      }

      var streamedResponse = await request.send().timeout(timeoutDuration);
      var response = await http.Response.fromStream(streamedResponse);
      final result = processResponse(response);
      return Right(result);
    } on TimeoutException {
      return Left(TimeoutException("Request timeout"));
    } on http.ClientException catch (e) {
      return Left(NetworkException(e.toString()));
    } on SocketException {
      return Left(NoInternetException("No internet connection"));
    } catch (e) {
      handleError("POST Multipart", url, e);
      return Left(UnexpectedException(e.toString()));
    }
  }

  @override
  T parseResponseBody(dynamic responseBody) {
    return responseBody as T;
  }
}
