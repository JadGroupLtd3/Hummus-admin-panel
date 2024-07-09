import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/feature/hashtags/controller/hashtag_controller.dart';
import 'package:hummus_admin_panel/feature/main/controller/slider_pages_controller.dart';
import 'package:hummus_admin_panel/widgets/add_new_product_fields.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/add_photo_widget.dart';
import 'package:hummus_admin_panel/widgets/custom_button.dart';

class AddNewHashtagScreen extends StatefulWidget {
  final bool isEdit;
  final Hashtag? hashtag;
  const AddNewHashtagScreen({super.key,this.isEdit = false,this.hashtag});

  @override
  State<AddNewHashtagScreen> createState() => _AddNewHashtagScreenState();
}

class _AddNewHashtagScreenState extends State<AddNewHashtagScreen> {
  final GlobalKey<FormState> hashtagKey = GlobalKey<FormState>();
  final HashtagController hashtagController = Get.find<HashtagController>();
  @override
  void initState() {
    hashtagController.initState();
    if(widget.isEdit == true){
      hashtagController.isEdit(widget.hashtag!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: GetBuilder<HashtagController>(
            builder: (hashtagController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.isEdit == true
                        ? '${'Home'.tr} / ${'Hashtags'.tr} / ${'Edit hashtag'.tr}'
                        : '${'Home'.tr} / ${'Hashtags'.tr} / ${'Add New'.tr}',
                    style: TajawalRegular.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  12.verticalSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          height: MediaQuery.of(context).size.height * 1 / 2.0,
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
                          child: AddNewProductFields(
                            fieldsKey: hashtagKey,
                            controllerAR: hashtagController.hashtagNameAr,
                            controllerEN: hashtagController.hashtagNameEn,
                            controllerHE: hashtagController.hashtagNameHe,
                            onChanged: (val) {
                              val == true
                                  ? hashtagController.status.value = true
                                  : hashtagController.status.value = false;
                            },
                            enable: hashtagController.status.value,
                          ),
                        ),
                      ),
                      7.horizontalSpace,
                      Expanded(
                        child: Center(
                          child: AddPhotoWidget(
                            isHashtag: true,
                            isEdit: widget.hashtag != null,
                            imagePath: hashtagController.imagePath,
                            webImage: hashtagController.webImage,
                            pickedImage: hashtagController.pickedImage,
                            pickedProfileImageFile: hashtagController.pickedProfileImageFile,
                          ),
                        ),
                      ),
                    ],
                  ),
                  40.verticalSpace,
                  Obx(() {
                    switch (hashtagController.controllerState.value) {
                      case ControllerState.loading:
                        return Center(
                          child: CircularProgressIndicator(
                              color: MyThemeData.light.primaryColor),
                        );
                      case ControllerState.error:
                        return Center(
                          child: CustomButton(
                            buttonText: widget.isEdit == true ? 'edit'.tr : 'save'.tr,
                            icon: SvgPicture.asset(Images.correct)
                                .paddingSymmetric(horizontal: 4),
                            style: TajawalBold.copyWith(
                              color: Colors.white,
                            ),
                            radius: 20,
                            width: 160,
                            height: 45,
                            backGroundColor: MyThemeData.light.primaryColor,
                            onPressed: () {
                              if (hashtagKey.currentState!.validate()) {
                                if(widget.isEdit == true){
                                  hashtagController.updateHashtag(
                                    context,
                                    widget.hashtag!.id!,
                                  );
                                }else {
                                  hashtagController.createHashtag(context);
                                }
                              }
                            },
                          ),
                        );
                      default:
                        return Center(
                          child: CustomButton(
                            buttonText: widget.isEdit == true ? 'edit'.tr : 'save'.tr,
                            icon: SvgPicture.asset(Images.correct)
                                .paddingSymmetric(horizontal: 4),
                            style: TajawalBold.copyWith(
                              color: Colors.white,
                            ),
                            radius: 20,
                            width: 160,
                            height: 45,
                            backGroundColor: MyThemeData.light.primaryColor,
                            onPressed: () {
                              if (hashtagKey.currentState!.validate()) {
                                if(widget.isEdit == true){
                                  hashtagController.updateHashtag(
                                    context,
                                    widget.hashtag!.id!,
                                  );
                                }else {
                                  hashtagController.createHashtag(context);
                                }
                              }
                            },
                          ),
                        );
                    }
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
