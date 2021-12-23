import 'package:ekrut_test/networking/http_service.dart';
import 'package:ekrut_test/networking/request/post_roles_request.dart';
import 'package:ekrut_test/utils/helper/common_function.dart';
import 'package:ekrut_test/view/home/home_controller.dart';
import 'package:get/get.dart';

class CreateRoleController extends GetxController {
  var createLoading = false.obs;
  var createRequest = PostRolesRequest().obs;
  HomeController _homeCt = Get.find();

  postRoles() async {
    createLoading(true);
    await HttpService().postRoles(createRequest.value.body).then((value) {
      CommonFunction.standartSnackbar('Ekrut Test', '${value.data == null ? 'Gagal' : 'Berhasil'} menambah roles');

      if (value.data != null) _homeCt.roles.insert(0, value.data!);
    }).onError((error, stackTrace) {
      CommonFunction.standartSnackbar('Ekrut Test', 'Gagal menambah roles');
    });
    createLoading(false);
  }
}