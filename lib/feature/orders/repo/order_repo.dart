import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/orders/model/order_model.dart';

class AllOrderRepository {
  var headers = {
    'content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${PrefsHelper.getToken()}'
  };

  Future<Either<String, AllOrderModel>> getAllOrder() async {
    var url = Uri.parse('${ApiUrl.LOGIN_BASE_URL}/order/index');
    final http.Response response = await http.get(url, headers: headers);
    print('${ApiUrl.LOGIN_BASE_URL}/order/index');
    if (response.statusCode == 200) {
      log(response.body);
      return Right(AllOrderModel.fromJson(jsonDecode(response.body)));
    } else {
      log('Api Error ${response.statusCode} . ${response.body}//////////');
      return Left(
          jsonDecode(response.body)['message'] ?? "unknown Error Occurred");
    }
  }

  Future<Either<String, AllOrderModel>> changeStatusOfOrder(
      int idOfOrderDetails, String stateOfOrder, String? expectedTime) async {
    final http.Response response = await http.get(
        Uri.parse(
          '${ApiUrl.LOGIN_BASE_URL}/order/update/$idOfOrderDetails/$stateOfOrder/${stateOfOrder == 'preparing' ? expectedTime : ''}',
        ),
        headers: headers);
    print(
        '${ApiUrl.LOGIN_BASE_URL}/order/update/$idOfOrderDetails/$stateOfOrder/${stateOfOrder == 'preparing' ? expectedTime : ''}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Right(AllOrderModel.fromJson(data));
    } else {
      return Left(
          jsonDecode(response.body)['message'] ?? "unknown Error Occurred");
    }
  }
}