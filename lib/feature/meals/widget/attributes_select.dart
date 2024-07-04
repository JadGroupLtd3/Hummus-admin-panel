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

  final List<bool> _selectedAttributes =
      List.filled(Get.find<AttributeController>().attributeList.length, false);
  final List<bool> _defaultOptions =
      List.filled(Get.find<AttributeController>().attributeList.length, false);

  void _toggleSelection(int index) {
    setState(() {
      _selectedAttributes[index] = !_selectedAttributes[index];
    });
  }

  void _toggleDefaultOption(int index, bool isYes) {
    setState(() {
      _defaultOptions[index] = isYes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttributeController>(
      builder: (attributeController) {
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
                Container(
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
                    itemCount: _selectedAttributes.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _toggleSelection(index),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: _selectedAttributes[index]
                                      ? MyThemeData.light.primaryColor
                                      : Colors.grey,
                                  child: Center(
                                    child: _selectedAttributes[index]
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
                                      ? attributeController.attributeList[index].nameEn ?? ''
                                      : languageController.langLocal == ara
                                      ? attributeController.attributeList[index].nameAr ?? ''
                                      : attributeController.attributeList[index].nameHe ?? '',
                                  style: TajawalRegular.copyWith(
                                    fontSize: 14,
                                  ),
                                ).paddingOnly(top: 5),
                              ],
                            ),
                            if (_selectedAttributes[index])
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () =>
                                            _toggleDefaultOption(index, true),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 8,
                                              backgroundColor:
                                                  _defaultOptions[index]
                                                      ? MyThemeData
                                                          .light.primaryColor
                                                      : MyThemeData
                                                          .light.hoverColor,
                                              child: _defaultOptions[index]
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
                                        onTap: () =>
                                            _toggleDefaultOption(index, false),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 8,
                                              backgroundColor:
                                                  !_defaultOptions[index]
                                                      ? MyThemeData
                                                          .light.primaryColor
                                                      : MyThemeData
                                                          .light.hoverColor,
                                              child: !_defaultOptions[index]
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
                                  if (!_defaultOptions[index])
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
                                        const SizedBox(
                                          width: 60,
                                          child: CustomTextField(
                                            height: 30,
                                            radius: 5,
                                            inputType: TextInputType.phone,
                                          ),
                                        ),
                                      ],
                                    ).paddingOnly(
                                      right: Get.find<LanguageController>()
                                                  .langLocal ==
                                              eng
                                          ? 0
                                          : 90,
                                      left: Get.find<LanguageController>()
                                                  .langLocal ==
                                              eng
                                          ? 90
                                          : 0,
                                    ),
                                ],
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
