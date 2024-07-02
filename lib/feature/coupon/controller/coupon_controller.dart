import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:get/get.dart';

class CouponController extends GetxController {
  late CouponRepo couponRepo;

  CouponController(this.couponRepo);

  var controllerState = ControllerState.idle.obs;
  RxBool status = false.obs;
  RxInt discountType = 0.obs;

  TextEditingController couponNameAr = TextEditingController();
  TextEditingController couponNameEn = TextEditingController();
  TextEditingController couponNameHe = TextEditingController();
  TextEditingController couponCode = TextEditingController();
  TextEditingController couponUseCount = TextEditingController();
  TextEditingController couponUseUserCount = TextEditingController();
  TextEditingController couponMinPrice = TextEditingController();
  TextEditingController couponEndDate = TextEditingController();
  TextEditingController couponDiscount = TextEditingController();

  RxList<Coupon> couponList = <Coupon>[].obs;

  Future<void> createCoupon(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    Coupon coupon = Coupon(
      nameAr: couponNameAr.text,
      nameEn: couponNameEn.text,
      nameHe: couponNameHe.text,
      discountType: discountType.value.toString(),
      code: couponCode.text,
      couponUseCount: couponUseCount.text,
      userUseCount: couponUseUserCount.text,
      minPrice: couponMinPrice.text,
      discount: couponDiscount.text,
      endDate: couponEndDate.text,
      status: status.value == true ? 1 : 0,
    );
    final result = await couponRepo.createCoupon(couponModel: coupon);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
      getCoupon(context);
      couponNameAr.clear();
      couponNameEn.clear();
      couponNameHe.clear();
      couponCode.clear();
      couponUseCount.clear();
      couponMinPrice.clear();
      couponEndDate.clear();
      couponDiscount.clear();
      couponUseUserCount.clear();
      update();
    });
  }

  Future<void> getCoupon(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await couponRepo.getCoupon();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      couponList.value = right.data;
    });
  }

}
