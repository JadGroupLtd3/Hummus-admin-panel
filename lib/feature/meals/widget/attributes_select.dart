import 'dart:developer';

import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class AttributesSelect extends StatefulWidget {
  const AttributesSelect({super.key});

  @override
  AttributesSelectState createState() => AttributesSelectState();
}

class AttributesSelectState extends State<AttributesSelect> {
  final AttributeController attributeController =
      Get.find<AttributeController>();
  final LanguageController languageController = Get.find<LanguageController>();
  final MealsController mealsController = Get.find<MealsController>();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealsController>(
      builder: (mealsController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          width: MediaQuery.of(context).size.height * 1 / 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
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
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Images.Elements,
                    height: 20,
                    width: 20,
                    color: MyThemeData.light.focusColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Attributes'.tr,
                    style: TajawalBold.copyWith(
                      fontSize: 14,
                      color: MyThemeData.light.focusColor,
                    ),
                  ).paddingOnly(top: 5),
                ],
              ),
              30.verticalSpace,
              Obx(() {
                switch (mealsController.controllerState.value) {
                  case ControllerState.loading:
                    return const Center(
                      child: SizedBox(height: 100),
                    );
                  default:
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 120,
                              childAspectRatio: 4.0,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                            ),
                            itemCount: attributeController.attributeList.length,
                            itemBuilder: (context, index) {
                              final attribute = attributeController.attributeList[index];
                              final isSelected = mealsController
                                  .selectedAttributesList.any((element) =>
                                      element.attributeId == attribute.id);
                              final selectedAttribute = mealsController
                                  .selectedAttributesList
                                  .firstWhere(
                                (element) => element.attributeId == attribute.id,
                                orElse: () => CreateAttributes(
                                  attributeId: attribute.id!,
                                  image: '',
                                  nameAr: attribute.nameAr!,
                                  nameEn: attribute.nameEn!,
                                  nameHe: attribute.nameHe!,
                                  isCheck: 0,
                                  price: 0,
                                ),
                              );
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OnHover(
                                    matrix: 0,
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          mealsController.selectedAttributesList.removeWhere((element) => element.attributeId == attribute.id);
                                          if (mealsController.selectedAttributesList.any((element) => element.attributeId == attribute.id)) {
                                            final attributeIndex = mealsController.selectedAttributesList.indexWhere((element) => element.attributeId == attribute.id);
                                            mealsController.removeItemControllers(attributeIndex, 0);
                                          }
                                        } else {
                                          if (!mealsController.selectedAttributesList.contains(selectedAttribute)) {
                                            mealsController.selectedAttributesList.add(selectedAttribute);
                                            mealsController.initializeControllersForAttribute(attribute.id!);
                                          }
                                        }
                                      });
                                    },
                                    builder: (isHovered) {
                                      return Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 8,
                                            backgroundColor: isSelected ? MyThemeData.light.primaryColor : Colors.grey,
                                            child: Center(
                                              child: isSelected ? const Icon(Icons.check, color: Colors.white, size: 13) : null,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            languageController.langLocal == eng
                                                ? attributeController.attributeList[index].nameEn ?? ''
                                                : languageController.langLocal == ara
                                                ? attributeController.attributeList[index].nameAr ?? ''
                                                : attributeController.attributeList[index].nameHe ?? '',
                                            style: TajawalRegular.copyWith(fontSize: 14),
                                          ).paddingOnly(top: 5),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        if (mealsController.selectedAttributesList.isNotEmpty) ...[
                          for (var attribute
                              in mealsController.selectedAttributesList) ...[
                            Text(
                              languageController.langLocal == eng
                                  ? attribute.nameEn
                                  : languageController.langLocal == ara
                                      ? attribute.nameAr
                                      : attribute.nameHe,
                              style: TajawalBold.copyWith(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            ..._buildAttributeForm(attribute),
                          ],
                        ],
                      ],
                    );
                }
              }),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildAttributeForm(CreateAttributes attribute) {
    final attributeId = attribute.attributeId;
    final attributeIndex = mealsController.selectedAttributesList.indexWhere((element) => element.attributeId == attributeId);
    if (attributeIndex != -1 && mealsController.nameArControllers.length <= attributeIndex) {
      mealsController.initializeControllersForAttribute(attributeId);
    }
    return [
      Obx(() => Column(
          children: List.generate(
            mealsController.nameArControllers[attributeIndex].length,
                (index) => Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        height: 40,
                        hintText: 'Name ar'.tr,
                        controller: mealsController.nameArControllers[attributeIndex][index],
                        radius: 15,
                      ),
                    ),
                    5.horizontalSpace,
                    Expanded(
                      child: CustomTextField(
                        height: 40,
                        controller: mealsController.nameEnControllers[attributeIndex][index],
                        hintText: 'Name en'.tr,
                        radius: 15,
                      ),
                    ),
                    5.horizontalSpace,
                    Expanded(
                      child: CustomTextField(
                        controller: mealsController.nameHeControllers[attributeIndex][index],
                        hintText: 'Name He'.tr,
                        radius: 15,
                        height: 40,
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              mealsController.isCheckStates[attributeIndex][index] = 1;
                            });
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 8,
                                backgroundColor: mealsController.isCheckStates[attributeIndex][index] == 1
                                    ? MyThemeData.light.primaryColor
                                    : MyThemeData.light.hoverColor,
                                child: mealsController.isCheckStates[attributeIndex][index] == 1
                                    ? const Center(
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 13,
                                  ),
                                )
                                    : null,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'yes'.tr,
                                style: TajawalRegular.copyWith(fontSize: 14),
                              ).paddingOnly(top: 5),
                            ],
                          ),
                        ),
                        5.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              mealsController.isCheckStates[attributeIndex][index] = 0;
                            });
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 8,
                                backgroundColor: mealsController.isCheckStates[attributeIndex][index] == 0
                                    ? MyThemeData.light.primaryColor
                                    : MyThemeData.light.hoverColor,
                                child: mealsController.isCheckStates[attributeIndex][index] == 0
                                    ? const Center(
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 13,
                                  ),
                                )
                                    : null,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'no'.tr,
                                style: TajawalRegular.copyWith(fontSize: 14),
                              ).paddingOnly(top: 5),
                            ],
                          ),
                        ),
                        8.horizontalSpace,
                        if (mealsController.isCheckStates[attributeIndex][index] == 0)
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 1 / 8,
                            child: CustomTextField(
                              controller: mealsController.priceControllers[attributeIndex][index],
                              inputType: TextInputType.number,
                              hintText: 'Price'.tr,
                              height: 40,
                              radius: 15,
                            ),
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                            if (pickedFile != null) {
                              setState(() {
                                attribute.image = pickedFile.path;
                              });
                            }
                            print(pickedFile?.path);
                          },
                          child: Text('Pick Image'.tr),
                        ),
                        5.horizontalSpace,
                        ValueListenableBuilder<File?>(
                          valueListenable: ValueNotifier(attribute.image != '' ? File(attribute.image) : null),
                          builder: (context, file, child) {
                            return file != null
                                ? Text(file.path.substring(28))
                                : Text('No image selected'.tr);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                5.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      buttonText: '',
                      width: 45,
                      height: 40,
                      radius: 8,
                      backGroundColor: MyThemeData.light.primaryColor,
                      icon: Image.asset(Images.add, height: 24, width: 24),
                      onPressed: () {
                        setState(() {
                          mealsController.addNewItemControllers(attributeIndex);
                        });
                      },
                    ),
                    5.horizontalSpace,
                    CustomButton(
                      buttonText: '',
                      width: 45,
                      height: 40,
                      radius: 8,
                      backGroundColor: MyThemeData.light.focusColor,
                      icon: Icon(Icons.delete_outline_outlined, size: 20, color: Colors.grey.shade700),
                      onPressed: () {
                        if (mealsController.nameArControllers[attributeIndex].length > 1) {
                          setState(() {
                            if (index < mealsController.nameArControllers[attributeIndex].length) {
                              mealsController.removeItemControllers(attributeIndex, index);
                            }
                          });
                        }
                      },
                    ),
                  ],
                ),
                5.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    ];
  }

}
