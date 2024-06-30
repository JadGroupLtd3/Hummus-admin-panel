import 'package:get/get.dart';
import 'package:hummus_admin_panel/feature/auth/view/sign_in_screen.dart';
import 'package:hummus_admin_panel/feature/main/view/main_screen.dart';

class RouteHelper {
  /// initialRoute
  static const initial = '/';
  static const introductionScreens = '/IntroductionScreens';
  static const signInScreen = '/signInScreen';
  static const splashScreen = '/splashScreen';
  static const verification = '/verification';
  static const forgotPasswordCodeScreen = '/forgotPasswordCodeScreen';
  static const changePasswordScreen = '/changePasswordScreen';
  static const resetPasswordScreen = '/resetPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const orderScreen = '/orderScreen';
  static const myOrderScreen = '/myOrderScreen';
  static const orderStatusScreen = '/orderStatusScreen';
  static const favouriteScreen = '/favouriteScreen';
  static const settingsScreen = '/settingsScreen';
  static const addressScreen = '/addressScreen';
  static const newAddressScreen = '/newAddressScreen';
  static const changeLanguageScreen = '/changeLanguageScreen';
  static const notificationScreen = '/notificationScreen';
  static const mapScreen = '/mapScreen';
  static const pickMapScreen = '/pickMapScreen';
  static const chatScreen = '/chatScreen';
  static const cartScreen = '/cartScreen';
  static const profileScreen = '/profileScreen';
  static const searchScreen = '/searchScreen';
  static const selectAddress = '/selectAddress';
  static const productComponets = '/productComponets';

  /// getPages
  static final routes = [
    GetPage(
      name: mainScreen,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
    ),
  ];
}
