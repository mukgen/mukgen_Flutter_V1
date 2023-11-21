import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';

class UserInfoWidget extends StatelessWidget {
  final String title;
  final String content;
  const UserInfoWidget({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 34.0.w),
          child: Text(
            title,
            style: TextStyle(
              color: MukGenColor.primaryLight1,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'MukgenSemiBold',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 34.0.w),
          child: Text(
            content,
            style: TextStyle(
              color: MukGenColor.primaryDark2,
              fontSize: 16.sp,
              fontFamily: 'MukgenRegular',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
