import 'package:ekrut_test/model/roles.dart';
import 'package:ekrut_test/utils/theme/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListRolesItem extends StatelessWidget {
  final RolesItem item;

  ListRolesItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        color: Colors.black26,
        border: Border.all(color: Colors.black38, width: 1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.title ?? '-', style: ThemeTextStyle.robotoMedium.apply(fontSizeDelta: 16.sp),),
          Text(item.description ?? '-', style: ThemeTextStyle.robotoMedium.apply(color: Colors.black87, fontSizeDelta: 14.sp),).marginOnly(top: 2.h),
        ],
      ),
    );
  }
}
