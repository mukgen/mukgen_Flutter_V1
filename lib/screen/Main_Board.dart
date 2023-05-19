// 메인 페이지 : 게시판

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainBoardApp extends StatefulWidget {
  const MainBoardApp({Key? key}) : super(key: key);

  @override
  State<MainBoardApp> createState() => _MainBoardAppState();
}

class _MainBoardAppState extends State<MainBoardApp> {
  bool daily = false;
  bool weekly = false;
  bool all = true;

  changestate() {
    daily = false;
    weekly = false;
    all = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 91.0.h),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20.0.w),
                  child: Text(
                    '급식 게시판',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'MukgenSemiBold',
                    ),
                  ),
                ),
                SizedBox(height: 32.0.h),
                Row(
                  children: [
                    SizedBox(width: 20.0.w),
                    Container(
                      width: 60.0.w,
                      height: 35.0.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: all ? Color(0xFFFE6B01) : Color(0xFFFFFFFF),
                        border: Border.all(
                          color: all
                              ? Color(0xFFFE6B01)
                              : Color(0xFFC9CAD0), // 외곽선 색깔
                          width: 1.0.w, // 외곽선 두께
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            changestate();
                            all = !all;
                          });
                        },
                        child: Text(
                          '전체',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: all ? Color(0xFFFFFFFF) : Color(0xFF85858D),
                            fontFamily: all ? 'MukgenSemiBold' : 'MukgenRegular',
                            fontSize: 16,
                            fontWeight: all ? FontWeight.w600 : FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0.w),
                    Container(
                      width: 60.0.w,
                      height: 35.0.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: daily ? Color(0xFFFE6B01) : Color(0xFFFFFFFF),
                        border: Border.all(
                          color: daily
                              ? Color(0xFFFE6B01)
                              : Color(0xFFC9CAD0), // 외곽선 색깔
                          width: 1.0.w, // 외곽선 두께
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            changestate();
                            daily = !daily;
                          });
                        },
                        child: Text(
                          '일간',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: daily ? Color(0xFFFFFFFF) : Color(0xFF85858D),
                            fontFamily: daily ? 'MukgenSemiBold' : 'MukgenRegular',
                            fontSize: 16,
                            fontWeight: daily ? FontWeight.w600 : FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0.w),
                    Container(
                      width: 60.0.w,
                      height: 35.0.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: weekly ? Color(0xFFFE6B01) : Color(0xFFFFFFFF),
                        border: Border.all(
                          color: weekly
                              ? Color(0xFFFE6B01)
                              : Color(0xFFC9CAD0), // 외곽선 색깔
                          width: 1.0.w, // 외곽선 두께
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            changestate();
                            weekly = !weekly;
                          });
                        },
                        child: Text(
                          '주간',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: weekly ? Color(0xFFFFFFFF) : Color(0xFF85858D),
                            fontFamily: weekly ? 'MukgenSemiBold' : 'MukgenRegular',
                            fontSize: 16,
                            fontWeight: weekly ? FontWeight.w600 : FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 32.0.h),
                    Container(
                      width: 353.0.w,
                      height: 51.0.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFFF5F6F6)
                      ),
                    ),
                    SizedBox(height: 8.0.h),
                    Container(
                      width: 353.0.w,
                      height: 51.0.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFFF5F6F6)
                      ),
                    ),
                    SizedBox(height: 8.0.h),
                    Container(
                      width: 353.0.w,
                      height: 51.0.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFFF5F6F6)
                      ),
                    ),
                    SizedBox(height: 8.0.h),
                    Container(
                      width: 353.0.w,
                      height: 144.0.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFFF5F6F6)
                      ),
                    ),
                    SizedBox(height: 8.0.h),
                    Container(
                      width: 353.0.w,
                      height: 144.0.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFFF5F6F6)
                      ),
                    ),
                    SizedBox(height: 8.0.h),
                    Container(
                      width: 353.0.w,
                      height: 144.0.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFFF5F6F6)
                      ),
                    ),
                    SizedBox(height: 8.0.h),
                    Container(
                      width: 353.0.w,
                      height: 144.0.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFFF5F6F6)
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
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
