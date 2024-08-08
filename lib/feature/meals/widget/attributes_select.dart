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
                              final isSelected = mealsController.selectedMapAttributesList.containsKey(attribute.id.toString());
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OnHover(
                                    matrix: 0,
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          mealsController.selectedMapAttributesList.remove(attribute.id.toString());
                                          mealsController.removeItemControllers(index, 1);
                                        } else {
                                          mealsController.selectAttribute(attribute.id!);
                                          final newAttribute = CreateAttributes(
                                            attributeId: attribute.id!,
                                            attributeName: languageController.langLocal == eng
                                                ? attribute.nameEn ?? ''
                                                : languageController.langLocal == ara
                                                ? attribute.nameAr ?? ''
                                                : attribute.nameHe ?? '',
                                            nameAr: '',
                                            nameEn: '',
                                            nameHe: '',
                                            isCheck: 0,
                                            price: 0,
                                          );
                                          mealsController.addCreateAttribute(attribute.id!, newAttribute);
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
                        5.verticalSpace,
                        if (mealsController.selectedMapAttributesList.isNotEmpty) ...[
                          for (var entry in mealsController.selectedMapAttributesList.entries) ...[
                            Text(
                              entry.value[0].attributeName ?? entry.key,
                              style: TajawalBold.copyWith(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            ..._buildAttributeForm(int.parse(entry.key)),
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

  List<Widget> _buildAttributeForm(int attributeId) {
    final attributeList = mealsController.selectedMapAttributesList[attributeId.toString()] ?? [];
    final attributeIndex = mealsController.selectedMapAttributesList.keys.toList().indexOf(attributeId.toString());
    if (attributeIndex != -1) {
      while (mealsController.nameArControllers.length <= attributeIndex) {
        mealsController.initializeControllers();
      }
    }
    return [
      Obx(() {
        if (attributeIndex < 0 || attributeIndex >= mealsController.nameArControllers.length) {
          return const SizedBox.shrink();
        }
        return Column(
          children: List.generate(
            attributeList.length,
                (index) {
              if (index >= mealsController.nameArControllers[attributeIndex].length) {
                return const SizedBox.shrink();
              }
              final attribute = attributeList[index];
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          height: 40,
                          hintText: 'Attribute name Arabic'.tr,
                          controller: TextEditingController(text: attribute.nameAr),
                          radius: 15,
                          onChanged: (value) {
                            attribute.nameAr = value;
                          },
                        ),
                      ),
                      5.horizontalSpace,
                      Expanded(
                        child: CustomTextField(
                          height: 40,
                          controller: TextEditingController(text: attribute.nameEn),
                          hintText: 'Attribute name English'.tr,
                          radius: 15,
                          onChanged: (value) {
                            attribute.nameEn = value;
                          },
                        ),
                      ),
                      5.horizontalSpace,
                      Expanded(
                        child: CustomTextField(
                          height: 40,
                          controller: TextEditingController(text: attribute.nameHe),
                          hintText: 'Attribute name Hebrew'.tr,
                          radius: 15,
                          onChanged: (value) {
                            attribute.nameHe = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  15.verticalSpace,
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
                                attribute.isCheck = 1;
                                attribute.price = 0;
                              });
                            },
                            builder: (isHovered) => Row(
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
                                mealsController.isCheckStates[attributeIndex][index] = 0;
                                attribute.isCheck = 0;
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
                                    attribute.price = int.tryParse(value) ?? 0;
                                  }
                                },
                              ),
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomButton(
                            buttonText: 'Pick Image'.tr,
                            icon: const Icon(Icons.photo,size: 20,color: Colors.white),
                            backGroundColor: MyThemeData.light.primaryColor,
                            width: 120,
                            height: 38,
                            radius: 10,
                            paddingTop: 5,
                            onPressed: () async {
                              XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                              if (pickedFile != null) {
                                setState(() {
                                  attribute.image = pickedFile.path;
                                });
                              }
                            },
                          ),
                          5.horizontalSpace,
                          ValueListenableBuilder<File?>(
                            valueListenable: ValueNotifier(
                                attribute.image != '' ? File(attributeList[index].image ?? '') : null),
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
                  10.verticalSpace,
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
                            attributeList.add(CreateAttributes(
                              attributeId: attribute.attributeId,
                            ));
                          });
                        },
                      ),
                      5.horizontalSpace,
                     mealsController.nameArControllers[attributeIndex].length > 1
                      ? CustomButton(
                        buttonText: '',
                        width: 45,
                        height: 40,
                        radius: 8,
                        backGroundColor: Colors.red,
                        icon: SvgPicture.asset(Images.close),
                        onPressed: () {
                          if (mealsController.nameArControllers[attributeIndex].length > 1) {
                            setState(() {
                              if (index < mealsController.nameArControllers[attributeIndex].length) {
                                mealsController.removeItemControllers(attributeIndex, index);
                                attributeList.removeAt(index);
                              }
                            });
                          }
                        },
                      )
                      : const SizedBox(width: 20),
                    ],
                  ),
                  10.verticalSpace,
                ],
              );
            },
          ),
        );
      }),
    ];
  }
}

