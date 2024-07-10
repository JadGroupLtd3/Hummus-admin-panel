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
    var url =
    Uri.parse('https://marcelia.online/test/hummus-back/api/v1/order/all');
    final http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      //log(response.body);
      return Right(AllOrderModel.fromJson(jsonDecode(response.body)));
    } else {
      log('Api Error ${response.statusCode} . ${response.body}//////////');
      return Left(
          jsonDecode(response.body)['message'] ?? "unknown Error Occurred");
    }
  }

  Future<AllOrderModel> changeStatusOfOrder(
      int idOfOrderDetails, String stateOfOrder, String? expectedTime) async {
    final http.Response response = await http.get(
        Uri.parse(
          'https://marcelia.online/test/hummus-back/api/v1//order/update/$idOfOrderDetails/$stateOfOrder/${stateOfOrder == 'preparing' ? expectedTime : ''}',
        ),
        headers: headers);
    //log('${ApiUrl.BASE_URL}/order/update/$idOfOrderDetails/$stateOfOrder/${stateOfOrder == 'preparing' ? expectedTime : ''}');
    log(response.body);
    //log(response.request!.url.toString());

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return AllOrderModel.fromJson(data);
    } else {
      throw Exception('Failed to fetch order details');
    }
  }
}