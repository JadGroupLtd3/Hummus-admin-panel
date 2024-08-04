import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

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
  late PageController pushNotificationPageController;

  /// variable for changing index of Bottom AppBar
  RxInt currentPage = 0.obs;
  RxInt currentSection = 0.obs;
  RxInt currentQuestionName = 0.obs;
  RxInt currentMealName = 0.obs;
  RxInt currentDealName = 0.obs;
  RxInt currentNotificationName = 0.obs;
  RxInt currentOrderStatusName = 0.obs;
  RxInt pushNotificationStatusName = 0.obs;

  List<Widget> pages = [
    const AddNewMealScreen(),

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

  List<Widget> pushNotificationNamesPages = [
    PushNotificationAr(),
    PushNotificationEn(),
    PushNotificationHe(),
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
    WaitingForDeliveryScreen(),
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
    pushNotificationPageController = PageController(initialPage: 0);
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

  void goToPushNotificationNameTab(int page) {
    pushNotificationStatusName.value = page;
    pushNotificationPageController.jumpToPage(page);
    update();
  }

  void animateToPushNotificationNameTab(int page) {
    pushNotificationStatusName.value = page;
    pushNotificationPageController.animateToPage(page,
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
    pushNotificationPageController.dispose();
    super.dispose();
  }
}
