import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/meals/model/create_meal_model.dart';

class AttributesSelect extends StatefulWidget {
  const AttributesSelect({super.key});

  @override
  AttributesSelectState createState() => AttributesSelectState();
}

class AttributesSelectState extends State<AttributesSelect> {
  final AttributeController attributeController = Get.find<AttributeController>();
  final LanguageController languageController = Get.find<LanguageController>();
  final MealsController mealsController = Get.find<MealsController>();
  CreateAttributes? selectedAttributes;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealsController>(
      builder: (mealsController) {
        return Column(
          children: [
            Column(
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
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 1.4,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                          ),
                          itemCount: attributeController.attributeList.length,
                          itemBuilder: (context, index) {
                            final attribute =
                            attributeController.attributeList[index];
                            final isSelected = mealsController.selectedAttributesList
                                .any(
                                    (element) => element.attributeId == attribute.id);
                            final selectedAttribute =
                            mealsController.selectedAttributesList.firstWhere(
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
                            return OnHover(
                              matrix: 0,
                              onTap: () {
                                selectedAttributes = CreateAttributes(
                                  attributeId: attribute.id!,
                                  image: '',
                                  nameAr: attribute.nameAr ?? "",
                                  nameEn: attribute.nameEn ?? "",
                                  nameHe: attribute.nameHe ?? "",
                                  isCheck: 0,
                                  price: 0,
                                );
                                if (isSelected) {
                                  mealsController.selectedAttributesList.removeWhere(
                                          (element) => element.attributeId == attribute.id);
                                } else {
                                  mealsController.selectedAttributesList.add(selectedAttributes!);
                                }
                                setState(() {
                                  print(selectedAttributes?.toJson());
                                  print(mealsController.selectedAttributesList.toJson());
                                });
                              },
                              builder: (isHovered) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 8,
                                          backgroundColor: isSelected
                                              ? MyThemeData.light.primaryColor
                                              : Colors.grey,
                                          child: Center(
                                            child: isSelected
                                                ? const Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 13,
                                            )
                                                : null,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          languageController.langLocal == eng
                                              ? attributeController
                                              .attributeList[index].nameEn ??
                                              ''
                                              : languageController.langLocal == ara
                                              ? attributeController
                                              .attributeList[index]
                                              .nameAr ??
                                              ''
                                              : attributeController
                                              .attributeList[index]
                                              .nameHe ??
                                              '',
                                          style: TajawalRegular.copyWith(
                                            fontSize: 14,
                                          ),
                                        ).paddingOnly(top: 5),
                                      ],
                                    ),
                                    if (isSelected)
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Default'.tr,
                                            style: TajawalBold.copyWith(
                                              fontSize: 12,
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    selectedAttribute.isCheck = 1;
                                                    print(
                                                        selectedAttributes?.toJson());
                                                  });
                                                },
                                                child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 8,
                                                      backgroundColor:
                                                      selectedAttribute.isCheck ==
                                                          1
                                                          ? MyThemeData
                                                          .light.primaryColor
                                                          : MyThemeData
                                                          .light.hoverColor,
                                                      child: selectedAttribute
                                                          .isCheck ==
                                                          1
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
                                                      style: TajawalRegular.copyWith(
                                                        fontSize: 14,
                                                      ),
                                                    ).paddingOnly(top: 5),
                                                  ],
                                                ),
                                              ),
                                              15.horizontalSpace,
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    selectedAttribute.isCheck = 0;
                                                    print(
                                                        selectedAttributes?.toJson());
                                                  });
                                                },
                                                child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 8,
                                                      backgroundColor:
                                                      selectedAttribute.isCheck ==
                                                          0
                                                          ? MyThemeData
                                                          .light.primaryColor
                                                          : MyThemeData
                                                          .light.hoverColor,
                                                      child: selectedAttribute
                                                          .isCheck ==
                                                          0
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
                                                      style: TajawalRegular.copyWith(
                                                        fontSize: 14,
                                                      ),
                                                    ).paddingOnly(top: 5),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (selectedAttribute.isCheck == 0)
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Price'.tr,
                                                  style: TajawalRegular.copyWith(
                                                    fontSize: 12,
                                                  ),
                                                ).paddingSymmetric(vertical: 3),
                                                SizedBox(
                                                  width: 60,
                                                  child: CustomTextField(
                                                    height: 30,
                                                    radius: 5,
                                                    inputType: TextInputType.phone,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedAttribute.price = int.tryParse(value) ?? 0;
                                                        print(selectedAttributes?.toJson());
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ).paddingOnly(
                                              right: languageController.langLocal == eng
                                                  ? 0
                                                  : 90,
                                              left: languageController.langLocal == eng
                                                  ? 90
                                                  : 0,
                                            ),
                                        ],
                                      ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      );
                  }
                }),
              ],
            ),
          ],
        );
      },
    );
  }
}
