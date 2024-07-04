import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/meals/model/meals_model.dart';

class MealsRepo {
  Future<Either<String, MealsModel>> getMeals() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_MEALS);
    if (response.statusCode == 200) {
      return Right(MealsModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, MealsModel>> deleteMeals(int mealID) async {
    Response? response =
        await ApiClient.deleteData('${ApiUrl.DELETE_MEALS}$mealID');
    if (response.statusCode == 200) {
      return Right(MealsModel.fromJson(response.body));
    } else {
      print('Api Error ${response.statusCode} . ${response.body}//////////');
      return Left(response.body['message'] ?? "unknown Error Occurred");
    }
  }
}
