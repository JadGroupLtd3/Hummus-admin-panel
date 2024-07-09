import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class AddNewAttributeScreen extends StatefulWidget {
  final bool isEdit;
  final Attribute? attribute;

  const AddNewAttributeScreen({super.key, this.isEdit = false, this.attribute});

  @override
  State<AddNewAttributeScreen> createState() => _AddNewAttributeScreenState();
}

class _AddNewAttributeScreenState extends State<AddNewAttributeScreen> {
  final GlobalKey<FormState> attributeKey = GlobalKey<FormState>();
  final AttributeController attributeController =
      Get.find<AttributeController>();

  @override
  void initState() {
    if (widget.isEdit == true) {
      attributeController.isEdit(widget.attribute!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: GetBuilder<AttributeController>(
            builder: (attributeController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.isEdit == true
                        ? '${'Home'.tr} / ${'Attributes'.tr} / ${'Edit attribute'.tr}'
                        : '${'Home'.tr} / ${'Attributes'.tr} / ${'Add attribute'.tr}',
                    style: TajawalRegular.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  12.verticalSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
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
                            fieldsKey: attributeKey,
                            controllerAR: attributeController.attributeNameAr,
                            controllerEN: attributeController.attributeNameEn,
                            controllerHE: attributeController.attributeNameHe,
                            isCategory: false,
                            onChanged: (val) {
                              val == true
                                  ? attributeController.status.value = true
                                  : attributeController.status.value = false;
                            },
                          ),
                        ),
                      ),
                      7.horizontalSpace,
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          height: MediaQuery.of(context).size.height * 1 / 2.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 0),
                                color: Colors.black.withOpacity(0.02),
                                blurRadius: 14,
                                spreadRadius: 9,
                              )
                            ],
                          ),
                          // child: Center(child: AddPhotoWidget()),
                        ),
                      ),
                    ],
                  ),
                  40.verticalSpace,
                  Obx(() {
                    switch (attributeController.controllerState.value) {
                      case ControllerState.loading:
                        return Center(
                          child: CircularProgressIndicator(
                              color: MyThemeData.light.primaryColor),
                        );
                      case ControllerState.error:
                        return Center(
                          child: CustomButton(
                            buttonText:
                            widget.isEdit == true ? 'edit'.tr : 'save'.tr,
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
                              if (attributeKey.currentState!.validate()) {
                                if (widget.isEdit == true) {
                                  attributeController.updateAttribute(
                                    context,
                                    widget.attribute!.id!,
                                  );
                                } else {
                                  attributeController.createAttribute(context);
                                }
                              }
                            },
                          ),
                        );
                      default:
                        return Center(
                          child: CustomButton(
                            buttonText:
                                widget.isEdit == true ? 'edit'.tr : 'save'.tr,
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
                              if (attributeKey.currentState!.validate()) {
                                if (widget.isEdit == true) {
                                  attributeController.updateAttribute(
                                    context,
                                    widget.attribute!.id!,
                                  );
                                } else {
                                  attributeController.createAttribute(context);
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
