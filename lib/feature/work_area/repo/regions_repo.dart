import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class RegionsRepo{

  Future<Either<String, RegionsModel>> createRegions() async {
    Map<String, String> _body = Map();
    Response? response = await ApiClient.postData(
      ApiUrl.CREATE_REGIONS, _body,
    );
    if (response.statusCode == 200) {
      return Right(RegionsModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, RegionsModel>> getRegions() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_REGIONS);
    if (response.statusCode == 200) {
      return Right(RegionsModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, RegionsModel>> deleteRegions(int regionsID) async {
    Response? response = await ApiClient.deleteData('${ApiUrl.DELETE_REGIONS}$regionsID');
    if (response.statusCode == 200) {
      return Right(RegionsModel.fromJson(response.body));
    } else {
      print('Api Error ${response.statusCode} . ${response.body}//////////');
      return Left(response.body['message'] ?? "unknown Error Occurred");
    }
  }
}