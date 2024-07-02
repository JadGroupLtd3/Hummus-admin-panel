import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class AddNewQuestionsScreen extends StatelessWidget {
  const AddNewQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: GetBuilder<QuestionsController>(
            builder: (questionsController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '${'Home'.tr} / ${'Questions'.tr} / ${'Add New'.tr}',
                    style: TajawalRegular.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  12.verticalSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<SliderPagesController>(
                        builder: (sliderPagesController) {
                          return Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 0),
                              height: MediaQuery.of(context).size.height * 1 / 1.35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 0),
                                    color: Colors.black.withOpacity(0.02),
                                    blurRadius: 14,
                                    spreadRadius: 9,
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  QuestionsNavBar(
                                    sliderPagesController: sliderPagesController,
                                  ),
                                  20.verticalSpace,
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 1 / 1.77,
                                    child: PageView(
                                      onPageChanged: sliderPagesController.animateToQuestionNameTab,
                                      controller: sliderPagesController.questionsPageController,
                                      physics: const NeverScrollableScrollPhysics(),
                                      clipBehavior: Clip.none,
                                      children: [...sliderPagesController.questionsNamesPages],
                                    ),
                                  ),
                                  10.verticalSpace,
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: DropDownBTN(
                                      title: 'Main Question'.tr,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      7.horizontalSpace,
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          height: MediaQuery.of(context).size.height * 1 / 2.3,
                          decoration: BoxDecoration(
                            color: const Color(0xff2D2D2D),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 0),
                                color: Colors.black.withOpacity(0.02),
                                blurRadius: 14,
                                spreadRadius: 9,
                              )
                            ],
                          ),
                          child: const QuestionsPhotosWidget(),
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  Obx(() {
                    switch (questionsController.controllerState.value) {
                      case ControllerState.loading:
                        return Center(
                          child: CircularProgressIndicator(
                              color: MyThemeData.light.primaryColor),
                        );
                      case ControllerState.error:
                        return Center(
                          child: CustomButton(
                            buttonText: 'save'.tr,
                            icon: SvgPicture.asset(Images.correct)
                                .paddingSymmetric(horizontal: 4),
                            style: TajawalBold.copyWith(
                              color: Colors.white,
                            ),
                            radius: 20,
                            width: 160,
                            height: 45,
                            backGroundColor: MyThemeData.light.primaryColor,
                            onPressed: () {
                              if(questionsController.questionKey.currentState!.validate()){
                                questionsController.createQuestion(context);
                              }
                            },
                          ),
                        );
                      default:
                        return Center(
                          child: CustomButton(
                            buttonText: 'save'.tr,
                            icon: SvgPicture.asset(Images.correct)
                                .paddingSymmetric(horizontal: 4),
                            style: TajawalBold.copyWith(
                              color: Colors.white,
                            ),
                            radius: 20,
                            width: 160,
                            height: 45,
                            backGroundColor: MyThemeData.light.primaryColor,
                            onPressed: () {
                              if(questionsController.questionKey.currentState!.validate()){
                                questionsController.createQuestion(context);
                              }
                            },
                          ),
                        );
                    }
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
