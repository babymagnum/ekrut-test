import 'package:ekrut_test/utils/theme/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonReload extends StatelessWidget {

  final String? title;
  final String? content;
  final Function onTap;

  ButtonReload({this.title, this.content, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title ?? 'Gagal mendapatkan data,', style: ThemeTextStyle.robotoRegular.apply(color: Colors.black54, fontSizeDelta: 14.sp),),
            Text(content ?? 'Muat ulang?', style: ThemeTextStyle.robotoMedium.apply(color: Colors.black54, fontSizeDelta: 14.sp),),
          ],
        ),
      ),
    );
  }
}
