import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/app_constants.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/feature/language/controller/language_controller.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/on_hover.dart';


class ChangeLanguageDialog extends StatelessWidget {
  ChangeLanguageDialog({
    super.key,
  });

  final LanguageController languageController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      insetPadding: const EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
        width: 500,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'تغير اللغة'.tr,
                    style: TajawalBold.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _selectLanguageItem(
                    onTap: () {
                      languageController.changeLanguage(eng);
                      Get.updateLocale(Locale(eng));
                      Get.back();
                    },
                    context,
                    lang: 'English',
                    arrowColor: languageController.langLocal == eng
                        ? MyThemeData.light.primaryColor
                        : const Color(0xffD2D2D2),
                    containerColor: languageController.langLocal == eng
                        ? const Color(0xffC49A6C).withOpacity(0.37)
                        : const Color(0xffffffff).withOpacity(0.11),
                  ),
                  const SizedBox(height: 30),
                  _selectLanguageItem(
                    onTap: () {
                      languageController.changeLanguage(ara);
                      Get.updateLocale(Locale(ara));
                      Get.back();
                    },
                    context,
                    lang: 'عربى',
                    arrowColor: languageController.langLocal == ara
                        ? MyThemeData.light.primaryColor
                        : const Color(0xffD2D2D2),
                    containerColor: languageController.langLocal == ara
                        ? const Color(0xffC49A6C).withOpacity(0.37)
                        : const Color(0xffffffff).withOpacity(0.11),
                  ),
                  const SizedBox(height: 30),
                  _selectLanguageItem(
                    onTap: () {
                      languageController.changeLanguage(heb);
                      Get.updateLocale(Locale(heb));
                      Get.back();
                    },
                    context,
                    lang: 'עברית',
                    arrowColor: languageController.langLocal == heb
                        ? MyThemeData.light.primaryColor
                        : const Color(0xffD2D2D2),
                    containerColor: languageController.langLocal == heb
                        ? const Color(0xffC49A6C).withOpacity(0.37)
                        : const Color(0xffffffff).withOpacity(0.11),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _selectLanguageItem(BuildContext context,
      {Color? arrowColor,
        required String lang,
        Color? containerColor,
        void Function()? onTap}) {
    return OnHover(
      matrix: 0,
      builder: (isHovered) {
        final color = isHovered
            ? const Color(0xffC49A6C).withOpacity(0.37)
            : Colors.white;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 55,
            width: 400,
            decoration: BoxDecoration(
                color:  containerColor ?? const Color(0xffC49A6C).withOpacity(0.37),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                    width: 1, color: const Color(0xff000000).withOpacity(0.11))),
            child: Row(
              children: [
                const SizedBox(width: 12),
                CircleAvatar(
                  radius: 11,
                  backgroundColor: arrowColor,
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  lang,
                  style: TajawalRegular.copyWith(fontSize: 16),
                )
              ],
            ),
          ),
        ),
      );
      },
    );
  }
}
