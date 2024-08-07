import 'dart:typed_data';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/meals/model/meals_model.dart';
import 'package:hummus_admin_panel/feature/meals/model/recommended_meal_model.dart';


class MealsRepo {

  Future<Either<String, MealsModel>> createMeals(
      CreateMealModel mealModel, Uint8List? webImageBytes) async {
    Map<String, String> _body = Map();
    _body.addAll(<String, String>{
      "category_id": mealModel.categoryId.toString(),
      "fake_price": mealModel.fakePrice.toString(),
      "price": mealModel.price.toString(),
      "coin_points": mealModel.coinPoints.toString(),
    });
    _body.addAll(mealModel.decodeLang());
    _body.addAll(mealModel.decodeComponent());
    _body.addAll(mealModel.decodeHashtag());
    _body.addAll(mealModel.decodeAttribute());
    _body.addAll(mealModel.decodeImage());
    _body.addAll(mealModel.decodeRelated());
    _body.addAll(mealModel.decodeHomeProduct());
    _body.addAll(mealModel.decodeRelated());
    var attributeImageList = await attributeImages(mealModel.attributes);
    var subMealImageList = await subMealImages(mealModel.images);
    Response? response = await ApiClient.postMultipartData(
      ApiUrl.CREATE_MEALS,
      _body,
      [
        MultipartBody('image', webImage: webImageBytes),
        ...attributeImageList,
        ...subMealImageList,
      ],
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return Right(MealsModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<List<MultipartBody>> attributeImages(List<CreateAttributes> attributes) async{
    List<MultipartBody> attributeImages = [];
    for(int i=0; i < attributes.length ; i++ ){
      var image = await XFile(attributes[i].image!).readAsBytes();
      attributeImages.add(MultipartBody('attributes[$i][image]',webImage: image));
    }
    return attributeImages;
  }

  Future<List<MultipartBody>> subMealImages(List<CreateMealImages> subMealImages) async{
    List<MultipartBody> attributeImages = [];
    for(int i=0; i < subMealImages.length ; i++ ){
      var image = await XFile(subMealImages[i].image).readAsBytes();
      attributeImages.add(MultipartBody('images[$i][image]',webImage: image));
    }
    return attributeImages;
  }

  Future<Either<String, MealsModel>> updateMeals(
      CreateMealModel mealModel, Uint8List? webImageBytes) async {
    Map<String, String> _body = Map();
    _body.addAll(<String, String>{
      "category_id": mealModel.categoryId.toString(),
      "fake_price": mealModel.fakePrice.toString(),
      "price": mealModel.price.toString(),
      "coin_points": mealModel.coinPoints.toString(),
    });
    _body.addAll(mealModel.decodeLang());
    _body.addAll(mealModel.decodeComponent());
    _body.addAll(mealModel.decodeHashtag());
    _body.addAll(mealModel.decodeAttribute());
    _body.addAll(mealModel.decodeImage());
    _body.addAll(mealModel.decodeRelated());
    _body.addAll(mealModel.decodeHomeProduct());
    Response? response = await ApiClient.postMultipartData(
      ApiUrl.UPDATE_MEALS,
      _body,
      [MultipartBody('image', webImage: webImageBytes)],
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return Right(MealsModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }


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

  Future<Either<String, RecommendedMealModel>> createRecommendedMeals(
      int mealId) async {
    Response? response = await ApiClient.postData(
      ApiUrl.CREATE_RECOMMENDED_MEALS,
      {
        "meal_id" : mealId,
      }
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return Right(RecommendedMealModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, MealsModel>> getRecommendedMeals() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_RECOMMENDED_MEALS);
    if (response.statusCode == 200) {
      return Right(MealsModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, MealsModel>> deleteRecommendedMeals(int mealID) async {
    Response? response =
    await ApiClient.getData('${ApiUrl.DELETE_RECOMMENDED_MEALS}$mealID');
    if (response.statusCode == 200) {
      return Right(MealsModel.fromJson(response.body));
    } else {
      print('Api Error ${response.statusCode} . ${response.body}//////////');
      return Left(response.body['message'] ?? "unknown Error Occurred");
    }
  }

}
