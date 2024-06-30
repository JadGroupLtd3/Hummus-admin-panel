import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/helper/preferences_helper.dart';
import 'package:hummus_admin_panel/core/network/client_api.dart';
import 'package:hummus_admin_panel/core/utils/api_url.dart';

class SignInRepo {
  var header = {
    'content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<Response?> login(
      {required String phone, required String password, required String lang}) async {
    return await ApiClient.postData(
      ApiUrl.LOGIN_URI,
      {
        "phone": phone,
        "password": password,
        'lang': lang,
        'device_token': PrefsHelper.getUUID().isEmpty ? '123456' : PrefsHelper.getUUID(),
      },
      headers: header,
    );
  }
}
