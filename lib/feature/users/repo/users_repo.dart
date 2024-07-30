import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/users/model/admin_model.dart';


class UsersRepo {

  Future<Either<String, WaitersModel>> getWaiters() async {
    Response? response = await ApiClient.getDataLogin(ApiUrl.GET_WAITERS);
    if (response.statusCode == 200) {
      return Right(WaitersModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, AdminModel>> getAdmins() async {
    Response? response = await ApiClient.getDataLogin(ApiUrl.GET_ADMINS);
    if (response.statusCode == 200) {
      return Right(AdminModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

}
