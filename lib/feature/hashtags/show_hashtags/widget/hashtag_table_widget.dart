import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class HashtagTableWidget extends StatefulWidget {
  const HashtagTableWidget({super.key});

  @override
  State<HashtagTableWidget> createState() => _HashtagTableWidgetState();
}

class _HashtagTableWidgetState extends State<HashtagTableWidget> {
  final LanguageController languageController = Get.find<LanguageController>();

  @override
  void initState() {
    Get.find<HashtagController>().getHashtag(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HashtagController>(
      builder: (hashtagController) {
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
                    TextUtils(title: 'Image'.tr, color: Colors.white)
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
                if (hashtagController.controllerState.value ==
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
                      itemCount: hashtagController.hashtagList.length,
                      itemBuilder: (context, index) {
                        final hashtag = hashtagController.hashtagList[index];
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
                                const TextUtils(title: '#').paddingOnly(
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
                                  child: SizedBox(
                                    width: 36,
                                    height: 36,
                                    child: Image.network(
                                      hashtag.image ?? '',
                                      height: 36,
                                      width: 36,
                                      fit: BoxFit.fill,
                                    ),
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
                                TextUtils(title: hashtag.nameAr ?? '')
                                    .paddingOnly(
                                        left:
                                            languageController.langLocal == eng
                                                ? 40
                                                : 0,
                                        right:
                                            languageController.langLocal == eng
                                                ? 0
                                                : 40,
                                        top: 10,
                                        bottom: 10),
                                Center(
                                    child:
                                        TextUtils(title: hashtag.nameEn ?? '')
                                            .paddingOnly(top: 10, bottom: 10)),
                                TextUtils(title: hashtag.nameHe ?? '')
                                    .paddingOnly(top: 10, bottom: 10),
                                Center(
                                  child: SvgPicture.asset(
                                    Images.dot,
                                    width: 25,
                                    height: 25,
                                    color: hashtag.status == 1
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
                                      onTap: () {},
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