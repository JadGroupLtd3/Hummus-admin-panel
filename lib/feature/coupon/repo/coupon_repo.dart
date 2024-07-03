import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class CouponRepo {
  Future<Either<String, CouponModel>> createCoupon({required Coupon couponModel}) async {
    Response? response = await ApiClient.postData(
      ApiUrl.CREATE_COUPON,
      {
        'name_ar': couponModel.nameAr!,
        'name_en': couponModel.nameEn!,
        'name_he': couponModel.nameHe!,
        'status': couponModel.status.toString(),
        "code" : couponModel.code,
        "discount_type" : couponModel.discountType,
        "discount" : couponModel.discount,
        "min_price": couponModel.minPrice,
        "end_date": couponModel.endDate,
        "coupon_use_count": couponModel.couponUseCount,
        "user_use_count": couponModel.userUseCount,
      },
    );
    if (response.statusCode == 200) {
      return Right(CouponModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, CouponModel>> getCoupon() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_COUPON);
    if (response.statusCode == 200) {
      return Right(CouponModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, CouponModel>> deleteCoupon(int couponID) async {
    Response? response = await ApiClient.deleteData('${ApiUrl.DELETE_COUPON}$couponID');
    if (response.statusCode == 200) {
      return Right(CouponModel.fromJson(response.body));
    } else {
      print('Api Error ${response.statusCode} . ${response.body}//////////');
      return Left(response.body['message'] ?? "unknown Error Occurred");
    }
  }

}
