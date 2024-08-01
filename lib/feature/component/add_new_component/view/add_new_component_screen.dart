import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class AddNewComponentScreen extends StatefulWidget {
  final bool isEdit;
  final Component? component;

  const AddNewComponentScreen({super.key, this.isEdit = false, this.component});

  @override
  State<AddNewComponentScreen> createState() => _AddNewComponentScreenState();
}

class _AddNewComponentScreenState extends State<AddNewComponentScreen> {
  final GlobalKey<FormState> componentKey = GlobalKey<FormState>();
  final ComponentController componentController = Get.find<ComponentController>();

  @override
  void initState() {
    componentController.initState();
    if (widget.isEdit == true) {
      componentController.isEdit(widget.component!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: GetBuilder<ComponentController>(
            builder: (componentController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.isEdit == true
                        ? '${'Home'.tr} / ${'Component'.tr} / ${'Edit component'.tr}'
                        : '${'Home'.tr} / ${'Component'.tr} / ${'Add component'.tr}',
                    style: TajawalRegular.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  12.verticalSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        height: MediaQuery.of(context).size.height * 1 / 2.0,
                        width: MediaQuery.of(context).size.height * 1 / 1.56,
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
                          fieldsKey: componentKey,
                          controllerAR: componentController.componentNameAr,
                          controllerEN: componentController.componentNameEn,
                          controllerHE: componentController.componentNameHe,
                          onChanged: (val) {
                            val == true
                                ? componentController.status.value = true
                                : componentController.status.value = false;
                          },
                          enable: componentController.status.value,
                        ),
                      ),
                      7.horizontalSpace,
                      Center(
                        child: AddPhotoWidget(
                          isComponent: true,
                          width: MediaQuery.of(context).size.height * 1 / 1.7,
                          isEdit: widget.component != null,
                          imagePath: componentController.imagePath,
                          webImage: componentController.webImage,
                          pickedImage: componentController.pickedImage,
                          pickedProfileImageFile:
                              componentController.pickedProfileImageFile,
                        ),
                      ),
                    ],
                  ),
                  40.verticalSpace,
                  Obx(() {
                    switch (componentController.controllerState.value) {
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
                              if (componentKey.currentState!.validate()) {
                                if (widget.isEdit == true) {
                                  componentController.updateComponent(
                                    context,
                                    widget.component!.id!,
                                  );
                                } else {
                                  componentController.createComponent(context);
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
                              if (componentKey.currentState!.validate()) {
                                if (widget.isEdit == true) {
                                  componentController.updateComponent(
                                    context,
                                    widget.component!.id!,
                                  );
                                } else {
                                  componentController.createComponent(context);
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
