import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/users/model/admin_model.dart';

class AddNewManagerScreen extends StatefulWidget {
  final Admin? admin;
  final bool isEdit;
  const AddNewManagerScreen({super.key,this.isEdit = false,this.admin});

  @override
  State<AddNewManagerScreen> createState() => _AddNewManagerScreenState();
}

class _AddNewManagerScreenState extends State<AddNewManagerScreen> {
  final GlobalKey<FormState> adminKey = GlobalKey<FormState>();
  final UsersController adminController = Get.find<UsersController>();
  @override
  void initState() {
    adminController.initState();
    if(widget.isEdit == true){
      adminController.isEdit(widget.admin!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: GetBuilder<UsersController>(
            builder: (adminController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.isEdit == true
                        ? '${'Home'.tr} / ${'Hashtags'.tr} / ${'Edit Manager'.tr}'
                        : '${'Home'.tr} / ${'Users'.tr} / ${'New Manager'.tr}',
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
                                          key: adminKey,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              Images.person,
                                                              width: 21,
                                                              height: 21,
                                                              color: MyThemeData.light.focusColor,
                                                            ).paddingSymmetric(horizontal: 7),
                                                            Text(
                                                              'admin Name'.tr,
                                                              style: TajawalRegular.copyWith(
                                                                fontSize: 13,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(height: 5),
                                                        CustomTextField(
                                                          height: 45,
                                                          radius: 20,
                                                          hintText: 'admin name'.tr,
                                                          inputType: TextInputType.text,
                                                          controller: adminController.adminNameController,
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
                                                          controller: adminController.emailController,
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
                                                          controller: adminController.phoneController,
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
                                                          controller: adminController.passwordController,
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
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        margin: EdgeInsets.only(
                                          left: Get.find<LanguageController>().langLocal == eng ? 0 : 50,
                                          right: Get.find<LanguageController>().langLocal == eng ? 50 : 0,
                                        ),
                                        height:
                                        MediaQuery.of(context).size.height * 1 / 3.5,
                                        width: MediaQuery.of(context).size.height * 1 / 3.5,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(0, 0),
                                              color: Colors.black.withOpacity(0.1),
                                              blurRadius: 14,
                                              spreadRadius: 9,
                                            )
                                          ],
                                        ),
                                        child: Center(child: AddPhotoWidget(
                                          isAdmin: true,
                                          isEdit: widget.admin != null,
                                          imagePath: adminController.imagePath,
                                          webImage: adminController.webImage,
                                          pickedImage: adminController.pickedImage,
                                          pickedProfileImageFile: adminController.pickedProfileImageFile,
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                                25.verticalSpace,
                                Obx(() {
                                  switch (adminController.controllerState.value) {
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
                                              if (adminKey.currentState!.validate()) {
                                                if(widget.isEdit == true){
                                                  adminController.updateAdmins(
                                                    context,
                                                    widget.admin!.id!,
                                                  );
                                                }else {
                                                  adminController.createAdmins(context);
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
                                              if (adminKey.currentState!.validate()) {
                                                if(widget.isEdit == true){
                                                  adminController.updateAdmins(
                                                    context,
                                                    widget.admin!.id!,
                                                  );
                                                }else {
                                                  adminController.createAdmins(context);
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
