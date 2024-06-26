import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hummus_admin_panel/core/helper/preferences_helper.dart';
import 'package:hummus_admin_panel/core/helper/route_helper.dart';
import 'package:hummus_admin_panel/core/utils/app_constants.dart';
import 'package:hummus_admin_panel/feature/auth/controller/sign_in_controller.dart';
import 'package:hummus_admin_panel/feature/auth/repo/sign_in_repo.dart';
import 'package:hummus_admin_panel/feature/language/localization.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await PrefsHelper.initSharedPreferences();
  Get.put(SignInController(SignInRepo()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  SignInController signInController = Get.put(SignInController(SignInRepo()));
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          title: AppConstants.APP_NAME,
          locale: Locale(GetStorage().read<String>('lang') ?? ara),
          translations: LocalizationApp(),
          fallbackLocale: Locale(ara),
          theme: MyThemeData.light,
          getPages: RouteHelper.routes,
          initialRoute: RouteHelper.signInScreen,
        );
      },
    );
  }
}
