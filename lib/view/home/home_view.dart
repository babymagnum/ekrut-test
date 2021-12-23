import 'package:ekrut_test/utils/helper/routes.dart';
import 'package:ekrut_test/utils/theme/theme_text_style.dart';
import 'package:ekrut_test/view/home/home_controller.dart';
import 'package:ekrut_test/view/home/page/roles_page.dart';
import 'package:ekrut_test/view/home/page/users_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _homeCt = Get.put(HomeController());

    return BaseView(
      isUseAppbar: false,
      isUseSafeArea: true,
      child: Obx(() => Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: _homeCt.selectedPageIndex.value == 0 ?
                    RolesPage() :
                    UsersPage(),
                  ),
                  Positioned(
                    bottom: 16.w, right: 16.w,
                    child: InkWell(
                      onTap: () => Get.toNamed(Routes.CREATE_ROLES),
                      child: Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: Colors.black
                        ),
                        child: Icon(Icons.add, size: 20.w, color: Colors.white,),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(height: 1, width: Get.width, color: Colors.black45,),
            Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => _homeCt.selectedPageIndex(0),
                        child: Text('Roles', textAlign: TextAlign.center, style: ThemeTextStyle.robotoBold.apply(
                          color: _homeCt.selectedPageIndex.value == 0 ? Colors.black : Colors.black45, fontSizeDelta: 24.sp
                        ),).paddingSymmetric(vertical: 10.h, horizontal: 10.w),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _homeCt.selectedPageIndex(1);

                          if (_homeCt.shouldLoadUsers) {
                            _homeCt.shouldLoadUsers = false;
                            _homeCt.getUsers();
                          }
                        },
                        child: Text('Users', textAlign: TextAlign.center, style: ThemeTextStyle.robotoBold.apply(
                            color: _homeCt.selectedPageIndex.value == 1 ? Colors.black : Colors.black45, fontSizeDelta: 24.sp
                        ),).paddingSymmetric(vertical: 10.h, horizontal: 10.w),
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 0, bottom: 0, left: 0, right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 1, color: Colors.black45,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
