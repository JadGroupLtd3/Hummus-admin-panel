import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/feature/main/controller/slider_pages_controller.dart';
import 'package:hummus_admin_panel/feature/main/widget/sub_tab_BTN.dart';
import 'package:hummus_admin_panel/feature/main/widget/tab_slider_BTN.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final SliderPagesController sliderPagesController =
      Get.put(SliderPagesController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderPagesController>(
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.only(topRight: Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 1,
                spreadRadius: 0,
                color: Colors.black.withOpacity(.08),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: double.infinity,
              child: ListView(
                children: [
                  15.verticalSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TabBTN(
                        imagePath: Images.home,
                        title: 'Home'.tr,
                        section: sliderPagesController.currentPage.value == 0
                            ? 0
                            : sliderPagesController.currentPage.value == 1
                                ? 1
                                : sliderPagesController.currentPage.value == 2
                                    ? 2
                                    : sliderPagesController.currentPage.value ==
                                            3
                                        ? 3
                                        : 4,
                        widget: Column(
                          children: [
                            SubTabBTN(
                              title: 'Statistics'.tr,
                              page: 0,
                            ),
                            SubTabBTN(
                              title: 'Settings'.tr,
                              page: 1,
                            ),
                            SubTabBTN(
                              title: 'Delivery times'.tr,
                              page: 2,
                            ),
                            SubTabBTN(
                              title: 'Notification settings'.tr,
                              page: 3,
                            ),
                            SubTabBTN(
                              title: 'Show notifications'.tr,
                              page: 4,
                            ),
                          ],
                        ),
                      ),
                      TabBTN(
                        imagePath: Images.coupon,
                        title: 'Coupon'.tr,
                        section: sliderPagesController.currentPage.value == 5
                            ? 5
                            : 6,
                        widget: Column(
                          children: [
                            SubTabBTN(
                              title: 'Show coupons'.tr,
                              page: 5,
                            ),
                            SubTabBTN(
                              title: 'Add new'.tr,
                              page: 6,
                            ),
                          ],
                        ),
                      ),
                      TabBTN(
                        imagePath: Images.deal,
                        title: 'Deals'.tr,
                        section: sliderPagesController.currentPage.value == 7
                            ? 7
                            : 8,
                        widget: Column(
                          children: [
                            SubTabBTN(
                              title: 'Show deals'.tr,
                              page: 7,
                            ),
                            SubTabBTN(
                              title: 'Add new'.tr,
                              page: 8,
                            ),
                          ],
                        ),
                      ),
                      TabBTN(
                        imagePath: Images.home_work,
                        title: 'Work Area'.tr,
                        section: sliderPagesController.currentPage.value == 9
                            ? 9
                            : 10,
                        widget: Column(
                          children: [
                            SubTabBTN(
                              title: 'Added domains'.tr,
                              page: 9,
                            ),
                            SubTabBTN(
                              title: 'Add new'.tr,
                              page: 10,
                            ),
                          ],
                        ),
                      ),
                      TabBTN(
                        imagePath: Images.users,
                        title: 'Users'.tr,
                        section: sliderPagesController.currentPage.value == 11
                            ? 11
                            : sliderPagesController.currentPage.value == 12
                            ? 12
                            : 13,
                        widget: Column(
                          children: [
                            SubTabBTN(
                              title: 'Managers'.tr,
                              page: 11,
                            ),
                            SubTabBTN(
                              title: 'Waiters'.tr,
                              page: 12,
                            ),
                            SubTabBTN(
                              title: 'Customers'.tr,
                              page: 13,
                            ),
                          ],
                        ),
                      ),
                      TabBTN(
                        imagePath: Images.Elements,
                        title: 'Elements'.tr,
                        section: sliderPagesController.currentPage.value == 14
                            ? 14
                            : 15,
                        widget: Column(
                          children: [
                            SubTabBTN(
                              title: 'Most common'.tr,
                              page: 14,
                            ),
                            SubTabBTN(
                              title: 'Popular Meals'.tr,
                              page: 15,
                            ),
                          ],
                        ),
                      ),
                      TabBTN(
                        imagePath: Images.questions,
                        title: 'Questions'.tr,
                        section: sliderPagesController.currentPage.value == 16
                            ? 16
                            : 17,
                        widget: Column(
                          children: [
                            SubTabBTN(
                              title: 'Questions & Answers'.tr,
                              page: 16,
                            ),
                            SubTabBTN(
                              title: 'Add new'.tr,
                              page: 17,
                            ),
                          ],
                        ),
                      ),
                      TabBTN(
                        imagePath: Images.hashtag,
                        title: 'Hashtag'.tr,
                        section: sliderPagesController.currentPage.value == 18
                            ? 18
                            : 19,
                        widget: Column(
                          children: [
                            SubTabBTN(
                              title: 'Show hashtag'.tr,
                              page: 18,
                            ),
                            SubTabBTN(
                              title: 'Add new'.tr,
                              page: 19,
                            ),
                          ],
                        ),
                      ),
                      TabBTN(
                        imagePath: Images.food,
                        title: 'Meals'.tr,
                        section: sliderPagesController.currentPage.value == 28
                            ? 28
                            : 29,
                        widget: Column(
                          children: [
                            SubTabBTN(
                              title: 'Show Meals'.tr,
                              page: 28,
                            ),
                            SubTabBTN(
                              title: 'Add new'.tr,
                              page: 29,
                            ),
                          ],
                        ),
                      ),
                      TabBTN(
                        imagePath: Images.component,
                        title: 'Components'.tr,
                        section: sliderPagesController.currentPage.value == 20
                            ? 20
                            : 21,
                        widget: Column(
                          children: [
                            SubTabBTN(
                              title: 'Show components'.tr,
                              page: 20,
                            ),
                            SubTabBTN(
                              title: 'Add new'.tr,
                              page: 21,
                            ),
                          ],
                        ),
                      ),
                      TabBTN(
                        imagePath: Images.component,
                        title: 'Attributes'.tr,
                        section: sliderPagesController.currentPage.value == 22
                            ? 22
                            : 23,
                        widget: Column(
                          children: [
                            SubTabBTN(
                              title: 'Show Attributes'.tr,
                              page: 22,
                            ),
                            SubTabBTN(
                              title: 'Add new'.tr,
                              page: 23,
                            ),
                          ],
                        ),
                      ),
                      TabBTN(
                        imagePath: Images.category,
                        title: 'Category'.tr,
                        section: sliderPagesController.currentPage.value == 24
                            ? 24
                            : 25,
                        widget: Column(
                          children: [
                            SubTabBTN(
                              title: 'Show Category'.tr,
                              page: 24,
                            ),
                            SubTabBTN(
                              title: 'Add new'.tr,
                              page: 25,
                            ),
                          ],
                        ),
                      ),
                      TabBTN(
                        imagePath: Images.category,
                        title: 'Tables'.tr,
                        section: sliderPagesController.currentPage.value == 26
                            ? 26
                            : 27,
                        widget: Column(
                          children: [
                            SubTabBTN(
                              title: 'Show Tables'.tr,
                              page: 26,
                            ),
                            SubTabBTN(
                              title: 'Add new'.tr,
                              page: 27,
                            ),
                          ],
                        ),
                      ),
                      TabBTN(
                        imagePath: Images.order,
                        title: 'Orders'.tr,
                        section: sliderPagesController.currentPage.value == 30
                            ? 30
                            : 31,
                        widget: Column(
                          children: [
                            SubTabBTN(
                              title: 'Show Orders'.tr,
                              page: 30,
                            ),
                            SubTabBTN(
                              title: 'Orders History'.tr,
                              page: 31,
                            ),
                          ],
                        ),
                      ),
                      25.verticalSpace,
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
