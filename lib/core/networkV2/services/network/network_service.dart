import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:hummus_admin_panel/core/networkV2/models/network_exception.dart';
import 'package:hummus_admin_panel/core/networkV2/models/typedefs.dart';
import 'package:logger/logger.dart';

abstract class NetworkService<T> {
  final http.Client client;
  final Logger logger;
  final String errorKey;
  final Duration timeoutDuration;
  final Map<String, String> defaultHeaders = {
    'Authorization': 'Bearer token',
    'Content-Type': 'application/json'
  };

  NetworkService(this.client, this.logger, this.errorKey,
      {this.timeoutDuration = const Duration(seconds: 30)});

  FutureEitherType<T> request(String url,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      Map<String, String>? fields,
      Map<String, String>? files});

  T parseResponseBody(dynamic responseBody);

  T processResponse(http.Response response) {
    if (response.statusCode >= 500) {
      throw ServerException("Server error: ${response.statusCode}");
    }

    final responseBody = json.decode(response.body);

    if (responseBody.containsKey(errorKey) && responseBody[errorKey] != null) {
      throw ApiErrorException(responseBody[errorKey]);
    }

    switch (response.statusCode) {
      case 200:
      case 201:
        return parseResponseBody(responseBody);
      case 400:
        throw BadRequestException("Bad request: ${response.body}");
      case 401:
      case 403:
        throw UnauthorizedException("Unauthorized: ${response.body}");
      case 404:
        throw NotFoundException("Not found: ${response.body}");
      default:
        throw UnexpectedException("Unknown error: ${response.body}");
    }
  }

  void handleError(String method, String url, dynamic error) {
    logger.e("$method request failed: $url", error: error);
    // _sendErrorLogToEmail(error.toString());
    if (error is http.ClientException) {
      throw NetworkException("Client exception: ${error.message}");
    } else if (error is TimeoutException) {
      throw TimeoutException("Request timeout: $url");
    } else if (error is SocketException) {
      throw NoInternetException("No internet connection: $url");
    } else {
      throw UnexpectedException("Unexpected error: ${error.toString()}");
    }
  }

  // void _sendErrorLogToEmail(String error) async {
  //   final Email email = Email(
  //     body: 'Error: $error',
  //     subject: 'Network Error Log',
  //     recipients: ['your-email@example.com'],
  //     isHTML: false,
  //   );

  //   try {
  //     await FlutterEmailSender.send(email);
  //   } catch (e) {
  //     logger.e("Failed to send error log email", error: e);
  //   }
  // }

  Map<String, String> mergeHeaders(Map<String, String>? headers) {
    return {...defaultHeaders, if (headers != null) ...headers};
  }
}
