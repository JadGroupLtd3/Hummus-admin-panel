import 'package:get/get.dart';
import 'package:hummus_admin_panel/feature/home/settings/widget/acount_information_fields.dart';
import 'package:hummus_admin_panel/feature/home/settings/widget/information_widget.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${'Home'.tr} / ${'Settings'.tr}',
                style: TajawalRegular.copyWith(
                  fontSize: 16,
                ),
              ),
              12.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    height: MediaQuery.of(context).size.height * 1 / 1.26,
                    width: MediaQuery.of(context).size.height * 1 / 2.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 14,
                          spreadRadius: 9,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        children: [
                          InformationWidget(
                            imagePath: Images.person,
                            title: 'Account'.tr,
                            subTitle: 'Account information'.tr,
                            isBorder: true,
                          ),
                          20.verticalSpace,
                          // InformationWidget(
                          //   imagePath: Images.group,
                          //   title: 'Social Media'.tr,
                          //   subTitle: 'Social media information'.tr,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  7.horizontalSpace,
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    height: MediaQuery.of(context).size.height * 1 / 1.26,
                    width: MediaQuery.of(context).size.height * 1 / 1.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 14,
                          spreadRadius: 9,
                        )
                      ],
                    ),
                    child: const AccountInformationFields(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
