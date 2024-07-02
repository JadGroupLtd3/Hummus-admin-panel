import 'dart:typed_data';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:get/get_connect/http/src/response/response.dart';


class CategoryRepo {

  Future<Either<String, CategoryModel>> createCategory(
      {required Category categoryModel, XFile? data, Uint8List? webImage}) async {
    Map<String, String> _body = Map();
    _body.addAll(<String, String>{
      'name_ar': categoryModel.nameAr!,
      'name_en': categoryModel.nameEn!,
      'name_he': categoryModel.nameHe!,
      'status': categoryModel.status.toString(),
      'sort': categoryModel.sort.toString(),
    });
    Response? response = await ApiClient.postMultipartData(
      ApiUrl.CREATE_CATEGORY,
      _body,
      [MultipartBody('image', webImage: webImage)],
    );
    if (response.statusCode == 200) {
      return Right(CategoryModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, CategoryModel>> getCategory() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_CATEGORY);
    if (response.statusCode == 200) {
      return Right(CategoryModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

}
