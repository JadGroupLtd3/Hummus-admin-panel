import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class QuestionArScreen extends StatelessWidget {
  const QuestionArScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsController>(
      builder: (questionsController) => NamesTextField(
        title: 'Arabic Question'.tr,
        hintTitle: 'Arabic Answer'.tr,
        nameController: questionsController.questionNameAr,
        detailsController: questionsController.answerNameAr,
        formKey: questionsController.questionKey,
      ),
    );
  }
}
