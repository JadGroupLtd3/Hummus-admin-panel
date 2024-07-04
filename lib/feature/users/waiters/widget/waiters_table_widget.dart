import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class WaitersTableWidget extends StatefulWidget {
  const WaitersTableWidget({super.key});

  @override
  State<WaitersTableWidget> createState() => _WaitersTableWidgetState();
}

class _WaitersTableWidgetState extends State<WaitersTableWidget> {
  final LanguageController languageController = Get.find<LanguageController>();

  @override
  void initState() {
    Get.find<UsersController>().getWaiters(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(
      builder: (waitersController) {
        return Column(
          children: [
            Table(
              columnWidths: const {
                1: IntrinsicColumnWidth(),
                2: IntrinsicColumnWidth(),
                4: IntrinsicColumnWidth(),
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
                    const TextUtils(title: 'Name', color: Colors.white)
                        .paddingOnly(
                            left: languageController.langLocal == eng ? 85 : 0,
                            right:
                                languageController.langLocal == eng ? 0 : 85),
                    const TextUtils(title: '   ', color: Colors.white),
                    const TextUtils(title: '   ', color: Colors.white),
                    const TextUtils(title: 'Email', color: Colors.white)
                        .paddingOnly(
                            left: languageController.langLocal == eng ? 0 : 20,
                            right:
                                languageController.langLocal == eng ? 20 : 0),
                    Center(
                        child:
                            const TextUtils(title: 'Phone', color: Colors.white)
                                .paddingOnly(
                      left: 25,
                    )).paddingOnly(
                      right: languageController.langLocal == eng ? 0 : 60,
                    ),
                    const TextUtils(title: 'Kind', color: Colors.white)
                        .paddingOnly(
                      right: languageController.langLocal == eng ? 0 : 40,
                      left: languageController.langLocal == eng ? 40 : 0,
                    ),
                    const TextUtils(
                        title: 'Activation status', color: Colors.white),
                    const TextUtils(title: 'Operations', color: Colors.white)
                        .paddingOnly(
                            left: languageController.langLocal == eng ? 10 : 0,
                            right:
                                languageController.langLocal == eng ? 0 : 10),
                  ],
                ),
              ],
            ),
            Obx(
                  () {
                if (waitersController.controllerState.value == ControllerState.loading) {
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
                      itemCount: waitersController.waitersList.length,
                      itemBuilder: (context, index) {
                        final waiter = waitersController.waitersList[index];
                        return Table(
                          columnWidths: const {
                            1: IntrinsicColumnWidth(),
                            2: IntrinsicColumnWidth(),
                            4: IntrinsicColumnWidth(),
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
                                TextUtils(title: '${waiter.id}').paddingOnly(
                                    right:
                                    languageController.langLocal == eng ? 0 : 20,
                                    left:
                                    languageController.langLocal == eng ? 20 : 0,
                                    top: 10,
                                    bottom: 10),
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: SizedBox(
                                        width: 36,
                                        height: 36,
                                        child: Image.network(
                                          waiter.image,
                                          height: 20,
                                          width: 20,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    2.horizontalSpace,
                                    TextUtils(title: waiter.firstName.capitalize ?? ''),
                                  ],
                                ).paddingOnly(
                                    left:
                                    languageController.langLocal == eng ? 0 : 30,
                                    right:
                                    languageController.langLocal == eng ? 30 : 0,
                                    top: 10,
                                    bottom: 10),
                                TextUtils(title: waiter.email).paddingOnly(
                                    left:
                                    languageController.langLocal == eng ? 20 : 0,
                                    right:
                                    languageController.langLocal == eng ? 0 : 20,
                                    top: 10,
                                    bottom: 10),
                                Center(
                                    child: TextUtils(title: waiter.phone)
                                        .paddingOnly(top: 10, bottom: 10)),
                                TextUtils(title: 'Waiter'.tr)
                                    .paddingOnly(top: 10, bottom: 10),
                                Center(
                                  child: SvgPicture.asset(
                                    Images.dot,
                                    width: 25,
                                    height: 25,
                                  ),
                                ).paddingOnly(
                                    left:
                                    languageController.langLocal == eng ? 50 : 0,
                                    right:
                                    languageController.langLocal == eng ? 0 : 50,
                                    top: 10,
                                    bottom: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    OnHover(
                                      matrix: 0,
                                      onTap: (){},
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
                                      onTap: (){},
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
                                    left:
                                    languageController.langLocal == eng ? 0 : 15,
                                    right:
                                    languageController.langLocal == eng ? 15 : 0,
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
