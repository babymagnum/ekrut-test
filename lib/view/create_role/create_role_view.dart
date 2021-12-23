import 'package:ekrut_test/utils/theme/theme_text_style.dart';
import 'package:ekrut_test/view/base_view.dart';
import 'package:ekrut_test/view/create_role/create_role_controller.dart';
import 'package:ekrut_test/view/create_role/widget/form_roles_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateRoleView extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _createRoleCt = Get.put(CreateRoleController());

    return BaseView(
      isUseSafeArea: true,
      isUseAppbar: true,
      appbarTitle: 'Create Role',
      appbarElevation: 0,
      appbarBackgroundColor: Color(0xfffafafa),
      child: Obx(() => Column(
          children: [
            Container(height: 0.5, color: Colors.black45, width: Get.width,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          FormRolesInput(title: 'Title', onChanged: (String value) {
                            var newRole = _createRoleCt.createRequest.value;
                            newRole.title = value;
                            _createRoleCt.createRequest(newRole);
                          },).marginOnly(top: 16.h),
                          FormRolesInput(title: 'Description', onChanged: (String value) {
                            var newRole = _createRoleCt.createRequest.value;
                            newRole.description = value;
                            _createRoleCt.createRequest(newRole);
                          },).marginOnly(top: 8.h),
                          FormRolesInput(title: 'Requirement', onChanged: (String value) {
                            var newRole = _createRoleCt.createRequest.value;
                            newRole.requirement = value;
                            _createRoleCt.createRequest(newRole);
                          },).marginOnly(top: 8.h, bottom: 16.h),
                        ],
                      ),
                    )
                  ],
                ).paddingSymmetric(horizontal: 8.w),
              ),
            ),
            InkWell(
              onTap: _createRoleCt.createLoading.value ? () {} : () {
                if (_formKey.currentState!.validate()) _createRoleCt.postRoles();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  border: Border.all(color: Colors.black38, width: 1),
                  borderRadius: BorderRadius.circular(5)
                ),
                width: Get.width,
                margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                child: Text(_createRoleCt.createLoading.value ? 'Loading...' : 'Submit', textAlign: TextAlign.center,
                  style: ThemeTextStyle.robotoBold.apply(fontSizeDelta: 16.sp),).paddingSymmetric(vertical: 10.h),
              ),
            )
          ],
        ),
      ),
    );
  }
}
