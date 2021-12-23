import 'package:ekrut_test/utils/theme/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BaseView extends StatelessWidget {
  final bool isUseAppbar;
  final String? appbarTitle;
  final Widget? appbarLeading;
  final Widget child;
  final BottomNavigationBar? bottomNavigationBar;
  final bool isUseSafeArea;
  final Color appbarBackgroundColor;
  final double? appbarElevation;
  final bool? centerTitle;

  BaseView({this.isUseAppbar:false, this.appbarTitle, this.appbarLeading,
    required this.child, this.bottomNavigationBar, this.isUseSafeArea = false,
    this.appbarBackgroundColor = Colors.black87, this.centerTitle = true, this.appbarElevation});

  @override
  Widget build(BuildContext context) {
    Widget _appBar = AppBar(
      backgroundColor: appbarBackgroundColor,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: appbarElevation,
      centerTitle: centerTitle,
      title: Text(appbarTitle ?? '', style: ThemeTextStyle.robotoMedium.apply(fontSizeDelta: 20.sp, color: Colors.black)),
      leading: appbarLeading ?? IconButton(
        icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
        onPressed: () => Get.back()
      ),
    );

    return Scaffold(
      appBar: isUseAppbar ? _appBar as PreferredSizeWidget? : null,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: bottomNavigationBar,
      body: isUseSafeArea ? SafeArea(child: child) : child,
    );
  }
}
