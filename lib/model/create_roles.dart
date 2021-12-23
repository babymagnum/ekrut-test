import 'package:ekrut_test/model/roles.dart';

class CreateRoles {
  CreateRoles({
      RolesItem? data,}){
    _data = data;
}

  CreateRoles.fromJson(dynamic json) {
    _data = json['data'] != null ? RolesItem.fromJson(json['data']) : null;
  }
  RolesItem? _data;

  RolesItem? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}