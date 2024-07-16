import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class QuestionHeScreen extends StatelessWidget {
  const QuestionHeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsController>(
      builder: (questionsController) => NamesTextField(
        title: 'Hebrew Question'.tr,
        hintTitle: 'Hebrew Answer'.tr,
        nameController: questionsController.questionNameHe,
        detailsController: questionsController.answerNameHe,
        formKey: questionsController.questionKey,
      ),
    );
  }
}
