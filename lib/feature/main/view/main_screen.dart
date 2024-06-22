// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/feature/main/controller/botton_nav_bar_controller.dart';
import 'package:hummus_admin_panel/feature/main/widget/slider_widget.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/custom_text_field2.dart';
import 'package:hummus_admin_panel/widgets/on_hover.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final BottomNavBarController bottomNavBarController =
      Get.put(BottomNavBarController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchData();
    });
  }

  Future<void> fetchData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leadingWidth: 235,
        leading: Row(
          children: [
            Image.asset(Images.logo, width: 160, height: 50)
                .paddingSymmetric(horizontal: 20),
          ],
        ),
        actions: [
          CustomTextField2(
            isTitle: false,
            height: 35,
            width: 250,
            hintText: 'search'.tr,
            prefixIcon: const Icon(Icons.search, size: 20),
          ).paddingOnly(top: 10),
          6.horizontalSpace,
          appBarBTN(imagePath: Images.language),
          6.horizontalSpace,
          appBarBTN(imagePath: Images.settings),
          6.horizontalSpace,
          appBarBTN(imagePath: Images.notifications),
          6.horizontalSpace,
        ],
      ),
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
            SizedBox(
              width: 210,
              child: SliderWidget(),
            ),
            Expanded(
              child: PageView(
                onPageChanged: bottomNavBarController.animateToTab,
                controller: bottomNavBarController.pageController,
                physics: const NeverScrollableScrollPhysics(),
                clipBehavior: Clip.none,
                children: [...bottomNavBarController.pages],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget appBarBTN({final imagePath}){
    return OnHover(
      builder: (isHovered) {
        final color = isHovered ? MyThemeData.light.primaryColor : Colors.white;
        return SvgPicture.asset(imagePath,color: color,);
      },
    );
  }
}
