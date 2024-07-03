import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class AllQuestionsAndAnswers extends StatefulWidget {
  const AllQuestionsAndAnswers({super.key});

  @override
  State<AllQuestionsAndAnswers> createState() => _AllQuestionsAndAnswersState();
}

class _AllQuestionsAndAnswersState extends State<AllQuestionsAndAnswers> {
  final LanguageController languageController = Get.find<LanguageController>();

  @override
  void initState() {
    Get.find<QuestionsController>().getQuestion(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: GetBuilder<QuestionsController>(
        builder: (questionsController) {
          return Column(
            children: [
              Obx(
                () {
                  if (questionsController.controllerState.value ==
                      ControllerState.loading) {
                    return Column(
                      children: [
                        const SizedBox(height: 30),
                        Center(
                          child: CircularProgressIndicator(
                            color: MyThemeData.light.primaryColor,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: questionsController.questionList.length,
                        itemBuilder: (context, index) {
                          final question =
                              questionsController.questionList[index];
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 6),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(500),
                              border: Border.all(
                                  color: Colors.black.withOpacity(.08)),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 0),
                                  color: Colors.black.withOpacity(.02),
                                  blurRadius: 14,
                                  spreadRadius: 9,
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  languageController.langLocal == ara
                                      ? question.questionAr ?? ''
                                      : languageController.langLocal == eng
                                      ? question.questionEn ?? ''
                                      : question.questionHe ?? '',
                                  style: TajawalRegular.copyWith(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    OnHover(
                                      matrix: 0,
                                      builder: (isHovered) {
                                        return SvgPicture.asset(
                                          Images.edit,
                                          width: 30,
                                          height: 30,
                                        );
                                      },
                                    ),
                                    5.horizontalSpace,
                                    OnHover(
                                      matrix: 0,
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ConfirmationDialog(
                                              backgroundColor: Colors.white,
                                              padding: 5,
                                              icon: Images.delete,
                                              color: Colors.black,
                                              description:
                                              'Do you want to delete this question?'.tr,
                                              title: 'Delete Question'.tr,
                                              onYesPressed: () {
                                                questionsController.deleteQuestion(
                                                    context,
                                                    questionID: question.id!
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                      builder: (isHovered) {
                                        return SvgPicture.asset(
                                          Images.delete,
                                          width: 30,
                                          height: 30,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
