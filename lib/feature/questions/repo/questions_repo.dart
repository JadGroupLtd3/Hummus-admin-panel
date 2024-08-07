import 'dart:typed_data';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/core_export.dart';


class QuestionsRepo {

  Future<Either<String, QuestionsModel>> createQuestion({
    required Questions questionModel, Uint8List? webImage
  }) async {
    try{
      Map<String, String> _body = Map();
      _body.addAll(<String, String>{
        'parent_id': questionModel.parentId,
        'question_ar': questionModel.questionAr!,
        'question_en': questionModel.questionEn!,
        'question_he': questionModel.questionHe!,
        'answer_ar': questionModel.answerAr!,
        'answer_en': questionModel.answerEn!,
        'answer_he': questionModel.answerHe!,
      });

      Response? response = await ApiClient.postMultipartData(
        ApiUrl.CREATE_QUESTIONS,
        _body,
        [MultipartBody('images_ar', webImage: webImage)],
      );
      print(response.body);
      if (response.statusCode == 200) {
        return Right(QuestionsModel.fromJson(response.body));
      } else {
        return Left(response.body['message'] ?? "unknown Error Occurred");
      }
    }catch(e){
      print("Error $e");
      return Left("Error $e");
    }
  }

  Future<Either<String, QuestionsModel>> updateQuestion({
    required Questions questionModel, Uint8List? webImage
  }) async {
    try{
      Map<String, String> _body = Map();
      _body.addAll(<String, String>{
        'id' : questionModel.id.toString(),
        'parent_id': questionModel.parentId,
        'question_ar': questionModel.questionAr!,
        'question_en': questionModel.questionEn!,
        'question_he': questionModel.questionHe!,
        'answer_ar': questionModel.answerAr!,
        'answer_en': questionModel.answerEn!,
        'answer_he': questionModel.answerHe!,
      });

      Response? response = await ApiClient.postMultipartData(
        ApiUrl.UPDATE_QUESTIONS,
        _body,
        [MultipartBody('images_ar', webImage: webImage)],
      );
      if (response.statusCode == 200) {
        return Right(QuestionsModel.fromJson(response.body));
      } else {
        return Left(response.body['message'] ?? "unknown Error Occurred");
      }
    }catch(e){
      print("Error $e");
      return Left("Error $e");
    }
  }


  Future<Either<String, QuestionsModel>> getQuestion() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_QUESTIONS);
    if (response.statusCode == 200) {
      return Right(QuestionsModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, QuestionsModel>> deleteQuestion(int questionID) async {
    Response? response = await ApiClient.deleteData('${ApiUrl.DELETE_QUESTIONS}$questionID');
    if (response.statusCode == 200) {
      return Right(QuestionsModel.fromJson(response.body));
    } else {
      print('Api Error ${response.statusCode} . ${response.body}//////////');
      return Left(response.body['message'] ?? "unknown Error Occurred");
    }
  }

}
