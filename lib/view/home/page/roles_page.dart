import 'package:ekrut_test/utils/theme/theme_color.dart';
import 'package:ekrut_test/utils/widget/button_reload.dart';
import 'package:ekrut_test/view/home/home_controller.dart';
import 'package:ekrut_test/view/home/widget/list_roles_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RolesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    HomeController _homeCt = Get.find();

    return Obx(() => _homeCt.rolesLoading.value ?
      Center(
        child: SizedBox(
          width: 20.w, height: 20.w,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),
          ),
        ),
      ) :
      !_homeCt.rolesLoading.value && _homeCt.roles.isEmpty ?
      Center(
        child: ButtonReload(onTap: () => _homeCt.getRoles()),
      ) :
      ListView.builder(
        shrinkWrap: true,
        itemCount: _homeCt.roles.length,
        padding: EdgeInsets.only(top: 4.h, bottom: 4.h),
        itemBuilder: (_, index) => ListRolesItem(item: _homeCt.roles[index]),
      )
    );
  }
}
