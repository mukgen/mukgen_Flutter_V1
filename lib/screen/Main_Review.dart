import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:mukgen_flutter_v1/Customicons/custom_icons_icons.dart';
import 'package:mukgen_flutter_v1/screen/Main_Review_Otherdays.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transition/transition.dart';

class MainReviewApp extends StatefulWidget {
  const MainReviewApp({Key? key}) : super(key: key);

  @override
  State<MainReviewApp> createState() => _MainReviewAppState();
}

class _MainReviewAppState extends State<MainReviewApp> {
  final String now = new DateTime.now().toString();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 20.0.w),
                  child: Text(
                    '$formattedDate',
                    style: TextStyle(
                        fontFamily: 'MukgenSemiBold',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6B6C71)
                    ),
                  )
              ),
              Container(
                child: IconButton(
                  onPressed: () {

                  },
                  icon: Icon(CustomIcons.calendar),
                  color: Color(0xFFC9CAD0),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 160.0.w),
                  child: IconButton(
                    icon: Icon(Icons.person),
                    iconSize: 28,
                    color: Color(0xFFC9CAD0),
                    onPressed: () {

                    },
                  )
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
                  color: Color(0xFFF5F6F6),
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
                child: Text('오늘 급식 리뷰',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontFamily: 'MukgenSemiBold',
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 5.0.h, left: 140.0.w),
                  child: TextButton(
                    child: Text(
                        '다른날 보러가기',
                        style: TextStyle(
                          color: Color(0xFFFF7A1B),
                          fontSize: 12,
                          fontFamily: 'MukgenRegular',
                          fontWeight: FontWeight.w400,
                        )
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        Transition(
                          child: OtherDaysApp(),
                          transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                        ),
                      );
                    },
                  )
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 10.0.h),
              Container(
                width: 353.0.w,
                height: 92.0.h,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F6),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 10.0.h),
              Container(
                width: 353.0.w,
                height: 92.0.h,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F6),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 10.0.h),
              Container(
                width: 353.0.w,
                height: 92.0.h,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F6),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 10.0.h),
              Container(
                width: 353.0.w,
                height: 57.0.h,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F6),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: Container(
        width: 70.0.w,
        height: 70.0.h,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: (){

            },
            elevation: 0,
            backgroundColor: Color(0xFFFE6B01),
            child: Icon(Icons.add,size: 30,color: Color(0xFFFFFFFF)),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}