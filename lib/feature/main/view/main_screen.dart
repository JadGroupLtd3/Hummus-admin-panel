import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/home/notification_settings/repo/notification_repo.dart';
import 'package:hummus_admin_panel/feature/home/show_notifications/controller/push_notification_controller.dart';
import 'package:hummus_admin_panel/feature/home_element/repo/popular_meals_repo.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final SliderPagesController sliderPagesController = Get.put(SliderPagesController());
  final LanguageController languageController = Get.put(LanguageController());
  final CategoryController categoryController = Get.put(CategoryController(CategoryRepo()));
  final AttributeController attributeController = Get.put(AttributeController(AttributeRepo()));
  final ComponentController componentController = Get.put(ComponentController(ComponentRepo()));
  final HashtagController hashtagController = Get.put(HashtagController(HashtagRepo()));
  final QuestionsController questionsController = Get.put(QuestionsController(QuestionsRepo()));
  final CouponController couponController = Get.put(CouponController(CouponRepo()));
  final DeliveryTimeController deliveryTimeController = Get.put(DeliveryTimeController(DeliveryTimeRepo()));
  final SettingsController settingsController = Get.put(SettingsController(SettingsRepo()));
  final RegionsController regionsController = Get.put(RegionsController(RegionsRepo()));
  final UsersController usersController = Get.put(UsersController(UsersRepo()));
  final DealsController dealsController = Get.put(DealsController(DealsRepo()));
  final MealsController mealsController = Get.put(MealsController(MealsRepo()));
  final TablesController tablesController = Get.put(TablesController(TablesRepo()));
  final AllOrderController orderController = Get.put(AllOrderController(AllOrderRepository()));
  final NotificationController notificationController = Get.put(NotificationController(NotificationRepo()));
  final PushNotificationController pushNotificationController = Get.put(PushNotificationController(PushNotificationRepo()));
  final PopularMealsController popularMealsController = Get.put(PopularMealsController(PopularMealsRepo()));
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchData();
    });
  }

  Future<void> fetchData() async {
    await notificationController.getNotification(context);
    await categoryController.getCategory(context);
    await attributeController.getAttribute(context);
    await componentController.getComponent(context);
    await hashtagController.getHashtag(context);
    await questionsController.getQuestion(context);
    await couponController.getCoupon(context);
    await deliveryTimeController.getDeliveryTime(context);
    await settingsController.getSettings(context);
    await regionsController.getRegions(context);
    await usersController.getWaiters(context);
    await usersController.getAdmins(context);
    await dealsController.getDeals(context);
    await mealsController.getMeals(context);
    await mealsController.getRecommendedMeals(context);
    await popularMealsController.getPopularMeals(context);
    await popularMealsController.getFeatureMeals(context);
    await tablesController.getTables(context);
    await orderController.getAllOrder(context);
    await pushNotificationController.getPushNotification(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: buildAppBar(),
      body: Container(
        decoration:  const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 210,
              child: SliderWidget(),
            ),
            Expanded(
              child: PageView(
                onPageChanged: sliderPagesController.animateToTab,
                controller: sliderPagesController.pageController,
                physics: const NeverScrollableScrollPhysics(),
                clipBehavior: Clip.none,
                children: [...sliderPagesController.pages],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
