import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class AddNewCategoryScreen extends StatefulWidget {
  final bool isEdit;
  final Category? category;

  const AddNewCategoryScreen({super.key, this.isEdit = false, this.category});

  @override
  State<AddNewCategoryScreen> createState() => _AddNewCategoryScreenState();
}

class _AddNewCategoryScreenState extends State<AddNewCategoryScreen> {
  final GlobalKey<FormState> categoryKey = GlobalKey<FormState>();
  final CategoryController categoryController = Get.find<CategoryController>();

  @override
  void initState() {
    categoryController.initState();
    if (widget.isEdit == true) {
      categoryController.isEdit(widget.category!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: GetBuilder<CategoryController>(
            builder: (categoryController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.isEdit == true
                        ? '${'Home'.tr} / ${'Category'.tr} / ${'Edit category'.tr}'
                        : '${'Home'.tr} / ${'Category'.tr} / ${'Add category'.tr}',
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
                        height: MediaQuery.of(context).size.height * 1 / 1.6,
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
                          fieldsKey: categoryKey,
                          controllerAR: categoryController.categoryNameAr,
                          controllerEN: categoryController.categoryNameEn,
                          controllerHE: categoryController.categoryNameHe,
                          sort: categoryController.categorySort,
                          isCategory: true,
                          isEdit: widget.isEdit,
                          onChanged: (val) {
                            val == true
                                ? categoryController.status.value = true
                                : categoryController.status.value = false;
                          },
                          enable: categoryController.status.value,
                        ),
                      ),
                      7.horizontalSpace,
                      Center(
                        child: AddPhotoWidget(
                          isCategory: true,
                          width: MediaQuery.of(context).size.height * 1 / 1.7,
                          isEdit: widget.category != null,
                          imagePath: categoryController.imagePath,
                          webImage: categoryController.webImage,
                          pickedImage: categoryController.pickedImage,
                          pickedProfileImageFile: categoryController.pickedProfileImageFile,
                        ),
                      ),
                    ],
                  ),
                  40.verticalSpace,
                  Obx(() {
                    switch (categoryController.controllerState.value) {
                      case ControllerState.loading:
                        return Center(
                          child: CircularProgressIndicator(
                              color: MyThemeData.light.primaryColor),
                        );
                      case ControllerState.error:
                        return Center(
                          child: CustomButton(
                            buttonText: widget.isEdit == true
                                ? 'edit'.tr
                                : 'save'.tr,
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
                              if (categoryKey.currentState!.validate()) {
                                if(widget.isEdit == true){
                                  categoryController.updateCategory(
                                    context,
                                    widget.category!.id!,
                                  );
                                }else {
                                  categoryController.createCategory(context);
                                }
                              }
                            },
                          ),
                        );
                      default:
                        return Center(
                          child: CustomButton(
                            buttonText: widget.isEdit == true
                                ? 'edit'.tr
                                : 'save'.tr,
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
                              if (categoryKey.currentState!.validate()) {
                                if(widget.isEdit == true){
                                  categoryController.updateCategory(
                                    context,
                                    widget.category!.id!,
                                  );
                                }else {
                                  categoryController.createCategory(context);
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
