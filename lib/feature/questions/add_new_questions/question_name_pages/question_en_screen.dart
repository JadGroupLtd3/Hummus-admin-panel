import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class QuestionEnScreen extends StatelessWidget {
  const QuestionEnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsController>(
      builder: (questionsController) => NamesTextField(
        title: 'English Question'.tr,
        hintTitle: 'English Answer'.tr,
        nameController: questionsController.questionNameEn,
        detailsController: questionsController.answerNameEn,
        formKey: questionsController.questionKey,
      ),
    );
  }
}
