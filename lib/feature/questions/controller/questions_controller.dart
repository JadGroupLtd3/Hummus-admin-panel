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
  String? imagePath;
  final GlobalKey<FormState> questionKey = GlobalKey<FormState>();
  TextEditingController questionNameAr = TextEditingController();
  TextEditingController questionNameEn = TextEditingController();
  TextEditingController questionNameHe = TextEditingController();

  TextEditingController answerNameAr = TextEditingController();
  TextEditingController answerNameEn = TextEditingController();
  TextEditingController answerNameHe = TextEditingController();

  RxList<Questions> questionList = <Questions>[].obs;
  RxInt mainQuestionId = 0.obs;

  initState(){
    questionNameAr.clear();
    questionNameEn.clear();
    questionNameHe.clear();
    answerNameAr.clear();
    answerNameEn.clear();
    answerNameHe.clear();
    status.value = false;
    pickedProfileImageFile = null;
  }

  void isEdit(Questions questions){
    questionNameAr.text = questions.questionAr ?? '';
    questionNameEn.text = questions.questionEn ?? '';
    questionNameHe.text = questions.questionHe ?? '';
    answerNameAr.text = questions.answerAr?? '';
    answerNameEn.text = questions.answerEn ?? '';
    answerNameHe.text = questions.answerHe ?? '';
    imagePath = questions.imagesAr!.isNotEmpty
        ? questions.imagesAr?.firstWhere((element) => element.id == questions.id).image
        : '';
  }

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

      update();
    });
  }

  Future<void> updateQuestion(BuildContext context,int questionId) async {
    controllerState.value = ControllerState.loading;

    Questions questions = Questions(
      id: questionId,
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
    final result = await questionsRepo.updateQuestion(
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
      initState();
      Get.back();
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
