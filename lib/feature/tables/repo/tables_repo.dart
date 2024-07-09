import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/core_export.dart';


class TablesRepo {

  Future<Either<String, TablesModel>> createTables({required TablesData tablesData}) async {
    Response? response = await ApiClient.postData(
      ApiUrl.CREATE_TABLES,
      {
        "number": tablesData.number,
        "status": tablesData.status,
      },
    );
    if (response.statusCode == 200) {
      return Right(TablesModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, TablesModel>> updateTables({required TablesData tablesData}) async {
    Response? response = await ApiClient.postData(
      ApiUrl.UPDATE_TABLES,
      {
        "id": tablesData.id,
        "number": tablesData.number,
        "status": tablesData.status,
      },
    );
    if (response.statusCode == 200) {
      return Right(TablesModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, TablesModel>> getTables() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_TABLES);
    if (response.statusCode == 200) {
      return Right(TablesModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, TablesModel>> deleteTables(int tablesID) async {
    Response? response = await ApiClient.deleteData('${ApiUrl.DELETE_TABLES}$tablesID');
    if (response.statusCode == 200) {
      return Right(TablesModel.fromJson(response.body));
    } else {
      print('Api Error ${response.statusCode} . ${response.body}//////////');
      return Left(response.body['message'] ?? "unknown Error Occurred");
    }
  }
}
