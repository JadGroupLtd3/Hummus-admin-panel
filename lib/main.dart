import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hummus_admin_panel/core/core_export.dart';


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
