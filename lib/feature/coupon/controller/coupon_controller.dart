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

  initState(){
    couponNameAr.clear();
    couponNameEn.clear();
    couponNameHe.clear();
    couponCode.clear();
    couponUseCount.clear();
    couponMinPrice.clear();
    couponEndDate.clear();
    couponDiscount.clear();
    couponUseUserCount.clear();
  }

  void isEdit(Coupon coupon){
    couponNameAr.text = coupon.nameAr ?? '';
    couponNameEn.text = coupon.nameEn ?? '';
    couponNameHe.text = coupon.nameHe ?? '';
    couponCode.text = coupon.code ?? '';
    couponUseCount.text = coupon.couponUseCount ?? '';
    couponMinPrice.text = coupon.minPrice ?? '';
    couponEndDate.text = coupon.endDate ?? '';
    couponDiscount.text = coupon.discount ?? '';
    couponUseUserCount.text = coupon.userUseCount ?? '';
    status.value = coupon.status == 1 ? true : false;
    discountType.value = int.parse(coupon.discountType ?? '0');
  }

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
      initState();
      update();
    });
  }

  Future<void> updateCoupon(BuildContext context,int couponId) async {
    controllerState.value = ControllerState.loading;
    Coupon coupon = Coupon(
      id: couponId,
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
    final result = await couponRepo.updateCoupon(couponModel: coupon);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
      getCoupon(context);
      initState();
      Get.back();
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

  Future<void> deleteCoupon(BuildContext context,{required int couponID}) async {
    controllerState.value = ControllerState.loading;
    final result = await couponRepo.deleteCoupon(couponID);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
      update();
    }, (right) async {
      controllerState.value = ControllerState.success;
      await getCoupon(context);
      update();
      Navigator.pop(context);
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
    });
  }

}
