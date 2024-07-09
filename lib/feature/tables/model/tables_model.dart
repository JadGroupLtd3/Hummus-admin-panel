class TablesModel {
  TablesModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final bool status;
  late final String message;
  late final List<TablesData> data;

  TablesModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>TablesData.fromJson(e)).toList();
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

class TablesData {
  TablesData({
    this.id,
    required this.number,
    this.qrImage,
    this.isDeleted,
    required this.status,
    this.workStatus,
    this.containerId,
    this.positionId,
    this.createdAt,
    this.updatedAt,
  });
  late final id;
  late final String number;
  late final qrImage;
  late final int? isDeleted;
  late final int status;
  late final String? workStatus;
  late final String? containerId;
  late final String? positionId;
  late final String? createdAt;
  late final String? updatedAt;

  TablesData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    number = json['number'];
    qrImage = json['qr_image'];
    isDeleted = json['is_deleted'];
    status = json['status'];
    workStatus = json['work_status'];
    containerId = json['container_id'];
    positionId = json['position_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['number'] = number;
    _data['qr_image'] = qrImage;
    _data['is_deleted'] = isDeleted;
    _data['status'] = status;
    _data['work_status'] = workStatus;
    _data['container_id'] = containerId;
    _data['position_id'] = positionId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}