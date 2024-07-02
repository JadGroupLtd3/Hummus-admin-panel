class QuestionsModel {
  QuestionsModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final bool status;
  late final String message;
  late final List<Questions> data;

  QuestionsModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Questions.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Questions {
  Questions({
    this.id,
    this.parentId,
    this.questionAr,
    this.questionEn,
    this.questionHe,
    this.answerAr,
    this.answerEn,
    this.answerHe,
    this.imagesAr,
    this.imagesEn,
    this.imagesHe,
  });
  late final int? id;
  late final parentId;
  late final String? questionAr;
  late final String? questionEn;
  late final String? questionHe;
  late final String? answerAr;
  late final String? answerEn;
  late final String? answerHe;
  late final List<ImagesType>? imagesAr;
  late final List<ImagesType>? imagesEn;
  late final List<ImagesType>? imagesHe;

  Questions.fromJson(Map<String, dynamic> json){
    id = json['id'];
    parentId = null;
    questionAr = json['question_ar'];
    questionEn = json['question_en'];
    questionHe = json['question_he'];
    answerAr = json['answer_ar'];
    answerEn = json['answer_en'];
    answerHe = json['answer_he'];
    imagesAr = List.from(json['images_ar']).map((e)=>ImagesType.fromJson(e)).toList();
    imagesEn = List.from(json['images_en']).map((e)=>ImagesType.fromJson(e)).toList();
    imagesHe = List.from(json['images_he']).map((e)=>ImagesType.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['parent_id'] = parentId;
    _data['question_ar'] = questionAr;
    _data['question_en'] = questionEn;
    _data['question_he'] = questionHe;
    _data['answer_ar'] = answerAr;
    _data['answer_en'] = answerEn;
    _data['answer_he'] = answerHe;
    _data['images_ar'] = imagesAr?.map((e)=>e.toJson()).toList();
    _data['images_en'] = imagesEn?.map((e)=>e.toJson()).toList();
    _data['images_he'] = imagesHe?.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ImagesType {
  ImagesType({
    required this.id,
    required this.questionAnswerId,
    required this.image,
    required this.lang,
  });
  late final int id;
  late final int questionAnswerId;
  late final String image;
  late final String lang;

  ImagesType.fromJson(Map<String, dynamic> json){
    id = json['id'];
    questionAnswerId = json['question_answer_id'];
    image = json['image'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['question_answer_id'] = questionAnswerId;
    _data['image'] = image;
    _data['lang'] = lang;
    return _data;
  }
}