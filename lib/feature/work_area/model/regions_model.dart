class RegionsModel {
  RegionsModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final bool status;
  late final String message;
  late final List<RegionsData> data;

  RegionsModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>RegionsData.fromJson(e)).toList();
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

class RegionsData {
  RegionsData({
    required this.id,
    required this.name,
    required this.regions,
  });
  late final int id;
  late final String name;
  late final List<Regions> regions;

  RegionsData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    regions = List.from(json['regions']).map((e)=>Regions.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['regions'] = regions.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Regions {
  Regions({
    required this.lat,
    required this.lng,
  });
  late final String lat;
  late final String lng;

  Regions.fromJson(Map<String, dynamic> json){
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['lng'] = lng;
    return _data;
  }
}