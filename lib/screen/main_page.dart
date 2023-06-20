import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/model/board/hot_board.dart';
import 'package:mukgen_flutter_v1/model/board/total_board.dart';
import 'package:mukgen_flutter_v1/model/meal/mukgen_pick.dart';
import 'package:mukgen_flutter_v1/model/meal/today_meal.dart';
import 'package:mukgen_flutter_v1/screen/board/main_board_detail_page.dart';
import 'package:mukgen_flutter_v1/screen/mukgen_pick.dart';
import 'package:mukgen_flutter_v1/service/get_hot_board_info.dart';
import 'package:mukgen_flutter_v1/service/get_mukgen_pick_info.dart';
import 'package:mukgen_flutter_v1/service/get_today_meals_info.dart';
import 'package:mukgen_flutter_v1/service/get_total_board_info.dart';
import 'package:transition/transition.dart';

import '../widget/comment_icon.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  Future<TodayMeal>? todayMeal;
  Future<BoardResponse>? popularBoard;
  Future<HotBoard>? hotBoard;
  Future<MukGenPickBoard>? mukgenPick;
  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.9);

  int boardId = 0;

  Map<String, String> s = {
    "아침": "morning.png",
    "점심": "lunch.png",
    "저녁": "dinner.png"
  };

  @override
  void initState() {
    super.initState();
    todayMeal = getTodayMealInfo();
    popularBoard = getTotalBoardInfo();
    hotBoard = getHotBoardInfo();
    mukgenPick = getMukGenPickInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0.w),
                child: Image(
                  image: const AssetImage(
                      'assets/images/MukgenMainHomeAppBar.png'),
                  width: 104.0.w,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 210.0.w),
                child: IconButton(
                  icon: const Icon(Icons.person),
                  iconSize: 28,
                  color: MukGenColor.primaryLight2,
                  onPressed: null,
                ),
              ),
            ],
          ),
          SizedBox(height: 32.0.h),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 20.0.w),
            child: Text(
              '오늘의 급식',
              style: TextStyle(
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold'),
            ),
          ),
          SizedBox(height: 12.0.w),
          SizedBox(
            width: double.infinity,
            height: 220.0.h,
            child: FutureBuilder(
              future: todayMeal,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PageView.builder(
                    pageSnapping: true,
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.responseList!.length,
                    itemBuilder: (context, index) {
                      final itemList = _parseItemList(
                          snapshot.data!.responseList![index].item.toString());
                      return Container(
                        margin: EdgeInsets.only(right: 10.0.w),
                        alignment: Alignment.center,
                        width: 353.0.w,
                        height: 220.0.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MukGenColor.primaryLight3,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(24.0.r),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100.0.w,
                                height: 172.0.h,
                                child: Column(
                                  children: [
                                    SizedBox(height: 32.5.h),
                                    Text(
                                      snapshot
                                          .data!.responseList![index].riceType
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 16.0.sp,
                                          color: MukGenColor.pointBase),
                                    ),
                                    SizedBox(height: 24.0.h),
                                    Image.asset(
                                      "assets/images/${s[snapshot.data!.responseList![index].riceType].toString()}",
                                      width: 64.0.r,
                                      height: 64.0.r,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 181.0.w,
                                height: 172.0.h,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: itemList.length,
                                  itemBuilder: (context, itemIndex) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          itemList[itemIndex],
                                          style: TextStyle(fontSize: 14.0.sp),
                                        ),
                                        SizedBox(height: 6.0.h),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          SizedBox(height: 32.0.h),
          FutureBuilder(
            future: mukgenPick,
            builder: (context,snapshot) {
              if (snapshot.hasData) {
                int? month = snapshot.data!.month;
                int? day = snapshot.data!.day;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      Transition(
                        child: const MukgenPickPage(),
                        transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                      ),
                    );
                  },
                  child: Container(
                      alignment: Alignment.center,
                      width: 353.0.w,
                      height: 69.0.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MukGenColor.primaryLight3,
                          border: Border.all(
                            color: MukGenColor.pointLight4,
                            width: 2.0.w,
                          )
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 24.0.w),
                            child: SizedBox(
                              width: 139.5.w,
                              height: 42.0.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'PICK',
                                      style: TextStyle(
                                        color: MukGenColor.pointBase,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'MukgenSemiBold',
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4.0.h),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '맛있을 거 같은 급식의 날',
                                      style: TextStyle(
                                        color: MukGenColor.pointBase,
                                        fontSize: 12.sp,
                                        fontFamily: 'MukgenRegular',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 65.0.w),
                          Text(
                            '$month월 $day일',
                            style: TextStyle(
                              color: MukGenColor.pointBase,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'MukgenSemiBold',
                              fontSize: 24.sp,
                            ),
                          ),
                        ],
                      ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          SizedBox(height: 32.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0.w),
                child: Text(
                  '인기글',
                  style: TextStyle(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'MukgenSemiBold'),
                ),
              ),
              SizedBox(width: 262.0.w),
              InkWell(
                onTap: () {

                },
                child: Text(
                    '더보기',
                    style: TextStyle(
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'MukgenRegular',
                        color: MukGenColor.pointLight1),
                  ),
              ),
            ],
          ),
          SizedBox(height: 12.0.h),
          SizedBox(
            height: 163.0.h,
            width: 353.0.w,
            child: FutureBuilder(
              future: hotBoard,
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return SizedBox(
                    height: 163.0.h,
                    width: 353.0.w,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: snapshot.data!.boardPopularResponseList!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  boardId = snapshot.data!.boardPopularResponseList![index].boardId!.toInt();
                                  Navigator.push(
                                    context,
                                    Transition(
                                      child: MainBoardDetailPage(boardId: boardId,),
                                      transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                                    ),
                                  );
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: 16.0.w),
                                width: 353.0.w,
                                height: 49.0.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: MukGenColor.primaryLight3,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 17.0.h,
                                      width: 209.0.w,
                                      child: Text(
                                        snapshot.data!.boardPopularResponseList![index].title.toString(),
                                        style: TextStyle(
                                          color: MukGenColor.black,
                                          fontSize: 14.sp,
                                          fontFamily: 'MukgenRegular',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12.0.w),
                                    Container(
                                      padding: EdgeInsets.only(top: 2.0.h),
                                      child: Icon(
                                        CommentIcon.commentCount,
                                        size: 14.sp,
                                        color: MukGenColor.primaryLight2,
                                      ),
                                    ),
                                    SizedBox(width: 4.0.w),
                                    SizedBox(
                                      width: 26.0.w,
                                      child: Text(
                                        snapshot.data!.boardPopularResponseList![index].commentCount.toString(),
                                        style: TextStyle(
                                          fontFamily: 'MukgenRegular',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: MukGenColor.primaryLight2,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8.0.w),
                                    Icon(
                                      Icons.remove_red_eye_rounded,
                                      size: 18.sp,
                                      color: MukGenColor.primaryLight2,
                                    ),
                                    SizedBox(width: 4.0.w),
                                    SizedBox(
                                      width: 26.0.w,
                                      child: Text(
                                        snapshot.data!.boardPopularResponseList![index].commentCount.toString(),
                                        style: TextStyle(
                                          fontFamily: 'MukgenRegular',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: MukGenColor.primaryLight2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0.h),
                          ],
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          SizedBox(height: 8.0.h),
        ],
      ),
    );
  }
}

List<String> _parseItemList(String itemData) {
  final itemListString = itemData.substring(1, itemData.length - 1);
  return itemListString.split(', ');
}
