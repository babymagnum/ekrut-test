import 'package:ekrut_test/utils/theme/theme_color.dart';
import 'package:ekrut_test/utils/widget/button_reload.dart';
import 'package:ekrut_test/view/home/home_controller.dart';
import 'package:ekrut_test/view/home/widget/list_roles_item.dart';
import 'package:ekrut_test/view/home/widget/list_users_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UsersPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    HomeController _homeCt = Get.find();

    return Obx(() => _homeCt.usersLoading.value ?
      Center(
        child: SizedBox(
          width: 20.w, height: 20.w,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),
          ),
        ),
      ) :
      !_homeCt.usersLoading.value && _homeCt.users.isEmpty ?
      Center(
        child: ButtonReload(onTap: () => _homeCt.getUsers()),
      ) :
      ListView.builder(
        shrinkWrap: true,
        itemCount: _homeCt.users.length,
        padding: EdgeInsets.only(top: 4.h, bottom: 4.h),
        itemBuilder: (_, index) => ListUsersItem(item: _homeCt.users[index]),
      )
    );
  }
}
