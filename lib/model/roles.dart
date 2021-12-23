class Roles {
  Roles({
      List<RolesItem>? data,}){
    _data = data;
}

  Roles.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(RolesItem.fromJson(v));
      });
    }
  }
  List<RolesItem>? _data;

  List<RolesItem>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class RolesItem {
  RolesItem({
      int? id, 
      String? dateCreated, 
      dynamic dateUpdated, 
      String? title, 
      String? description, 
      String? requirement,}){
    _id = id;
    _dateCreated = dateCreated;
    _dateUpdated = dateUpdated;
    _title = title;
    _description = description;
    _requirement = requirement;
}

  RolesItem.fromJson(dynamic json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateUpdated = json['date_updated'];
    _title = json['title'];
    _description = json['description'];
    _requirement = json['requirement'];
  }
  int? _id;
  String? _dateCreated;
  dynamic _dateUpdated;
  String? _title;
  String? _description;
  String? _requirement;

  int? get id => _id;
  String? get dateCreated => _dateCreated;
  dynamic get dateUpdated => _dateUpdated;
  String? get title => _title;
  String? get description => _description;
  String? get requirement => _requirement;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['date_created'] = _dateCreated;
    map['date_updated'] = _dateUpdated;
    map['title'] = _title;
    map['description'] = _description;
    map['requirement'] = _requirement;
    return map;
  }

}