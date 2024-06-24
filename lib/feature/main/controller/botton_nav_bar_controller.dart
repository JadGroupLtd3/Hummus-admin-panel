import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/feature/coupon/add_new_coupon/add_new_coupon_screen.dart';
import 'package:hummus_admin_panel/feature/coupon/show_coupon/show_coupon_screen.dart';
import 'package:hummus_admin_panel/feature/deals/add_new_deals/add_new_deals_screen.dart';
import 'package:hummus_admin_panel/feature/deals/show_deals/view/show_deals_screen.dart';
import 'package:hummus_admin_panel/feature/hashtags/add_new_hashtag/view/add_new_hashtag_screen.dart';
import 'package:hummus_admin_panel/feature/hashtags/show_hashtags/show_hashtags_screen.dart';
import 'package:hummus_admin_panel/feature/home/delivery_times/view/delivery_time_screen.dart';
import 'package:hummus_admin_panel/feature/home/notification_settings/notification_settings_screen.dart';
import 'package:hummus_admin_panel/feature/home/settings/view/settings_screen.dart';
import 'package:hummus_admin_panel/feature/home/show_notifications/show_notification_screen.dart';
import 'package:hummus_admin_panel/feature/home/statistics/statistics_screen.dart';
import 'package:hummus_admin_panel/feature/home_element/display_product/display_product_screen.dart';
import 'package:hummus_admin_panel/feature/home_element/most_popular/most_product_screen.dart';
import 'package:hummus_admin_panel/feature/questions/add_new_questions/add_new_questions_screen.dart';
import 'package:hummus_admin_panel/feature/questions/questions_and_answers/questions_and_answers_screen.dart';
import 'package:hummus_admin_panel/feature/users/customers/customers_screen.dart';
import 'package:hummus_admin_panel/feature/users/managers/managers_screen.dart';
import 'package:hummus_admin_panel/feature/users/waiters/waiters_screen.dart';
import 'package:hummus_admin_panel/feature/work_area/add_work_area/view/add_new_work_area_screen.dart';
import 'package:hummus_admin_panel/feature/work_area/show_work_area/show_work_area_screen.dart';

enum ControllerState {
  idle, // Represents the initial state, not loading
  loading,
  success,
  error,
}

class BottomNavBarController extends GetxController {
  late PageController pageController;

  /// variable for changing index of Bottom AppBar
  RxInt currentPage = 0.obs;
  RxInt selectedPage = 0.obs;

  List<Widget> pages = [
    const StatisticsScreen(),
    const SettingsScreen(),
    DeliveryTimesScreen(),
    const NotificationSettingsScreen(),
    const ShowNotificationScreen(),
    const ShowCouponScreen(),
    const AddNewCouponScreen(),
    const ShowDealsScreen(),
    const AddNewDealsScreen(),
    const ShowWorkAreaScreen(),
    const AddNewWorkAreaScreen(),
    const ManagersScreen(),
    const WaitersScreen(),
    const CustomersScreen(),
    const MostProductScreen(),
    const DisplayProductScreen(),
    const QuestionsAndAnswersScreen(),
    const AddNewQuestionsScreen(),
    const ShowHashtagsScreen(),
    const AddNewHashtagScreen(),
  ];

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
    update();
  }

  void animateToTab(int page) {
    currentPage.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 0), curve: Curves.ease);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
