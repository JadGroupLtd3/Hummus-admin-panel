import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class AddNewWaiterScreen extends StatefulWidget {
  final Waiters? waiter;
  final bool isEdit;

  const AddNewWaiterScreen({super.key, this.isEdit = false, this.waiter});

  @override
  State<AddNewWaiterScreen> createState() => _AddNewWaiterScreenState();
}

class _AddNewWaiterScreenState extends State<AddNewWaiterScreen> {
  final GlobalKey<FormState> waiterKey = GlobalKey<FormState>();
  final UsersController waiterController = Get.find<UsersController>();

  @override
  void initState() {
    waiterController.initStateWaiter();
    if (widget.isEdit == true) {
      waiterController.isEditWaiter(widget.waiter!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool _enable = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: GetBuilder<UsersController>(
            builder: (waiterController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.isEdit == true
                        ? '${'Home'.tr} / ${'Hashtags'.tr} / ${'Edit Waiter'.tr}'
                        : '${'Home'.tr} / ${'Users'.tr} / ${'New Waiter'.tr}',
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
                          height: MediaQuery.of(context).size.height * 1 / 1.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 0),
                                color: Colors.black.withOpacity(0.02),
                                blurRadius: 14,
                                spreadRadius: 9,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                20.verticalSpace,
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Form(
                                          key: waiterKey,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              Images.person,
                                                              width: 21,
                                                              height: 21,
                                                              color: MyThemeData
                                                                  .light
                                                                  .focusColor,
                                                            ).paddingSymmetric(
                                                                horizontal: 7),
                                                            Text(
                                                              'Waiter Name'.tr,
                                                              style:
                                                                  TajawalRegular
                                                                      .copyWith(
                                                                fontSize: 13,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(height: 5),
                                                        CustomTextField(
                                                          height: 45,
                                                          radius: 20,
                                                          hintText:
                                                              'Waiter name'.tr,
                                                          inputType:
                                                              TextInputType.text,
                                                          controller: waiterController.waiterNameController,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 30),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.email,
                                                              size: 20,
                                                              color: MyThemeData
                                                                  .light
                                                                  .focusColor,
                                                            ).paddingSymmetric(
                                                                horizontal: 7),
                                                            Text(
                                                              'Email'.tr,
                                                              style:
                                                                  TajawalRegular
                                                                      .copyWith(
                                                                fontSize: 13,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(height: 5),
                                                        CustomTextField(
                                                          height: 45,
                                                          radius: 20,
                                                          hintText: 'Email'.tr,
                                                          inputType:
                                                              TextInputType.text,
                                                          controller: waiterController.waiterEmailController,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              25.verticalSpace,
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.phone,
                                                              size: 20,
                                                              color: MyThemeData
                                                                  .light
                                                                  .focusColor,
                                                            ).paddingSymmetric(
                                                                horizontal: 7),
                                                            Text(
                                                              'Phone Number'.tr,
                                                              style:
                                                                  TajawalRegular
                                                                      .copyWith(
                                                                fontSize: 13,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(height: 5),
                                                        CustomTextField(
                                                          height: 45,
                                                          radius: 20,
                                                          hintText:
                                                              'Phone Number'.tr,
                                                          inputType:
                                                              TextInputType.text,
                                                          controller: waiterController.waiterPhoneController,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 30),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.password,
                                                              size: 20,
                                                              color: MyThemeData
                                                                  .light
                                                                  .focusColor,
                                                            ).paddingSymmetric(
                                                                horizontal: 7),
                                                            Text(
                                                              'Password'.tr,
                                                              style:
                                                                  TajawalRegular
                                                                      .copyWith(
                                                                fontSize: 13,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(height: 5),
                                                        CustomTextField(
                                                          height: 45,
                                                          radius: 20,
                                                          hintText: 'Password'.tr,
                                                          inputType:
                                                              TextInputType.phone,
                                                          controller: waiterController.waiterPasswordController,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              40.verticalSpace,
                                              // Row(
                                              //   children: [
                                              //     2.horizontalSpace,
                                              //     CustomSwitch(
                                              //       value: _enable,
                                              //       onChanged: (bool val) {
                                              //         _enable = val;
                                              //       },
                                              //     ),
                                              //   ],
                                              // )
                                            ],
                                          ),
                                        ),
                                      ),
                                      30.horizontalSpace,
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        margin: EdgeInsets.only(
                                          left: Get.find<LanguageController>()
                                                      .langLocal ==
                                                  eng
                                              ? 0
                                              : 50,
                                          right: Get.find<LanguageController>()
                                                      .langLocal ==
                                                  eng
                                              ? 50
                                              : 0,
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1 /
                                                3.5,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                1 /
                                                3.5,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(0, 0),
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              blurRadius: 14,
                                              spreadRadius: 9,
                                            )
                                          ],
                                        ),
                                        child: Center(child: AddPhotoWidget(
                                          isAdmin: true,
                                          isEdit: widget.waiter != null,
                                          imagePath: waiterController.imagePath,
                                          webImage: waiterController.webImage,
                                          pickedImage: waiterController.pickedImage,
                                          pickedProfileImageFile: waiterController.pickedProfileImageFile,
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                                25.verticalSpace,
                                Obx(() {
                                  switch (waiterController.controllerState.value) {
                                    case ControllerState.loading:
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          CircularProgressIndicator(
                                              color: MyThemeData.light.primaryColor).paddingSymmetric(horizontal: 20),
                                        ],
                                      );
                                    case ControllerState.error:
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          CustomButton(
                                            buttonText: widget.isEdit == true ? 'edit'.tr : 'save'.tr,
                                            icon: SvgPicture.asset(Images.correct)
                                                .paddingSymmetric(horizontal: 4),
                                            style: TajawalBold.copyWith(
                                              color: Colors.white,
                                            ),
                                            radius: 20,
                                            width: 160,
                                            height: 45,
                                            backGroundColor:
                                            MyThemeData.light.primaryColor,
                                            onPressed: () {
                                              if (waiterKey.currentState!.validate()) {
                                                if(widget.isEdit == true){
                                                  waiterController.updateWaiters(
                                                    context,
                                                    widget.waiter!.id!,
                                                  );
                                                }else {
                                                  waiterController.createWaiters(context);
                                                }
                                              }
                                            },
                                          ),
                                        ],
                                      );
                                    default:
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          CustomButton(
                                            buttonText: widget.isEdit == true ? 'edit'.tr : 'save'.tr,
                                            icon: SvgPicture.asset(Images.correct)
                                                .paddingSymmetric(horizontal: 4),
                                            style: TajawalBold.copyWith(
                                              color: Colors.white,
                                            ),
                                            radius: 20,
                                            width: 160,
                                            height: 45,
                                            backGroundColor:
                                            MyThemeData.light.primaryColor,
                                            onPressed: () {
                                              if (waiterKey.currentState!.validate()) {
                                                if(widget.isEdit == true){
                                                  waiterController.updateWaiters(
                                                    context,
                                                    widget.waiter!.id!,
                                                  );
                                                }else {
                                                  waiterController.createWaiters(context);
                                                }
                                              }
                                            },
                                          ),
                                        ],
                                      );
                                  }
                                }),
                                25.verticalSpace,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
