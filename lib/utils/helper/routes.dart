import 'package:ekrut_test/view/create_role/create_role_view.dart';
import 'package:get/get.dart';
import '../../view/home/home_view.dart';

class Routes {
  static const CREATE_ROLES = '/create_roles';
  static const HOME = '/home';

  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomeView()),
    GetPage(name: Routes.CREATE_ROLES, page: () => CreateRoleView()),
  ];
}