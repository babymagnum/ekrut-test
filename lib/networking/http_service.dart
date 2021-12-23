import 'package:ekrut_test/model/create_roles.dart';
import 'package:ekrut_test/model/roles.dart';
import 'package:ekrut_test/model/users.dart';
import 'base_service.dart';

class HttpService extends BaseService {

  static final HttpService _instance = HttpService._internal();

  HttpService._internal();

  factory HttpService() => _instance;

  Future<Roles> getRoles() async {
    return await get('/items/role');
  }

  Future<Users> getUsers() async {
    return await get('/items/users');
  }

  Future<CreateRoles> postRoles(dynamic body) async {
    return await postJsonBody('/items/role', body);
  }
}
