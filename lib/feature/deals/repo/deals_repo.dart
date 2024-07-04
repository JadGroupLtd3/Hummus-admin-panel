import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class DealsRepo {
  Future<Either<String, DealsModel>> getDeals() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_DEALS);
    if (response.statusCode == 200) {
      return Right(DealsModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, DealsModel>> deleteDeals(int dealID) async {
    Response? response =
        await ApiClient.deleteData('${ApiUrl.DELETE_DEALS}$dealID');
    if (response.statusCode == 200) {
      return Right(DealsModel.fromJson(response.body));
    } else {
      print('Api Error ${response.statusCode} . ${response.body}//////////');
      return Left(response.body['message'] ?? "unknown Error Occurred");
    }
  }
}
