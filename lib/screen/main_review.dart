import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/widget/custom_icons.dart';
import 'package:mukgen_flutter_v1/screen/main_review_otherdays.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transition/transition.dart';

class MainReviewPage extends StatefulWidget {
  const MainReviewPage({Key? key}) : super(key: key);

  @override
  State<MainReviewPage> createState() => _MainReviewPageState();
}

class _MainReviewPageState extends State<MainReviewPage> {
  final String now = DateTime.now().toString();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20.0.w),
                    child: Text(
                      formattedDate,
                      style: TextStyle(
                          fontFamily: 'MukgenSemiBold',
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w600,
                          color: MukGenColor.primaryBase),
                    ),
                  ),
                  IconButton(
                    onPressed: null,
                    icon: const Icon(CustomIcons.calendar),
                    color: MukGenColor.primaryLight2,
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.person),
                iconSize: 28,
                color: MukGenColor.primaryLight2,
                onPressed: null,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 10.0.h),
              Container(
                width: 353.0.w,
                height: 200.0.h,
                decoration: BoxDecoration(
                  color: MukGenColor.primaryLight3,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 25.0.h),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  '오늘 급식 리뷰',
                  style: TextStyle(
                    color: MukGenColor.black,
                    fontFamily: 'MukgenSemiBold',
                    fontWeight: FontWeight.w600,
                    fontSize: 24.0.sp,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 5.0.h, left: 140.0.w),
                  child: TextButton(
                    child: Text(
                      '다른날 보러가기',
                      style: TextStyle(
                        color: MukGenColor.pointLight1,
                        fontSize: 12.0.sp,
                        fontFamily: 'MukgenRegular',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        Transition(
                          child: OtherDaysPage(),
                          transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                        ),
                      );
                    },
                  )),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 10.0.h),
              Container(
                width: 353.0.w,
                height: 92.0.h,
                decoration: BoxDecoration(
                  color: MukGenColor.primaryLight3,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 10.0.h),
              Container(
                width: 353.0.w,
                height: 92.0.h,
                decoration: BoxDecoration(
                  color: MukGenColor.primaryLight3,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 10.0.h),
              Container(
                width: 353.0.w,
                height: 92.0.h,
                decoration: BoxDecoration(
                  color: MukGenColor.primaryLight3,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 10.0.h),
              Container(
                width: 353.0.w,
                height: 57.0.h,
                decoration: BoxDecoration(
                  color: MukGenColor.primaryLight3,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: SizedBox(
        width: 70.0.w,
        height: 70.0.h,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            elevation: 0,
            backgroundColor: MukGenColor.pointBase,
            child: Icon(Icons.add, size: 30.0.sp, color: MukGenColor.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
