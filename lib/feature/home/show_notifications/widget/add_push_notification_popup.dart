import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/home/show_notifications/controller/push_notification_controller.dart';
import 'package:hummus_admin_panel/feature/home/show_notifications/widget/push_notification_nav_bar.dart';

class AddPushNotification extends StatefulWidget {
  const AddPushNotification({super.key});

  @override
  State<AddPushNotification> createState() => _AddPushNotificationState();
}

class _AddPushNotificationState extends State<AddPushNotification> {
  final NotificationController notificationController = Get.find<NotificationController>();
  final CategoryController categoryController = Get.find<CategoryController>();
  final MealsController mealsController = Get.find<MealsController>();
  final LanguageController languageController = Get.find<LanguageController>();
  final SliderPagesController sliderPageController = Get.find<SliderPagesController>();
  final GlobalKey<FormState> notificationKey = GlobalKey<FormState>();

  String title = 'Type of notification'.tr;
  String mealTitle = ''.tr;
  String categoryTitle = ''.tr;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PushNotificationController>(
      builder: (pushNotificationController) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Push Notification'.tr,
                      style: TajawalRegular.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.close),
                    )
                  ],
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey.shade400,
              ),
              15.verticalSpace,
              PushNotificationNavBar(
                sliderPagesController: sliderPageController,
              ),
              15.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Type of notification'.tr,
                                style: TajawalRegular.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                              DropDownBTN(
                                title: title,
                                onChanged: (String? val) {
                                  setState(() {
                                    if (val != null) {
                                      title = val;
                                    }
                                  });
                                  if(val == 'Meal'.tr){
                                    pushNotificationController.type.value = "meal_id";
                                  }else if(val == 'Category'.tr){
                                    pushNotificationController.type.value = "cat_id";
                                  }
                                  print(pushNotificationController.type.value);
                                },
                                items: ['Meal'.tr,'Category'.tr].map(
                                  (val) {
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
                        15.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pushNotificationController.type.value == "meal_id"
                                    ? 'Meal'.tr
                                    : pushNotificationController.type.value == "cat_id"
                                    ? 'Category'.tr
                                    : '',
                                style: TajawalRegular.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                              pushNotificationController.type.value == "meal_id"
                                  ? DropDownBTN(
                                title: mealTitle,
                                onChanged: (String? val) {
                                  if (val != null) {
                                    setState(() {
                                      mealTitle = languageController.langLocal == eng
                                          ? mealsController.mealsList
                                          .firstWhere((element) =>
                                      element.id.toString() == val).name.en
                                          : languageController.langLocal == ara
                                          ? mealsController.mealsList
                                          .firstWhere((element) =>
                                      element.id.toString() == val).name.ar
                                          : mealsController.mealsList
                                          .firstWhere((element) =>
                                      element.id.toString() == val).name.he;
                                    });
                                    pushNotificationController.typeId.value = int.parse(val);
                                    print(pushNotificationController.typeId.value);
                                  }
                                },
                                items: mealsController.mealsList.map((val) {
                                    return DropdownMenuItem<String>(
                                      value: val.id.toString(),
                                      child: Text(
                                        languageController.langLocal == eng
                                            ? val.name.en
                                            : languageController.langLocal == ara
                                            ? val.name.ar : val.name.he,
                                        style: TajawalRegular.copyWith(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                              )
                                  : pushNotificationController.type.value == "cat_id"
                                  ? DropDownBTN(
                                title: categoryTitle,
                                onChanged: (String? val) {
                                  setState(() {
                                    if (val != null) {
                                      categoryTitle = languageController.langLocal == eng
                                          ? categoryController.categoryList
                                          .firstWhere((element) =>
                                      element.id.toString() == val)
                                          .nameEn ??
                                          ''
                                          : languageController.langLocal == ara
                                          ? categoryController.categoryList
                                          .firstWhere((element) =>
                                      element.id.toString() == val)
                                          .nameAr ??
                                          ''
                                          : categoryController.categoryList
                                          .firstWhere((element) =>
                                      element.id.toString() == val)
                                          .nameHe ??
                                          '';
                                    }
                                    pushNotificationController.typeId.value = int.parse(val ?? '');
                                    print(pushNotificationController.typeId.value);
                                  });
                                },
                                items: categoryController.categoryList.map((val) {
                                  return DropdownMenuItem<String>(
                                    value: val.id.toString(),
                                    child: Text(
                                      languageController.langLocal == eng
                                          ? val.nameEn ?? ''
                                          : languageController.langLocal == ara
                                          ? val.nameAr ?? '' : val.nameHe ?? '',
                                      style: TajawalRegular.copyWith(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                },
                                ).toList(),
                              )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 1 / 1.9,
                      child: PageView(
                        onPageChanged: sliderPageController.animateToPushNotificationNameTab,
                        controller: sliderPageController.pushNotificationPageController,
                        physics: const NeverScrollableScrollPhysics(),
                        clipBehavior: Clip.none,
                        children: [...sliderPageController.pushNotificationNamesPages],
                      ),
                    ),
                    10.verticalSpace,
                    Obx(() {
                      switch (notificationController.controllerState.value) {
                        case ControllerState.loading:
                          return Center(
                            child: CircularProgressIndicator(
                              color: MyThemeData.light.primaryColor,
                            ),
                          );
                        case ControllerState.error:
                          return CustomButton(
                            buttonText: 'save'.tr,
                            style: TajawalBold.copyWith(color: Colors.white),
                            icon: SvgPicture.asset(Images.correct).paddingSymmetric(horizontal: 4),
                            radius: 25,
                            width: 120,
                            height: 45,
                            backGroundColor: MyThemeData.light.primaryColor,
                            onPressed: (){
                              pushNotificationController.createPushNotification(context);
                            },
                          );
                        default:
                          return CustomButton(
                            buttonText: 'save'.tr,
                            style: TajawalBold.copyWith(color: Colors.white),
                            icon: SvgPicture.asset(Images.correct).paddingSymmetric(horizontal: 4),
                            radius: 25,
                            width: 120,
                            height: 45,
                            backGroundColor: MyThemeData.light.primaryColor,
                            onPressed: (){
                              pushNotificationController.createPushNotification(context);
                            },
                          );
                      }
                    }),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
