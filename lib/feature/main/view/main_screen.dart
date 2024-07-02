import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

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


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchData();
    });
  }

  Future<void> fetchData() async {
    await categoryController.getCategory(context);
    await attributeController.getAttribute(context);
    await componentController.getComponent(context);
    await hashtagController.getHashtag(context);
    await questionsController.getQuestion(context);
    await couponController.getCoupon(context);
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
