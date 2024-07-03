import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class AttributeTableWidget extends StatefulWidget {
  const AttributeTableWidget({super.key});

  @override
  State<AttributeTableWidget> createState() => _AttributeTableWidgetState();
}

class _AttributeTableWidgetState extends State<AttributeTableWidget> {
  @override
  void initState() {
    Get.find<AttributeController>().getAttribute(context);
    super.initState();
  }

  final LanguageController languageController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttributeController>(
      builder: (attributeController) {
        return Column(
          children: [
            Table(
              columnWidths: const {
                1: IntrinsicColumnWidth(),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: MyThemeData.light.focusColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                  children: [
                    const TextUtils(title: '#', color: Colors.white)
                        .paddingOnly(
                            right: languageController.langLocal == eng ? 0 : 20,
                            left: languageController.langLocal == eng ? 20 : 0),
                    TextUtils(title: ''.tr, color: Colors.white)
                        .paddingOnly(
                            left: languageController.langLocal == eng ? 0 : 30,
                            right:
                                languageController.langLocal == eng ? 30 : 0),
                    TextUtils(title: 'Arabic Name'.tr, color: Colors.white)
                        .paddingOnly(
                            left: languageController.langLocal == eng ? 40 : 0,
                            right:
                                languageController.langLocal == eng ? 0 : 40),
                    Center(
                        child: TextUtils(
                            title: 'English Name'.tr, color: Colors.white)),
                    TextUtils(title: 'Hebrew Name'.tr, color: Colors.white),
                    TextUtils(
                        title: 'Activation status'.tr, color: Colors.white),
                    TextUtils(title: 'Operations'.tr, color: Colors.white)
                        .paddingOnly(
                            left: languageController.langLocal == eng ? 35 : 0,
                            right:
                                languageController.langLocal == eng ? 0 : 35),
                  ],
                ),
              ],
            ),
            Obx(
              () {
                if (attributeController.controllerState.value ==
                    ControllerState.loading) {
                  return Column(
                    children: [
                      const SizedBox(height: 30),
                      Center(
                        child: CircularProgressIndicator(
                          color: MyThemeData.light.primaryColor,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: attributeController.attributeList.length,
                      itemBuilder: (context, index) {
                        final attribute =
                            attributeController.attributeList[index];
                        return Table(
                          columnWidths: const {
                            1: IntrinsicColumnWidth(),
                          },
                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      color: Colors.black.withOpacity(0.1)),
                                  bottom: BorderSide(
                                      color: Colors.black.withOpacity(0.1)),
                                ),
                              ),
                              children: [
                                TextUtils(title: '${attribute.id}').paddingOnly(
                                    right: languageController.langLocal == eng
                                        ? 0
                                        : 20,
                                    left: languageController.langLocal == eng
                                        ? 20
                                        : 0,
                                    top: 10,
                                    bottom: 10),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: const SizedBox(
                                    width: 36,
                                    height: 36,
                                  ),
                                ).paddingOnly(
                                    left: languageController.langLocal == eng
                                        ? 0
                                        : 30,
                                    right: languageController.langLocal == eng
                                        ? 30
                                        : 0,
                                    top: 10,
                                    bottom: 10),
                                TextUtils(title: attribute.nameAr ?? '')
                                    .paddingOnly(
                                        left: languageController.langLocal == eng
                                                ? 20
                                                : 0,
                                        right: languageController.langLocal == eng
                                                ? 0
                                                : 20,
                                        top: 10,
                                        bottom: 10),
                                TextUtils(title: attribute.nameEn ?? '')
                                    .paddingOnly(
                                    left: languageController.langLocal == eng
                                        ? 20
                                        : 0,
                                    right: languageController.langLocal == eng
                                        ? 0
                                        : 20,
                                    top: 10, bottom: 10),
                                TextUtils(title: attribute.nameHe ?? '')
                                    .paddingOnly(top: 10, bottom: 10),
                                Center(
                                  child: SvgPicture.asset(
                                    Images.dot,
                                    width: 25,
                                    height: 25,
                                    color: attribute.status == 1
                                        ? MyThemeData.light.primaryColor
                                        : Colors.red,
                                  ).paddingOnly(
                                      left: languageController.langLocal == eng
                                          ? 0
                                          : 18,
                                      right: languageController.langLocal == eng
                                          ? 18
                                          : 0,
                                      top: 10,
                                      bottom: 10),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    OnHover(
                                      matrix: 0,
                                      onTap: () {},
                                      builder: (isHovered) {
                                        return SvgPicture.asset(
                                          Images.edit,
                                          width: 30,
                                          height: 30,
                                        );
                                      },
                                    ),
                                    5.horizontalSpace,
                                    OnHover(
                                      matrix: 0,
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ConfirmationDialog(
                                              backgroundColor: Colors.white,
                                              padding: 5,
                                              icon: Images.delete,
                                              color: Colors.black,
                                              description:
                                              'Do you want to delete this attribute?'.tr,
                                              title: 'Delete Attribute'.tr,
                                              onYesPressed: () {
                                                attributeController.deleteAttribute(
                                                  context,
                                                  attributeID: attribute.id!
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                      builder: (isHovered) {
                                        return SvgPicture.asset(
                                          Images.delete,
                                          width: 30,
                                          height: 30,
                                        );
                                      },
                                    ),
                                  ],
                                ).paddingOnly(
                                    left: languageController.langLocal == eng
                                        ? 0
                                        : 15,
                                    right: languageController.langLocal == eng
                                        ? 15
                                        : 0,
                                    top: 10,
                                    bottom: 10),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
