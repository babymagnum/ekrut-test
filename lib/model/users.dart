class Users {
  Users({
      List<UsersItem>? data,}){
    _data = data;
}

  Users.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(UsersItem.fromJson(v));
      });
    }
  }
  List<UsersItem>? _data;

  List<UsersItem>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class UsersItem {
  UsersItem({
      int? id, 
      String? dateCreated, 
      String? dateUpdated, 
      String? fullname, 
      String? phone, 
      String? email, 
      dynamic address, 
      dynamic type, 
      List<int>? userExperiences, 
      List<int>? userEducations,}){
    _id = id;
    _dateCreated = dateCreated;
    _dateUpdated = dateUpdated;
    _fullname = fullname;
    _phone = phone;
    _email = email;
    _address = address;
    _type = type;
    _userExperiences = userExperiences;
    _userEducations = userEducations;
}

  UsersItem.fromJson(dynamic json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateUpdated = json['date_updated'];
    _fullname = json['fullname'];
    _phone = json['phone'];
    _email = json['email'];
    _address = json['address'];
    _type = json['type'];
    _userExperiences = json['user_experiences'] != null ? json['user_experiences'].cast<int>() : [];
    _userEducations = json['user_educations'] != null ? json['user_educations'].cast<int>() : [];
  }
  int? _id;
  String? _dateCreated;
  String? _dateUpdated;
  String? _fullname;
  String? _phone;
  String? _email;
  dynamic _address;
  dynamic _type;
  List<int>? _userExperiences;
  List<int>? _userEducations;

  int? get id => _id;
  String? get dateCreated => _dateCreated;
  String? get dateUpdated => _dateUpdated;
  String? get fullname => _fullname;
  String? get phone => _phone;
  String? get email => _email;
  dynamic get address => _address;
  dynamic get type => _type;
  List<int>? get userExperiences => _userExperiences;
  List<int>? get userEducations => _userEducations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['date_created'] = _dateCreated;
    map['date_updated'] = _dateUpdated;
    map['fullname'] = _fullname;
    map['phone'] = _phone;
    map['email'] = _email;
    map['address'] = _address;
    map['type'] = _type;
    map['user_experiences'] = _userExperiences;
    map['user_educations'] = _userEducations;
    return map;
  }

}