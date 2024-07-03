import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class AccountInformationFields extends StatefulWidget {
  const AccountInformationFields({super.key});

  @override
  State<AccountInformationFields> createState() => _AccountInformationFieldsState();
}

class _AccountInformationFieldsState extends State<AccountInformationFields> {
  final GlobalKey<FormState> informationKey = GlobalKey<FormState>();
  final SettingsController settingsController = Get.find<SettingsController>();
  String title = 'Drinks section'.tr;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
     await settingsController.getSettings(context);
    });
    if(settingsController.settings.value != null) {
      settingsController.initSettings(settingsController.settings.value!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: GetBuilder<SettingsController>(
        builder: (settingsController) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 1 / 5.5,
                      width: MediaQuery.of(context).size.height * 1 / 5.5,
                      child: AddPhotoWidget(
                        isSettings: true,
                        isEdit: true,
                        imagePath: settingsController.imagePath,
                        webImage: settingsController.webImage,
                        pickedImage: settingsController.pickedImage,
                        pickedProfileImageFile: settingsController.pickedProfileImageFile,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Form(
                    key: informationKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        20.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.work_outline,
                                        size: 20,
                                        color: MyThemeData.light.focusColor,
                                      ).paddingSymmetric(horizontal: 7),
                                      Text(
                                        'Activity name'.tr,
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
                                    hintText: 'Activity name'.tr,
                                    inputType: TextInputType.text,
                                    controller: settingsController.appName,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.email,
                                        size: 20,
                                        color: MyThemeData.light.focusColor,
                                      ).paddingSymmetric(horizontal: 7),
                                      Text(
                                        'Email'.tr,
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
                                    hintText: 'Email'.tr,
                                    inputType: TextInputType.text,
                                    controller: settingsController.email,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        size: 20,
                                        color: MyThemeData.light.focusColor,
                                      ).paddingSymmetric(horizontal: 7),
                                      Text(
                                        'Phone Number'.tr,
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
                                    hintText: 'Phone Number'.tr,
                                    inputType: TextInputType.text,
                                    controller: settingsController.phone,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.numbers_outlined,
                                        size: 20,
                                        color: MyThemeData.light.focusColor,
                                      ).paddingSymmetric(horizontal: 7),
                                      Text(
                                        'Tax Number'.tr,
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
                                    hintText: 'Tax Number'.tr,
                                    inputType: TextInputType.phone,
                                    controller: settingsController.taxNumber,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 20,
                                        color: MyThemeData.light.focusColor,
                                      ).paddingSymmetric(horizontal: 7),
                                      Text(
                                        'Address'.tr,
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
                                    hintText: 'Address'.tr,
                                    inputType: TextInputType.text,
                                    controller: settingsController.address,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.fax_outlined,
                                        size: 20,
                                        color: MyThemeData.light.focusColor,
                                      ).paddingSymmetric(horizontal: 7),
                                      Text(
                                        'Fax Number'.tr,
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
                                    hintText: 'Fax Number'.tr,
                                    inputType: TextInputType.phone,
                                    controller: settingsController.fax,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.local_drink_outlined,
                                        size: 20,
                                        color: MyThemeData.light.focusColor,
                                      ).paddingSymmetric(horizontal: 7),
                                      Text(
                                        'Drinks section'.tr,
                                        style: TajawalRegular.copyWith(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  DropDownBTN(
                                    title: settingsController.drinkCatId.value == 1
                                        ? 'Drinks'.tr
                                        : title,
                                    onChanged: (String? val) {
                                      setState(() {
                                        if(val != null){
                                          title = val;
                                        }
                                      });
                                      if(val == 'Drinks'){
                                        settingsController.drinkCatId.value = 1;
                                      }
                                    },
                                    items: ['Drinks'.tr].map((val) {
                                      return DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(
                                          val,
                                          style: TajawalRegular.copyWith(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      );
                                    },
                                    ).toList(),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.facebook_outlined,
                                        size: 20,
                                        color: MyThemeData.light.focusColor,
                                      ).paddingSymmetric(horizontal: 7),
                                      Text(
                                        'FaceBook'.tr,
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
                                    hintText: 'FaceBook'.tr,
                                    inputType: TextInputType.text,
                                    controller: settingsController.facebook,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.web,
                                        size: 20,
                                        color: MyThemeData.light.focusColor,
                                      ).paddingSymmetric(horizontal: 7),
                                      Text(
                                        'Google'.tr,
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
                                    hintText: 'Google'.tr,
                                    inputType: TextInputType.text,
                                    controller: settingsController.google,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.perm_media_outlined,
                                        size: 20,
                                        color: MyThemeData.light.focusColor,
                                      ).paddingSymmetric(horizontal: 7),
                                      Text(
                                        'Instagram'.tr,
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
                                    hintText: 'Instagram'.tr,
                                    inputType: TextInputType.text,
                                    controller: settingsController.instagram,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.tiktok_outlined,
                                        size: 20,
                                        color: MyThemeData.light.focusColor,
                                      ).paddingSymmetric(horizontal: 7),
                                      Text(
                                        'Tiktok'.tr,
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
                                    hintText: 'Tiktok'.tr,
                                    inputType: TextInputType.text,
                                    controller: settingsController.tiktok,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.web,
                                        size: 20,
                                        color: MyThemeData.light.focusColor,
                                      ).paddingSymmetric(horizontal: 7),
                                      Text(
                                        'Twitter'.tr,
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
                                    hintText: 'Twitter'.tr,
                                    inputType: TextInputType.text,
                                    controller: settingsController.twitter,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.chat_outlined,
                                        size: 20,
                                        color: MyThemeData.light.focusColor,
                                      ).paddingSymmetric(horizontal: 7),
                                      Text(
                                        'Whatsapp'.tr,
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
                                    hintText: 'Whatsapp'.tr,
                                    inputType: TextInputType.text,
                                    controller: settingsController.whatsapp,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.monetization_on_outlined,
                                        size: 20,
                                        color: MyThemeData.light.focusColor,
                                      ).paddingSymmetric(horizontal: 7),
                                      Text(
                                        'Delivery Price'.tr,
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
                                    hintText: 'Delivery Price'.tr,
                                    inputType: TextInputType.phone,
                                    controller: settingsController.deliveryPrice,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        45.verticalSpace,
                        Obx(() {
                          switch (settingsController.controllerState.value) {
                            case ControllerState.loading:
                              return Row(
                                children:
                                [
                                  10.horizontalSpace,
                                  CircularProgressIndicator(
                                    color: MyThemeData.light.primaryColor,
                                  ),
                                ],
                              );
                            case ControllerState.error:
                              return Row(
                                children: [
                                  CustomButton(
                                    buttonText: 'save'.tr,
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
                                      if(informationKey.currentState!.validate()){
                                        settingsController.createSettings(context);
                                      }
                                    },
                                  ),
                                ],
                              );
                            default:
                              return Row(
                                children: [
                                  CustomButton(
                                    buttonText: 'save'.tr,
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
                                      if(informationKey.currentState!.validate()){
                                        settingsController.createSettings(context);
                                      }
                                    },
                                  ),
                                ],
                              );
                          }
                        }),
                        10.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
