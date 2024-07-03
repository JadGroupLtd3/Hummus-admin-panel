import 'dart:typed_data';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:get/get.dart';

class QuestionsController extends GetxController {
  late QuestionsRepo questionsRepo;

  QuestionsController(this.questionsRepo);

  var controllerState = ControllerState.idle.obs;
  RxBool status = false.obs;
  XFile? pickedProfileImageFile;
  Uint8List webImage = Uint8List(8);
  File? pickedImage;
  final GlobalKey<FormState> questionKey = GlobalKey<FormState>();
  TextEditingController questionNameAr = TextEditingController();
  TextEditingController questionNameEn = TextEditingController();
  TextEditingController questionNameHe = TextEditingController();

  TextEditingController answerNameAr = TextEditingController();
  TextEditingController answerNameEn = TextEditingController();
  TextEditingController answerNameHe = TextEditingController();

  RxList<Questions> questionList = <Questions>[].obs;
  RxInt mainQuestionId = 0.obs;

  Future<void> createQuestion(BuildContext context) async {
    controllerState.value = ControllerState.loading;

    Questions questions = Questions(
      parentId: mainQuestionId.value.toString(),
      questionAr: questionNameAr.text,
      questionEn: questionNameEn.text,
      questionHe: questionNameHe.text,
      answerAr: answerNameAr.text,
      answerEn: answerNameEn.text,
      answerHe: answerNameHe.text,
      imagesAr: [],
      imagesEn: [],
      imagesHe: [],
    );
    print(questions.toJson());
    final result = await questionsRepo.createQuestion(
      questionModel: questions,
      webImage: webImage,
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
      getQuestion(context);
      questionNameAr.clear();
      questionNameEn.clear();
      questionNameHe.clear();
      answerNameAr.clear();
      answerNameEn.clear();
      answerNameHe.clear();
      pickedProfileImageFile = null;
      update();
    });
  }

  Future<void> getQuestion(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await questionsRepo.getQuestion();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      questionList.value = right.data;
    });
  }

  Future<void> deleteQuestion(BuildContext context,{required int questionID}) async {
    controllerState.value = ControllerState.loading;
    final result = await questionsRepo.deleteQuestion(questionID);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
      update();
    }, (right) async {
      controllerState.value = ControllerState.success;
      await getQuestion(context);
      update();
      Navigator.pop(context);
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
    });
  }

}
