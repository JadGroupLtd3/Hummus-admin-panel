import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class QuestionsAndAnswersScreen extends StatelessWidget {
  const QuestionsAndAnswersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: GetBuilder<QuestionsController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '${'Home'.tr} / ${'Questions'.tr} / ${'Show Questions'.tr}',
                    style: TajawalRegular.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  12.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OnHover(
                        builder: (isHovered) {
                          return CustomButton(
                            buttonText: 'Add Questions'.tr,
                            icon: SvgPicture.asset(Images.correct),
                            backGroundColor: MyThemeData.light.focusColor,
                            radius: 7,
                            width: 150,
                            height: 45,
                            onPressed: () {
                              Get.find<SliderPagesController>().goToTab(17);
                            },
                          );
                        },
                      ),
                      3.horizontalSpace,
                    ],
                  ),
                  12.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          height: MediaQuery.of(context).size.height * 1 / 1.43,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 0),
                                color: Colors.black.withOpacity(0.02),
                                blurRadius: 14,
                                spreadRadius: 9,
                              )
                            ],
                          ),
                          child: const AllQuestionsAndAnswers(),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
