import 'package:ekrut_test/utils/theme/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FormRolesInput extends StatelessWidget {

  final String title;
  final Function(String value) onChanged;

  FormRolesInput({required this.title, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: ThemeTextStyle.robotoRegular.apply(fontSizeDelta: 14.sp),).marginOnly(bottom: 8.h),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          autocorrect: false,
          enableSuggestions: false,
          onChanged: (value) => onChanged(value.trim()),
          maxLines: 1,
          style: ThemeTextStyle.robotoRegular.apply(color: Color(0xff2E4E6E), fontSizeDelta: 14.sp),
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Color(0xffF3F3F3),
            contentPadding: EdgeInsets.only(left: 8.w, right: 10.w, top: 14.h, bottom: 14.h),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black45, width: 1),
                borderRadius: BorderRadius.circular(10)
            ),
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black45, width: 1),
                borderRadius: BorderRadius.circular(10)
            )
          ),
        ),
      ],
    );
  }
}