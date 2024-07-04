import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class WorkAreaTable extends StatefulWidget {
  const WorkAreaTable({super.key});

  @override
  State<WorkAreaTable> createState() => _WorkAreaTableState();
}

class _WorkAreaTableState extends State<WorkAreaTable> {
  final LanguageController languageController = Get.find<LanguageController>();

  @override
  void initState() {
    Get.find<RegionsController>().getRegions(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegionsController>(
      builder: (regionsController) {
        return Column(
          children: [
            Table(
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
                    TextUtils(title: 'Address'.tr, color: Colors.white)
                        .paddingOnly(
                            left: languageController.langLocal == eng ? 40 : 0,
                            right:
                                languageController.langLocal == eng ? 0 : 40),
                    const Center(
                        child: TextUtils(
                            title: 'Activation status', color: Colors.white)),
                    const Center(
                      child:
                          TextUtils(title: 'Operations', color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            Obx(
              () {
                if (regionsController.controllerState.value ==
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
                      itemCount: regionsController.regionsList.length,
                      itemBuilder: (context, index) {
                        final regions = regionsController.regionsList[index];
                        return Table(
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
                                TextUtils(title: '${regions.id}').paddingOnly(
                                    right: languageController.langLocal == eng
                                        ? 0
                                        : 20,
                                    left: languageController.langLocal == eng
                                        ? 20
                                        : 0,
                                    top: 10,
                                    bottom: 10),
                                TextUtils(title: regions.name).paddingOnly(
                                    left: languageController.langLocal == eng
                                        ? 40
                                        : 0,
                                    right: languageController.langLocal == eng
                                        ? 0
                                        : 40,
                                    top: 10,
                                    bottom: 10),
                                Center(
                                  child: SvgPicture.asset(
                                    Images.dot,
                                    width: 25,
                                    height: 25,
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
                                                  'Do you want to delete this region?'
                                                      .tr,
                                              title: 'Delete Regions'.tr,
                                              onYesPressed: () {
                                                regionsController.deleteRegions(
                                                  context,
                                                  regionsID: regions.id,
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
