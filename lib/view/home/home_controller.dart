import 'package:ekrut_test/model/roles.dart';
import 'package:ekrut_test/model/users.dart';
import 'package:ekrut_test/networking/http_service.dart';
import 'package:ekrut_test/utils/helper/text_util.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var roles = <RolesItem>[].obs;
  var users = <UsersItem>[].obs;
  var rolesLoading = false.obs;
  var usersLoading = false.obs;
  var selectedPageIndex = 0.obs;
  var shouldLoadUsers = true;

  getRoles() async {
    rolesLoading(true);
    await HttpService().getRoles().then((value) {
      (value.data ?? []).sort((a, b) => TextUtil.stringDateToMillis(b.dateCreated ?? '').compareTo(TextUtil.stringDateToMillis(a.dateCreated ?? '')));
      roles.assignAll(value.data ?? []);
    }).onError((error, stackTrace) { });
    rolesLoading(false);
  }

  getUsers() async {
    usersLoading(true);
    await HttpService().getUsers().then((value) {
      (value.data ?? []).sort((a, b) => TextUtil.stringDateToMillis(b.dateCreated ?? '').compareTo(TextUtil.stringDateToMillis(a.dateCreated ?? '')));
      users.assignAll(value.data ?? []);
    }).onError((error, stackTrace) { });
    usersLoading(false);
  }

  @override
  void onReady() {
    getRoles();

    super.onReady();
  }
}