import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/home_element/model/popular_meals_model.dart';

class PopularMealsRepo {

  Future<Either<String, PopularMealsModel>> getPopularMeals() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_POPULAR_MEALS);
    if (response.statusCode == 200) {
      return Right(PopularMealsModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, PopularMealsModel>> getFeatureMeals() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_FEATURE_MEALS);
    if (response.statusCode == 200) {
      return Right(PopularMealsModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, PopularMealsModel>> deletePopularMeals(int popularMealID) async {
    Response? response =
    await ApiClient.deleteData('${ApiUrl.DELETE_POPULAR_MEALS}/$popularMealID');
    if (response.statusCode == 200) {
      return Right(PopularMealsModel.fromJson(response.body));
    } else {
      print('Api Error ${response.statusCode} . ${response.body}//////////');
      return Left(response.body['message'] ?? "unknown Error Occurred");
    }
  }

  Future<Either<String, PopularMealsModel>> deleteFeatureMeals(int featureMealID) async {
    Response? response =
    await ApiClient.deleteData('${ApiUrl.DELETE_FEATURE_MEALS}/$featureMealID');
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return Right(PopularMealsModel.fromJson(response.body));
    } else {
      print('Api Error ${response.statusCode} . ${response.body}//////////');
      return Left(response.body['message'] ?? "unknown Error Occurred");
    }
  }
}
