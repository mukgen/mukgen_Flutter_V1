// 메인 페이지 : 게시판

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';

class MainBoardPage extends StatefulWidget {
  const MainBoardPage({Key? key}) : super(key: key);

  @override
  State<MainBoardPage> createState() => _MainBoardPageState();
}

class _MainBoardPageState extends State<MainBoardPage> {
  bool daily = false;
  bool weekly = false;
  bool all = true;

  changeState() {
    daily = false;
    weekly = false;
    all = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width - 20.0.w,
            child: Column(
              children: [
                SizedBox(height: 32.0.h),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20.0.w),
                  child: Text(
                    '급식 게시판',
                    style: TextStyle(
                      fontSize: 24.0.sp,
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
                        color: all ? MukGenColor.pointBase : MukGenColor.white,
                        border: Border.all(
                          color: all
                              ? MukGenColor.pointBase
                              : MukGenColor.primaryLight2, // 외곽선 색깔
                          width: 1.0.w, // 외곽선 두께
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            changeState();
                            all = !all;
                          });
                        },
                        child: Text(
                          '전체',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: all
                                ? MukGenColor.white
                                : MukGenColor.primaryLight1,
                            fontFamily:
                            all ? 'MukgenSemiBold' : 'MukgenRegular',
                            fontSize: 16.0.sp,
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
                        color:
                        daily ? MukGenColor.pointBase : MukGenColor.white,
                        border: Border.all(
                          color: daily
                              ? MukGenColor.pointBase
                              : MukGenColor.primaryLight2, // 외곽선 색깔
                          width: 1.0.w, // 외곽선 두께
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            changeState();
                            daily = !daily;
                          });
                        },
                        child: Text(
                          '일간',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: daily
                                ? MukGenColor.white
                                : MukGenColor.pointLight1,
                            fontFamily:
                            daily ? 'MukgenSemiBold' : 'MukgenRegular',
                            fontSize: 16.0.sp,
                            fontWeight:
                            daily ? FontWeight.w600 : FontWeight.w400,
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
                        color:
                        weekly ? MukGenColor.pointBase : MukGenColor.white,
                        border: Border.all(
                          color: weekly
                              ? MukGenColor.pointBase
                              : MukGenColor.primaryLight2, // 외곽선 색깔
                          width: 1.0.w, // 외곽선 두께
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            changeState();
                            weekly = !weekly;
                          });
                        },
                        child: Text(
                          '주간',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: weekly
                                ? MukGenColor.white
                                : MukGenColor.primaryLight1,
                            fontFamily:
                            weekly ? 'MukgenSemiBold' : 'MukgenRegular',
                            fontSize: 16.0.sp,
                            fontWeight:
                            weekly ? FontWeight.w600 : FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 500.0.h,
                  child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: 353.0.w,
                            height: 144.0.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: MukGenColor.primaryLight3),
                          ),
                          SizedBox(height: 8.0.h),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70.0.w,
        height: 70.0.h,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: null,
            elevation: 0,
            backgroundColor: MukGenColor.pointBase,
            child: Icon(Icons.add, size: 30, color: MukGenColor.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
