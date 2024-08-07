import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/home/statistics/widget/statistics%D9%80widget.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: GetBuilder<AllOrderController>(
            builder: (controller) {
              return Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '${'Home'.tr} / ${'Statistics'.tr}',
                      style: TajawalRegular.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    12.verticalSpace,
                    Row(
                      children: [
                        StatisticsWidget(
                          quantity: "${Get.find<AllOrderController>().waitingList.length}",
                          title: "Today's orders".tr,
                          imagePath: Images.today_order,
                        ),
                        StatisticsWidget(
                          quantity: "${Get.find<AllOrderController>().allOrderList.length}",
                          title: "Orders".tr,
                          imagePath: Images.orders,
                        ),
                        StatisticsWidget(
                          quantity: "${Get.find<CouponController>().couponList.length}",
                          title: "Coupons".tr,
                          imagePath: Images.coupons,
                        ),
                      ],
                    ),
                    12.verticalSpace,
                    Row(
                      children: [
                        StatisticsWidget(
                          quantity: "${Get.find<MealsController>().mealsList.length}",
                          title: "Meals".tr,
                          imagePath: Images.meals,
                        ),
                        StatisticsWidget(
                          quantity: "${Get.find<AttributeController>().attributeList.length}",
                          title: "Attributes".tr,
                          imagePath: Images.attributes,
                        ),
                        StatisticsWidget(
                          quantity: "${Get.find<CategoryController>().categoryList.length}",
                          title: "Categories".tr,
                          imagePath: Images.categories,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
