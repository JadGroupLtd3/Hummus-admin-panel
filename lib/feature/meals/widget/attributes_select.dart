import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class AttributesSelect extends StatefulWidget {
  const AttributesSelect({super.key});

  @override
  AttributesSelectState createState() => AttributesSelectState();
}

class AttributesSelectState extends State<AttributesSelect> {
  final AttributeController attributeController = Get.find<AttributeController>();
  final LanguageController languageController = Get.find<LanguageController>();
  final MealsController mealsController = Get.find<MealsController>();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealsController>(
      builder: (mealsController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          width: MediaQuery.of(context).size.height * 1 / 0.7,
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
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 120,
                              childAspectRatio: 4.0,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                            ),
                            itemCount: attributeController.attributeList.length,
                            itemBuilder: (context, index) {
                              final attribute = attributeController.attributeList[index];
                              final isSelected = mealsController.selectedAttributesList
                                  .any((element) => element.attributeId == attribute.id);
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OnHover(
                                    matrix: 0,
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          mealsController.selectedAttributesList
                                              .removeWhere((element) => element.attributeId == attribute.id);
                                          mealsController.removeItemControllers(index, 1);
                                        } else {
                                          final newAttribute = CreateAttributes(
                                            attributeId: attribute.id!,
                                            attributeName: languageController.langLocal == eng
                                                ? attribute.nameEn ?? ''
                                                : languageController.langLocal == ara
                                                ? attribute.nameAr ?? ''
                                                : attribute.nameHe ?? '',
                                            nameAr: index < mealsController.nameArControllers.length &&
                                                mealsController.nameArControllers[index].isNotEmpty
                                                ? mealsController.nameArControllers[index][0].text
                                                : '',
                                            nameEn: index < mealsController.nameEnControllers.length &&
                                                mealsController.nameEnControllers[index].isNotEmpty
                                                ? mealsController.nameEnControllers[index][0].text
                                                : '',
                                            nameHe: index < mealsController.nameHeControllers.length &&
                                                mealsController.nameHeControllers[index].isNotEmpty
                                                ? mealsController.nameHeControllers[index][0].text
                                                : '',
                                            isCheck: index < mealsController.isCheckStates.length &&
                                                mealsController.isCheckStates[index].isNotEmpty
                                                ? mealsController.isCheckStates[index][0]
                                                : 0,
                                            price: index < mealsController.priceControllers.length &&
                                                mealsController.priceControllers[index].isNotEmpty
                                                ? (index < mealsController.isCheckStates.length &&
                                                mealsController.isCheckStates[index].isNotEmpty &&
                                                mealsController.isCheckStates[index][0] == 0
                                                ? int.tryParse(mealsController.priceControllers[index][0].text) ?? 0
                                                : 0)
                                                : 0,
                                          );
                                          mealsController.selectedAttributesList.add(newAttribute);
                                          mealsController.initializeControllersForAttribute(attribute.id!);
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
                                              child: isSelected
                                                  ? const Icon(Icons.check, color: Colors.white, size: 13)
                                                  : null,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            languageController.langLocal == eng
                                                ? attribute.nameEn ?? ''
                                                : languageController.langLocal == ara
                                                ? attribute.nameAr ?? ''
                                                : attribute.nameHe ?? '',
                                            style: TajawalRegular.copyWith(
                                              fontSize: 14,
                                            ),
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
                          for (var attribute in mealsController.selectedAttributesList) ...[
                            Text(
                              attribute.attributeName ?? '',
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
    final attributeIndex = mealsController.selectedAttributesList
        .indexWhere((element) => element.attributeId == attributeId);
    if (attributeIndex != -1 && mealsController.nameArControllers.length <= attributeIndex) {
      mealsController.initializeControllersForAttribute(attributeId);
    }
    return [
      Obx(() {
        return Column(
          children: List.generate(
            mealsController.nameArControllers[attributeIndex].length,
                (index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          height: 40,
                          hintText: 'Name ar'.tr,
                          controller: mealsController.nameArControllers[attributeIndex][index],
                          radius: 15,
                          onChanged: (value) {
                            if (attributeIndex != -1) {
                              mealsController.selectedAttributesList[attributeIndex].
                              nameAr = value;
                            }
                          },
                        ),
                      ),
                      5.horizontalSpace,
                      Expanded(
                        child: CustomTextField(
                          height: 40,
                          controller: mealsController.nameEnControllers[attributeIndex][index],
                          hintText: 'Name en'.tr,
                          radius: 15,
                          onChanged: (value) {
                            if (attributeIndex != -1) {
                              mealsController.selectedAttributesList[attributeIndex].
                              nameEn = value;
                            }
                          },
                        ),
                      ),
                      5.horizontalSpace,
                      Expanded(
                        child: CustomTextField(
                          controller: mealsController.nameHeControllers[attributeIndex][index],
                          hintText: 'Name He'.tr,
                          radius: 15,
                          height: 40,
                          onChanged: (value) {
                            if (attributeIndex != -1) {
                              mealsController.selectedAttributesList[attributeIndex].
                              nameHe = value;
                            }
                          },
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
                          OnHover(
                            matrix: 0,
                            onTap: () {
                              setState(() {
                                mealsController.isCheckStates[attributeIndex][index] = 1;
                                attribute.isCheck = mealsController.isCheckStates[attributeIndex][index];
                                attribute.price = 0;
                              });
                            },
                            builder: (isHovered) =>  Row(
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
                          OnHover(
                            matrix: 0,
                            onTap: () {
                              setState(() {
                                print(mealsController.selectedAttributesList.toJson());
                                attribute.isCheck = mealsController.isCheckStates[attributeIndex][index];
                              });
                            },
                            builder: (isHovered) => Row(
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
                                onChanged: (value) {
                                  if (attributeIndex != -1) {
                                    mealsController.selectedAttributesList[attributeIndex].
                                    price = int.tryParse(value) ?? 0;
                                  }
                                },
                              ),
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
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
                            valueListenable: ValueNotifier(attribute.image != '' ? File(attribute.image ?? '') : null),
                            builder: (context, file, child) {
                              return file != null
                                  ? Text(file.path.length > 28 ? file.path.substring(28) : file.path)
                                  : Text('No image selected'.tr);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     CustomButton(
                  //       buttonText: '',
                  //       width: 45,
                  //       height: 40,
                  //       radius: 8,
                  //       backGroundColor: MyThemeData.light.primaryColor,
                  //       icon: Image.asset(Images.add, height: 24, width: 24),
                  //       onPressed: () {
                  //         setState(() {
                  //           mealsController.addNewItemControllers(attributeIndex);
                  //           mealsController.selectedAttributesList.add(attribute);
                  //         });
                  //       },
                  //     ),
                  //     5.horizontalSpace,
                  //     CustomButton(
                  //       buttonText: '',
                  //       width: 45,
                  //       height: 40,
                  //       radius: 8,
                  //       backGroundColor: MyThemeData.light.focusColor,
                  //       icon: Icon(Icons.delete_outline_outlined, size: 20, color: Colors.grey.shade700),
                  //       onPressed: () {
                  //         if (mealsController.nameArControllers[attributeIndex].length > 1) {
                  //           setState(() {
                  //             if (index < mealsController.nameArControllers[attributeIndex].length) {
                  //               mealsController.removeItemControllers(attributeIndex, index);
                  //               mealsController.selectedAttributesList.remove(attribute);
                  //             }
                  //           });
                  //         }
                  //       },
                  //     ),
                  //   ],
                  // ),
                  5.verticalSpace,
                ],
              );
            },
          ),
        );
      }),
    ];
  }
}
