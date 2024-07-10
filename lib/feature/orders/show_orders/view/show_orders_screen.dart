import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class ShowOrdersScreen extends StatelessWidget {
  const ShowOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${'Home'.tr} / ${'Orders'.tr} / ${'Show orders'.tr}',
                style: TajawalRegular.copyWith(
                  fontSize: 16,
                ),
              ),
              12.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<SliderPagesController>(
                    builder: (sliderPagesController) {
                      return Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          height: MediaQuery.of(context).size.height * 1 / 1.26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 0),
                                color: Colors.black.withOpacity(0.02),
                                blurRadius: 14,
                                spreadRadius: 9,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top:20,bottom: 10),
                            child: Column(
                              children: [
                                OrdersStatusNavBar(
                                  sliderPagesController: sliderPagesController,
                                ),
                                10.verticalSpace,
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 1 / 1.5,
                                  child: PageView(
                                    onPageChanged: sliderPagesController.animateToOrderStatusNameTab,
                                    controller: sliderPagesController.orderStatusPageController,
                                    physics: const NeverScrollableScrollPhysics(),
                                    clipBehavior: Clip.none,
                                    children: [...sliderPagesController.orderStatusNamesPages],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  7.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          //height: MediaQuery.of(context).size.height * 1 / 2.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 0),
                                color: Colors.black.withOpacity(0.02),
                                blurRadius: 14,
                                spreadRadius: 9,
                              )
                            ],
                          ),
                          child: OrderDetailsWidget(),
                        ),
                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            OnHover(
                              builder: (isHovered) {
                                return CustomButton(
                                  buttonText: 'Accept'.tr,
                                  icon: SvgPicture.asset(Images.correct),
                                  backGroundColor: MyThemeData.light.primaryColor,
                                  radius: 7,
                                  width: 120,
                                  height: 45,
                                  onPressed: (){},
                                );
                              },
                            ),
                            7.horizontalSpace,
                            OnHover(
                              builder: (isHovered) {
                                return CustomButton(
                                  buttonText: 'Reject'.tr,
                                  icon: SvgPicture.asset(Images.close),
                                  backGroundColor: MyThemeData.light.focusColor,
                                  radius: 7,
                                  width: 120,
                                  height: 45,
                                  onPressed: (){},
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
