import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http_parser/src/media_type.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as Http;
import 'package:hummus_admin_panel/core/helper/preferences_helper.dart';
import 'package:hummus_admin_panel/core/network/model/errors_model.dart';
import 'package:hummus_admin_panel/core/utils/api_url.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

class ApiClient extends GetxService {
  static const String noInternetMessage = 'connection_to_api_server_failed';
  static const int timeoutInSeconds = 30;
  String? token;
  static var mainHeaders = {
    'content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${PrefsHelper.getToken()}'
  };

  static Response handleResponse(Http.Response response, String? uri) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (e) {}
    Response response0 = Response(
      body: body ?? response.body,
      bodyString: response.body.toString(),
      request: Request(
          headers: response.request!.headers,
          method: response.request!.method,
          url: response.request!.url),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
    if (response0.statusCode != 200 &&
        response0.body != null &&
        response0.body is! String) {
      if (response0.body.toString().startsWith('{response_code:')) {
        ErrorsModel errorResponse = ErrorsModel.fromJson(response0.body);
        response0 = Response(
            statusCode: response0.statusCode,
            body: response0.body,
            statusText: errorResponse.responseCode);
      } else if (response0.body.toString().startsWith('{message')) {
        response0 = Response(
            statusCode: response0.statusCode,
            body: response0.body,
            statusText: response0.body['message']);
      }
    } else if (response0.statusCode != 200 && response0.body == null) {
      response0 = const Response(statusCode: 0, statusText: noInternetMessage);
    }
    //debugPrint('====> API Response: [${_response.statusCode}] $uri\n${_response.body}');
    return response0;
  }

  static Future<Response> putData(String? uri, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      Http.Response response = await Http.put(
        Uri.parse('${ApiUrl.BASE_URL}$uri'),
        body: jsonEncode(body),
        headers: headers,
      ).timeout(const Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  static Future<Response> postDataLogIn(String? uri, dynamic body,
      {Map<String, String>? headers}) async {
    Http.Response _response = await Http.post(
      Uri.parse('${ApiUrl.LOGIN_BASE_URL}$uri'),
      body: jsonEncode(body),
      headers: headers ?? mainHeaders,
    ).timeout(const Duration(seconds: timeoutInSeconds));
    try {
      return handleResponse(_response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  static Future<Response> postData(String? uri, dynamic body,
      {Map<String, String>? headers}) async {
    Http.Response _response = await Http.post(
      Uri.parse('${ApiUrl.BASE_URL}$uri'),
      body: jsonEncode(body),
      headers: headers ?? mainHeaders,
    ).timeout(const Duration(seconds: timeoutInSeconds));
    try {
      return handleResponse(_response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  static Future<Response> getData(String uri) async {
    try {
      Http.Response response = await Http.get(
        Uri.parse('${ApiUrl.BASE_URL}$uri'),
        headers: mainHeaders,
      ).timeout(const Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      print(e);
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  static Future<Response> getDataLogin(String uri) async {
    try {
      Http.Response response = await Http.get(
        Uri.parse('${ApiUrl.LOGIN_BASE_URL}$uri'),
        headers: mainHeaders,
      ).timeout(const Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      print(e);
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  static Future<Response> postMultipartData(
      String? uri, Map<String, String> body, List<MultipartBody>? multipartBody,
      {Map<String, String>? headers,String? basUrl}) async {
    try {
      Http.MultipartRequest _request =
          Http.MultipartRequest('POST', Uri.parse(basUrl ?? ApiUrl.BASE_URL + uri!));
      _request.headers.addAll(headers ?? mainHeaders);

      for (MultipartBody multipart in multipartBody!) {
        if (multipart.webImage != null) {
          _request.files.add(Http.MultipartFile.fromBytes(
            multipart.key!,
            multipart.webImage!,
            filename: 'image.jpg',
            contentType: MediaType('image', 'jpeg'),
          ));
        } else if (multipart.file != null) {
          File _file = File(multipart.file!.path);
          _request.files.add(Http.MultipartFile(
            multipart.key!,
            _file.readAsBytes().asStream(),
            _file.lengthSync(),
            filename: _file.path.split('/').last,
          ));
        }
      }

      _request.fields.addAll(body);
      Http.Response _response =
          await Http.Response.fromStream(await _request.send());
      print('_response.body ${_response.body}');
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  static Future<Response> deleteData(String? uri,
      {Map<String, String>? headers}) async {
    try {
      Http.Response _response = await Http.delete(
        Uri.parse('${ApiUrl.BASE_URL}$uri'),
        headers: headers ?? mainHeaders,
      ).timeout(const Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  static Future<Response> deleteDataLogin(String? uri,
      {Map<String, String>? headers}) async {
    try {
      Http.Response _response = await Http.delete(
        Uri.parse('${ApiUrl.LOGIN_BASE_URL}$uri'),
        headers: headers ?? mainHeaders,
      ).timeout(const Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }
}

class MultipartBody {
  String? key;
  XFile? file;
  Uint8List? webImage = Uint8List(8);

  MultipartBody(this.key, {this.file, this.webImage});
}
