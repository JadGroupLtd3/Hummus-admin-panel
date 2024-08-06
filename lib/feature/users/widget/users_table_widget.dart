import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class UsersTableWidget extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String kind;
  final String imagePath;
  final void Function()? onTapDelete;
  final void Function()? onTapEdit;
  const UsersTableWidget({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.kind,
    required this.imagePath,
    this.onTapDelete,
    this.onTapEdit,
  });


  @override
  Widget build(BuildContext context) {
    final LanguageController languageController = Get.find<LanguageController>();
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
                    .paddingOnly(right: languageController.langLocal == eng ? 0 : 20,
                left: languageController.langLocal == eng ? 20 : 0),
                 TextUtils(title: 'Name'.tr, color: Colors.white)
                    .paddingOnly(
                    left: languageController.langLocal == eng ? 85 : 0,
                    right: languageController.langLocal == eng ? 0 : 85),
                const TextUtils(title: '     ', color: Colors.white),
                const TextUtils(title: '     ', color: Colors.white),
                TextUtils(title: 'Email'.tr, color: Colors.white).paddingOnly(
                    left: languageController.langLocal == eng ? 0 : 20,
                    right: languageController.langLocal == eng ? 20 : 0),
                TextUtils(title: 'Phone'.tr, color: Colors.white).paddingOnly(
                  right: languageController.langLocal == eng ? 0 : 20,
                  left: languageController.langLocal == eng ? 50 : 0,
                ),
                TextUtils(title: 'Kind'.tr, color: Colors.white).paddingOnly(
                  right: languageController.langLocal == eng ? 0 : 10,
                  left: languageController.langLocal == eng ? 40 : 0,
                ),
                TextUtils(title: 'Activation status'.tr, color: Colors.white),
                TextUtils(title: 'Operations'.tr, color: Colors.white).paddingOnly(
                    left: languageController.langLocal == eng ? 10 : 0,
                    right: languageController.langLocal == eng ? 0 : 10),
              ],
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
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
                        top: BorderSide(color: Colors.black.withOpacity(0.1)),
                        bottom: BorderSide(color: Colors.black.withOpacity(0.1)),
                      ),
                    ),
                    children: [
                      const TextUtils(title:'#').paddingOnly(
                          right: languageController.langLocal == eng ? 0 : 20,
                          left: languageController.langLocal == eng ? 20 : 0,
                          top: 10,bottom: 10),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: SizedBox(
                              width: 36,
                              height: 36,
                              child: Image.network(
                                imagePath,
                                height: 20,
                                width: 20,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          2.horizontalSpace,
                          TextUtils(title: name),
                        ],
                      ).paddingOnly(
                          left: languageController.langLocal == eng ? 0 : 30,
                          right: languageController.langLocal == eng ? 30 : 0,
                          top: 10,bottom: 10),
                      TextUtils(title: email).paddingOnly(
                          left: languageController.langLocal == eng ? 20 : 0,
                          right: languageController.langLocal == eng ? 0 : 20,
                          top: 10,bottom: 10),
                      Center(child: TextUtils(title: phone).paddingOnly(top: 10, bottom: 10)),
                      TextUtils(title: kind).paddingOnly(top: 10, bottom: 10),
                      Center(
                        child: SvgPicture.asset(
                          Images.dot,
                          width: 25,
                          height: 25,
                        ),
                      ).paddingOnly(
                          left: languageController.langLocal == eng ? 50 : 0,
                          right: languageController.langLocal == eng ? 0 : 50,
                          top: 10, bottom: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OnHover(
                            matrix: 0,
                            onTap: onTapEdit,
                            builder: (isHovered) {
                            return SvgPicture.asset(
                              Images.edit,
                              width: 30,
                              height: 30,
                            );
                          },),
                          5.horizontalSpace,
                          OnHover(
                            matrix: 0,
                            onTap: onTapDelete,
                            builder: (isHovered) {
                            return SvgPicture.asset(
                              Images.delete,
                              width: 30,
                              height: 30,
                            );
                          },),
                        ],
                      ).paddingOnly(
                          left: languageController.langLocal == eng ? 0 : 15,
                          right: languageController.langLocal == eng ? 15 : 0,
                          top: 10,bottom: 10),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

