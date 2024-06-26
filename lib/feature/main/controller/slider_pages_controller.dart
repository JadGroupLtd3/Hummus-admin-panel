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
import 'package:hummus_admin_panel/feature/deals/add_new_deals/deals_name_pages/deal_ar_screen.dart';
import 'package:hummus_admin_panel/feature/deals/add_new_deals/deals_name_pages/deal_en_screen.dart';
import 'package:hummus_admin_panel/feature/deals/add_new_deals/deals_name_pages/deal_he_screen.dart';
import 'package:hummus_admin_panel/feature/deals/add_new_deals/view/add_new_deals_screen.dart';
import 'package:hummus_admin_panel/feature/deals/show_deals/view/show_deals_screen.dart';
import 'package:hummus_admin_panel/feature/hashtags/add_new_hashtag/view/add_new_hashtag_screen.dart';
import 'package:hummus_admin_panel/feature/hashtags/show_hashtags/view/show_hashtags_screen.dart';
import 'package:hummus_admin_panel/feature/home/delivery_times/view/delivery_time_screen.dart';
import 'package:hummus_admin_panel/feature/home/notification_settings/notification_name_pages/notification_ar_screen.dart';
import 'package:hummus_admin_panel/feature/home/notification_settings/notification_name_pages/notification_en_screen.dart';
import 'package:hummus_admin_panel/feature/home/notification_settings/notification_name_pages/notification_he_screen.dart';
import 'package:hummus_admin_panel/feature/home/notification_settings/view/notification_settings_screen.dart';
import 'package:hummus_admin_panel/feature/home/settings/view/settings_screen.dart';
import 'package:hummus_admin_panel/feature/home/show_notifications/view/show_notification_screen.dart';
import 'package:hummus_admin_panel/feature/home/statistics/view/statistics_screen.dart';
import 'package:hummus_admin_panel/feature/home_element/most_popular/view/most_product_screen.dart';
import 'package:hummus_admin_panel/feature/home_element/popular_meals/view/popular_meals_screen.dart';
import 'package:hummus_admin_panel/feature/meals/add_new_meal/meal_name_pages/meal_ar_screen.dart';
import 'package:hummus_admin_panel/feature/meals/add_new_meal/meal_name_pages/meal_en_screen.dart';
import 'package:hummus_admin_panel/feature/meals/add_new_meal/meal_name_pages/meal_he_screen.dart';
import 'package:hummus_admin_panel/feature/meals/add_new_meal/view/add_new_meal_screen.dart';
import 'package:hummus_admin_panel/feature/meals/show_meals/view/show_meals_screen.dart';
import 'package:hummus_admin_panel/feature/orders/order_history/view/order_history_screen.dart';
import 'package:hummus_admin_panel/feature/orders/show_orders/order_status_screen/complete_order_screen.dart';
import 'package:hummus_admin_panel/feature/orders/show_orders/order_status_screen/new_order_screen.dart';
import 'package:hummus_admin_panel/feature/orders/show_orders/order_status_screen/processing_order_screen.dart';
import 'package:hummus_admin_panel/feature/orders/show_orders/view/show_orders_screen.dart';
import 'package:hummus_admin_panel/feature/questions/add_new_questions/question_name_pages/question_ar_screen.dart';
import 'package:hummus_admin_panel/feature/questions/add_new_questions/question_name_pages/question_en_screen.dart';
import 'package:hummus_admin_panel/feature/questions/add_new_questions/question_name_pages/question_he_screen.dart';
import 'package:hummus_admin_panel/feature/questions/add_new_questions/view/add_new_questions_screen.dart';
import 'package:hummus_admin_panel/feature/questions/questions_and_answers/view/questions_and_answers_screen.dart';
import 'package:hummus_admin_panel/feature/tables/add_new_table/view/add_new_table.dart';
import 'package:hummus_admin_panel/feature/tables/show_tables/view/show_tables.dart';
import 'package:hummus_admin_panel/feature/users/add_new_user/view/add_new_manager_screen.dart';
import 'package:hummus_admin_panel/feature/users/add_new_user/view/add_new_waiter_screen.dart';
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
  late PageController questionsPageController;
  late PageController mealPageController;
  late PageController dealPageController;
  late PageController notificationPageController;
  late PageController orderStatusPageController;

  /// variable for changing index of Bottom AppBar
  RxInt currentPage = 0.obs;
  RxInt currentSection = 0.obs;
  RxInt currentQuestionName = 0.obs;
  RxInt currentMealName = 0.obs;
  RxInt currentDealName = 0.obs;
  RxInt currentNotificationName = 0.obs;
  RxInt currentOrderStatusName = 0.obs;

  List<Widget> pages = [

    const StatisticsScreen(),
    const SettingsScreen(),
    DeliveryTimesScreen(),
    const NotificationSettingsScreen(),
    const ShowNotificationScreen(),
    const ShowCouponScreen(),
    AddNewCouponScreen(),
    const ShowDealsScreen(),
    AddNewDealsScreen(),
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
    AddNewHashtagScreen(),
    const ShowComponentScreen(),
    AddNewComponentScreen(),
    const ShowAttributesScreen(),
    AddNewAttributeScreen(),
    const ShowCategoryScreen(),
    AddNewCategoryScreen(),
    const ShowTables(),
    const AddNewTable(),
    const ShowMealsScreen(),
    const AddNewMealScreen(),
    const ShowOrdersScreen(),
    const OrderHistoryScreen(),
    const AddNewWaiterScreen(),
    const AddNewManagerScreen(),
  ];

  List<Widget> questionsNamesPages = [
    QuestionArScreen(),
    QuestionEnScreen(),
    QuestionHeScreen(),
  ];

  List<Widget> mealNamesPages = [
    MealsArScreen(),
    MealsEnScreen(),
    MealsHeScreen(),
  ];

  List<Widget> dealNamesPages = [
    DealsArScreen(),
    DealsEnScreen(),
    DealsHeScreen(),
  ];

  List<Widget> notificationNamesPages = [
    NotificationArScreen(),
    NotificationEnScreen(),
    NotificationHeScreen(),
  ];

  List<Widget> orderStatusNamesPages = [
    NewOrderScreen(),
    ProcessingOrderScreen(),
    CompleteOrderScreen(),
  ];

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    questionsPageController = PageController(initialPage: 0);
    mealPageController = PageController(initialPage: 0);
    dealPageController = PageController(initialPage: 0);
    notificationPageController = PageController(initialPage: 0);
    orderStatusPageController = PageController(initialPage: 0);
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

  void goToQuestionsNameTab(int page) {
    currentQuestionName.value = page;
    questionsPageController.jumpToPage(page);
    update();
  }

  void animateToQuestionNameTab(int page) {
    currentQuestionName.value = page;
    questionsPageController.animateToPage(page,
        duration: const Duration(milliseconds: 0), curve: Curves.ease);
  }

  void goToMealsNameTab(int page) {
    currentMealName.value = page;
    mealPageController.jumpToPage(page);
    update();
  }

  void animateToMealsNameTab(int page) {
    currentMealName.value = page;
    mealPageController.animateToPage(page,
        duration: const Duration(milliseconds: 0), curve: Curves.ease);
  }

  void goToDealsNameTab(int page) {
    currentDealName.value = page;
    dealPageController.jumpToPage(page);
    update();
  }

  void animateToDealsNameTab(int page) {
    currentDealName.value = page;
    dealPageController.animateToPage(page,
        duration: const Duration(milliseconds: 0), curve: Curves.ease);
  }

  void goToNotificationNameTab(int page) {
    currentNotificationName.value = page;
    notificationPageController.jumpToPage(page);
    update();
  }

  void animateToNotificationNameTab(int page) {
    currentNotificationName.value = page;
    notificationPageController.animateToPage(page,
        duration: const Duration(milliseconds: 0), curve: Curves.ease);
  }

  void goToOrderStatusNameTab(int page) {
    currentOrderStatusName.value = page;
    orderStatusPageController.jumpToPage(page);
    update();
  }

  void animateToOrderStatusNameTab(int page) {
    currentOrderStatusName.value = page;
    orderStatusPageController.animateToPage(page,
        duration: const Duration(milliseconds: 0), curve: Curves.ease);
  }

  @override
  void dispose() {
    pageController.dispose();
    questionsPageController.dispose();
    mealPageController.dispose();
    dealPageController.dispose();
    notificationPageController.dispose();
    orderStatusPageController.dispose();
    super.dispose();
  }
}
