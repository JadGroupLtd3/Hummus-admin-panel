import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/feature/attributes/add_new_attribute/view/add_new_attribute_screen.dart';
import 'package:hummus_admin_panel/feature/attributes/show_attributes/view/show_attributes_screen.dart';
import 'package:hummus_admin_panel/feature/category/add_new_category/view/add_new_category_screen.dart';
import 'package:hummus_admin_panel/feature/category/show_category/view/show_category_screen.dart';
import 'package:hummus_admin_panel/feature/component/add_new_component/view/add_new_component_screen.dart';
import 'package:hummus_admin_panel/feature/component/show_component/view/show_component_screen.dart';
import 'package:hummus_admin_panel/feature/coupon/add_new_coupon/view/add_new_coupon_screen.dart';
import 'package:hummus_admin_panel/feature/coupon/show_coupon/show_coupon_screen.dart';
import 'package:hummus_admin_panel/feature/deals/add_new_deals/add_new_deals_screen.dart';
import 'package:hummus_admin_panel/feature/deals/show_deals/view/show_deals_screen.dart';
import 'package:hummus_admin_panel/feature/hashtags/add_new_hashtag/view/add_new_hashtag_screen.dart';
import 'package:hummus_admin_panel/feature/hashtags/show_hashtags/view/show_hashtags_screen.dart';
import 'package:hummus_admin_panel/feature/home/delivery_times/view/delivery_time_screen.dart';
import 'package:hummus_admin_panel/feature/home/notification_settings/notification_settings_screen.dart';
import 'package:hummus_admin_panel/feature/home/settings/view/settings_screen.dart';
import 'package:hummus_admin_panel/feature/home/show_notifications/show_notification_screen.dart';
import 'package:hummus_admin_panel/feature/home/statistics/view/statistics_screen.dart';
import 'package:hummus_admin_panel/feature/home_element/most_popular/view/most_product_screen.dart';
import 'package:hummus_admin_panel/feature/home_element/popular_meals/view/popular_meals_screen.dart';
import 'package:hummus_admin_panel/feature/meals/add_new_meal/view/add_new_meal_screen.dart';
import 'package:hummus_admin_panel/feature/meals/show_meals/view/show_meals_screen.dart';
import 'package:hummus_admin_panel/feature/orders/order_history/view/order_history_screen.dart';
import 'package:hummus_admin_panel/feature/orders/show_orders/view/show_orders_screen.dart';
import 'package:hummus_admin_panel/feature/questions/add_new_questions/add_new_questions_screen.dart';
import 'package:hummus_admin_panel/feature/questions/questions_and_answers/questions_and_answers_screen.dart';
import 'package:hummus_admin_panel/feature/tables/add_new_table/view/add_new_table.dart';
import 'package:hummus_admin_panel/feature/tables/show_tables/view/show_tables.dart';
import 'package:hummus_admin_panel/feature/users/customers/view/customers_screen.dart';
import 'package:hummus_admin_panel/feature/users/managers/view/managers_screen.dart';
import 'package:hummus_admin_panel/feature/users/waiters/view/waiters_screen.dart';
import 'package:hummus_admin_panel/feature/work_area/add_work_area/view/add_new_work_area_screen.dart';
import 'package:hummus_admin_panel/feature/work_area/show_work_area/view/show_work_area_screen.dart';

enum ControllerState {
  idle,
  loading,
  success,
  error,
}

class SliderPagesController extends GetxController {
  late PageController pageController;

  /// variable for changing index of Bottom AppBar
  RxInt currentPage = 0.obs;
  RxInt currentSection = 0.obs;

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
    const MostCommonMealsScreen(),
    const PopularMealsScreen(),
    const QuestionsAndAnswersScreen(),
    const AddNewQuestionsScreen(),
    const ShowHashtagsScreen(),
    const AddNewHashtagScreen(),
    const ShowComponentScreen(),
    const AddNewComponentScreen(),
    const ShowAttributesScreen(),
    const AddNewAttributeScreen(),
    const ShowCategoryScreen(),
    const AddNewCategoryScreen(),
    const ShowTables(),
    const AddNewTable(),
    const ShowMealsScreen(),
    const AddNewMealScreen(),
    const ShowOrdersScreen(),
    const OrderHistoryScreen(),
  ];

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  void goToTab(int page) {
    currentPage.value = page;
    currentSection.value = page;
    pageController.jumpToPage(page);
    update();
  }

  void animateToTab(int page) {
    currentPage.value = page;
    currentSection.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 0), curve: Curves.ease);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}