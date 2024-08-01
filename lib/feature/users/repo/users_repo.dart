import 'dart:typed_data';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/users/model/admin_model.dart';


class UsersRepo {


  Future<Either<String, CreateAdminModel>> createAdmins(
      {required Admin adminModel,Uint8List? webImage}) async {
    Response? response = await ApiClient.postMultipartDataLogin(
      ApiUrl.CREATE_ADMINS,
      {
        "first_name": adminModel.firstName ?? "",
        "last_name": adminModel.lastName ?? "",
        "phone": adminModel.phone ?? "",
        "password": adminModel.password ?? "",
        "email": adminModel.email ?? "",
      },
      [MultipartBody('image', webImage: webImage)],
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return Right(CreateAdminModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, CreateAdminModel>> updateAdmins(
      {required Admin adminModel,Uint8List? webImage}) async {
    Response? response = await ApiClient.postMultipartDataLogin(
      ApiUrl.UPDATE_ADMINS,
      {
        "id": adminModel.id.toString(),
        "first_name": adminModel.firstName ?? "",
        "last_name": adminModel.lastName ?? "",
        "phone": adminModel.phone ?? "",
        "password": adminModel.password ?? "",
        "email": adminModel.email ?? "",
      },
      [MultipartBody('image', webImage: webImage)],
    );
    if (response.statusCode == 200) {
      return Right(CreateAdminModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, DeleteAdminModel>> deleteAdmins(int adminID) async {
    Response? response = await ApiClient.deleteDataLogin('${ApiUrl.DELETE_ADMINS}$adminID');
    print('${ApiUrl.LOGIN_BASE_URL}${ApiUrl.DELETE_ADMINS}$adminID');
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return Right(DeleteAdminModel.fromJson(response.body));
    } else {
      print('Api Error ${response.statusCode} . ${response.body}//////////');
      return Left(response.body['message'] ?? "unknown Error Occurred");
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

  Future<Either<String, WaitersModel>> getWaiters() async {
    Response? response = await ApiClient.getDataLogin(ApiUrl.GET_WAITERS);
    if (response.statusCode == 200) {
      return Right(WaitersModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, CreateWaiterModel>> createWaiters(
      {required Waiters adminModel,Uint8List? webImage}) async {
    Response? response = await ApiClient.postMultipartDataLogin(
      ApiUrl.CREATE_WAITERS,
      {
        "first_name": adminModel.firstName ?? "",
        "last_name": adminModel.lastName ?? "",
        "phone": adminModel.phone ?? "",
        "password": adminModel.password ?? "",
        "email": adminModel.email ?? "",
      },
      [MultipartBody('image', webImage: webImage)],
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return Right(CreateWaiterModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, CreateWaiterModel>> updateWaiters(
      {required Waiters waiterModel,Uint8List? webImage}) async {
    Response? response = await ApiClient.postMultipartDataLogin(
      ApiUrl.UPDATE_WAITERS,
      {
        "id": waiterModel.id.toString(),
        "first_name": waiterModel.firstName ?? "",
        "last_name": waiterModel.lastName ?? "",
        "phone": waiterModel.phone ?? "",
        "password": waiterModel.password ?? "",
        "email": waiterModel.email ?? "",
      },
      [MultipartBody('image', webImage: webImage)],
    );
    if (response.statusCode == 200) {
      return Right(CreateWaiterModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, WaitersModel>> deleteWaiters(int waitersID) async {
    Response? response = await ApiClient.deleteDataLogin('${ApiUrl.DELETE_WAITERS}$waitersID');
    print('${ApiUrl.LOGIN_BASE_URL}${ApiUrl.DELETE_WAITERS}$waitersID');
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return Right(WaitersModel.fromJson(response.body));
    } else {
      print('Api Error ${response.statusCode} . ${response.body}//////////');
      return Left(response.body['message'] ?? "unknown Error Occurred");
    }
  }

}
