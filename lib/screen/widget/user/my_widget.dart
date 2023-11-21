import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';

class MyWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const MyWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Column(
        children: [
          Container(
            height: 60.0.h,
            width: 60.0.w,
            decoration: BoxDecoration(
              color: MukGenColor.primaryLight3,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                icon,
                color: MukGenColor.primaryBase,
                size: 28.sp,
              ),
            ),
          ),
          SizedBox(height: 6.0.h),
          Text(
            title,
            style: TextStyle(
              color: MukGenColor.black,
              fontSize: 12.sp,
              fontFamily: 'MukgenRegular',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}