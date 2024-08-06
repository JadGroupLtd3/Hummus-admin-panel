import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class AdminTableWidget extends StatefulWidget {
  const AdminTableWidget({super.key});

  @override
  State<AdminTableWidget> createState() => _AdminTableWidgetState();
}

class _AdminTableWidgetState extends State<AdminTableWidget> {
  final LanguageController languageController = Get.find<LanguageController>();
  final int itemsPerPage = 6;
  int currentPage = 0;
  @override
  void initState() {
    Get.find<UsersController>().getAdmins(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(
      builder: (adminController) {
        return Column(
          children: [
            Table(
              columnWidths: const {
                1: IntrinsicColumnWidth(),
                2: IntrinsicColumnWidth(),
                3: IntrinsicColumnWidth(),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: const Color(0xff36D000),
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
                    TextUtils(title: 'Name'.tr, color: Colors.white)
                        .paddingOnly(
                            left: languageController.langLocal == eng ? 85 : 0,
                            right:
                                languageController.langLocal == eng ? 0 : 85),
                    const TextUtils(title: '     ', color: Colors.white),
                    const TextUtils(title: '     ', color: Colors.white),
                    TextUtils(title: 'Email'.tr, color: Colors.white)
                        .paddingOnly(
                            left: languageController.langLocal == eng ? 0 : 20,
                            right:
                                languageController.langLocal == eng ? 20 : 0),
                    TextUtils(title: 'Phone'.tr, color: Colors.white).paddingOnly(
                      right: languageController.langLocal == eng ? 0 : 20,
                      left: languageController.langLocal == eng ? 50 : 0,
                    ),
                    TextUtils(title: 'Kind'.tr, color: Colors.white).paddingOnly(
                      right: languageController.langLocal == eng ? 0 : 10,
                      left: languageController.langLocal == eng ? 40 : 0,
                    ),
                    TextUtils(
                        title: 'Activation status'.tr, color: Colors.white),
                    TextUtils(title: 'Operations'.tr, color: Colors.white)
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
                if (adminController.controllerState.value == ControllerState.loading) {
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
                  final int totalPages = (adminController.adminList.length / itemsPerPage).ceil();
                  final currentPageItems = adminController.adminList.skip(currentPage * itemsPerPage).take(itemsPerPage).toList();
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: currentPageItems.length,
                            itemBuilder: (context, index) {
                              final admin = currentPageItems[index];
                              return Table(
                                columnWidths: const {
                                  1: IntrinsicColumnWidth(),
                                  2: IntrinsicColumnWidth(),
                                  4: IntrinsicColumnWidth(),
                                },
                                children: [
                                  TableRow(
                                    decoration: BoxDecoration(
                                      color: index % 2 == 0 ? const Color(0xffF8F8F8) : Colors.white,
                                      border: Border(
                                        top: BorderSide(
                                            color: Colors.black.withOpacity(0.1)),
                                        bottom: BorderSide(
                                            color: Colors.black.withOpacity(0.1)),
                                      ),
                                    ),
                                    children: [
                                      TextUtils(title: '${admin.id}').paddingOnly(
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
                                                admin.image ?? '',
                                                height: 20,
                                                width: 20,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          2.horizontalSpace,
                                          TextUtils(title: admin.firstName?.capitalize ?? ''),
                                        ],
                                      ).paddingOnly(
                                          left:
                                          languageController.langLocal == eng ? 0 : 30,
                                          right:
                                          languageController.langLocal == eng ? 30 : 0,
                                          top: 10,
                                          bottom: 10),
                                      TextUtils(title: admin.email ?? 'email@gmail.com').paddingOnly(
                                          left:
                                          languageController.langLocal == eng ? 20 : 0,
                                          right:
                                          languageController.langLocal == eng ? 0 : 20,
                                          top: 10,
                                          bottom: 10),
                                      Center(
                                          child: TextUtils(title: admin.phone ?? '')
                                              .paddingOnly(top: 10, bottom: 10)),
                                      TextUtils(title: 'Admin'.tr)
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
                                            onTap: () {
                                              Get.to(()=>AddNewManagerScreen(
                                                isEdit: true,
                                                admin: admin,
                                              ));
                                            },
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
                                                    'Do you want to delete this admin?'.tr,
                                                    title: 'Delete Admin'.tr,
                                                    onYesPressed: () {
                                                      print(admin.id);
                                                      adminController.deleteAdmins(
                                                          context,
                                                          adminID: admin.id!
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
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: currentPage > 0
                                  ? () {
                                setState(() {
                                  currentPage--;
                                });
                              }
                                  : null,
                              child: Text('Previous'.tr).paddingOnly(top: 6),
                            ),
                            5.horizontalSpace,
                            Row(
                              children: List.generate(totalPages, (index) {
                                return OnHover(
                                  matrix: 0,
                                  onTap: () {
                                    setState(() {
                                      currentPage = index;
                                    });
                                  },
                                  builder: (isHovered) {
                                    return Container(
                                      height: 31,
                                      width: 31,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      decoration: BoxDecoration(
                                        color: currentPage == index
                                            ? MyThemeData.light.primaryColor
                                            : const Color(0xff2B2969)
                                            .withOpacity(.10),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${index + 1}',
                                          style: TextStyle(
                                            color: currentPage == index
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
                            ),
                            5.horizontalSpace,
                            TextButton(
                              onPressed: currentPage < totalPages - 1
                                  ? () {
                                setState(() {
                                  currentPage++;
                                });
                              }
                                  : null,
                              child: Text('Next'.tr).paddingOnly(top: 6),
                            ),
                          ],
                        ).paddingAll(10),
                      ],
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
