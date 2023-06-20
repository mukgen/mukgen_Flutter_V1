// 메인 페이지 : 게시판

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/model/board/total_board.dart';
import 'package:mukgen_flutter_v1/screen/board/main_board_detail_page.dart';
import 'package:mukgen_flutter_v1/service/get_total_board_info.dart';
import 'package:mukgen_flutter_v1/widget/comment_icon.dart';
import 'package:transition/transition.dart';

class MainBoardPage extends StatefulWidget {
  const MainBoardPage({Key? key}) : super(key: key);

  @override
  State<MainBoardPage> createState() => _MainBoardPageState();
}

class _MainBoardPageState extends State<MainBoardPage> {
  bool daily = false;
  bool weekly = false;
  bool all = true;

  int boardId = 0;

  changeState() {
    daily = false;
    weekly = false;
    all = false;
  }

  Future<BoardResponse>? totalBoard;
  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.9);

  @override
  void initState() {
    super.initState();
    totalBoard = getTotalBoardInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
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
                                : MukGenColor.primaryLight1,
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
                  child: RefreshIndicator(
                    onRefresh: () async {
                      setState(() {
                        totalBoard = getTotalBoardInfo();
                      });
                    },
                    child: FutureBuilder(
                      future: totalBoard,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 32.0.h),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: snapshot.data!.boardListResponse!
                                    .boardMinimumResponseList!.length,
                                itemBuilder: (context, index) {
                                  if(index < snapshot.data!.boardPopularListResponse!.boardPopularResponseList!.length) {
                                    return Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              boardId = snapshot.data!.boardPopularListResponse!.boardPopularResponseList![index].boardId!.toInt();
                                              Navigator.push(
                                                context,
                                                Transition(
                                                  child: MainBoardDetailPage(
                                                    boardId: boardId,),
                                                  transitionEffect: TransitionEffect
                                                      .RIGHT_TO_LEFT,
                                                ),
                                              );
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              SizedBox(width: 20.0.w),
                                              Container(
                                                width: 353.0.w,
                                                height: 51.0.h,
                                                decoration: BoxDecoration(
                                                  color: MukGenColor.primaryLight3,
                                                  borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 24.0.w),
                                                    Container(
                                                      alignment: Alignment.center,
                                                      width: 32.0.w,
                                                      height: 14.0.h,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(100),
                                                        border: Border.all(
                                                          color: MukGenColor.pointLight1,
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'HOT',
                                                        style: TextStyle(
                                                          color: MukGenColor.pointLight1,
                                                          fontSize: 9.sp,
                                                          fontWeight: FontWeight.w600,
                                                          fontFamily: 'InterBold',
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 6.0.w),
                                                    SizedBox(
                                                      width: 165.0.w,
                                                      height: 19.0.h,
                                                      child: Text(
                                                        snapshot.data!.boardPopularListResponse!.boardPopularResponseList![index].title.toString(),
                                                        style: TextStyle(
                                                          color: MukGenColor.black,
                                                          fontFamily: 'MukgenSemiBold',
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 16.sp,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 6.0.w),
                                                    Icon(
                                                      CommentIcon
                                                          .commentCount,
                                                      size: 13.sp,
                                                      color: MukGenColor
                                                          .primaryLight2,
                                                    ),
                                                    SizedBox(width: 4.0.h),
                                                    SizedBox(
                                                      width: 26.0.w,
                                                      height: 17.0.h,
                                                      child: Text(
                                                        snapshot.data!.boardPopularListResponse!.boardPopularResponseList![index].commentCount.toString(),
                                                        style: TextStyle(
                                                          color: MukGenColor.primaryLight2,
                                                          fontSize: 14.sp,
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: 'MukgenRegular'
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 4.0.w),
                                                    Icon(
                                                      Icons.remove_red_eye_rounded,
                                                      size: 16.sp,
                                                      color: MukGenColor
                                                          .primaryLight2,
                                                    ),
                                                    SizedBox(width: 4.0.w),
                                                    SizedBox(
                                                      width: 26.0.w,
                                                      height: 17.0.h,
                                                      child: Text(
                                                        snapshot.data!.boardPopularListResponse!.boardPopularResponseList![index].viewCount.toString(),
                                                        style: TextStyle(
                                                            color: MukGenColor.primaryLight2,
                                                            fontSize: 14.sp,
                                                            fontWeight: FontWeight.w400,
                                                            fontFamily: 'MukgenRegular'
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 8.0.h),
                                      ],
                                    );
                                  } else {
                                    return Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              boardId = snapshot.data!
                                                  .boardListResponse!
                                                  .boardMinimumResponseList![index]
                                                  .boardId!.toInt();
                                              Navigator.push(
                                                context,
                                                Transition(
                                                  child: MainBoardDetailPage(
                                                    boardId: boardId,),
                                                  transitionEffect: TransitionEffect
                                                      .RIGHT_TO_LEFT,
                                                ),
                                              );
                                            });
                                          },
                                          child: Container(
                                            width: 353.0.w,
                                            height: 144.0.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10.0),
                                                color: MukGenColor
                                                    .primaryLight3),
                                            child: Column(
                                              children: [
                                                SizedBox(height: 24.0.h),
                                                Container(
                                                  alignment: Alignment
                                                      .centerLeft,
                                                  padding:
                                                  EdgeInsets.only(left: 24.0.w),
                                                  child: Text(
                                                    snapshot.data!
                                                        .boardListResponse!
                                                        .boardMinimumResponseList![index]
                                                        .title.toString(),
                                                    style: TextStyle(
                                                      color: MukGenColor.black,
                                                      fontFamily: 'MukgenSemiBold',
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight
                                                          .w600,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 6.0.h),
                                                Container(
                                                  alignment: Alignment
                                                      .centerLeft,
                                                  padding:
                                                  EdgeInsets.only(left: 24.0.w),
                                                  child: Text(
                                                    snapshot.data!
                                                        .boardListResponse!
                                                        .boardMinimumResponseList![index]
                                                        .content.toString(),
                                                    style: TextStyle(
                                                      color: MukGenColor.black,
                                                      fontFamily: 'MukgenRegular',
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight
                                                          .w400,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 6.0.h),
                                                Container(
                                                  alignment: Alignment
                                                      .centerLeft,
                                                  padding:
                                                  EdgeInsets.only(left: 24.0.w),
                                                  child: Text(
                                                    snapshot.data!
                                                        .boardListResponse!
                                                        .boardMinimumResponseList![index]
                                                        .userName.toString(),
                                                    style: TextStyle(
                                                      color:
                                                      MukGenColor.primaryLight1,
                                                      fontFamily: 'MukgenBody',
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight
                                                          .w400,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 12.0.h),
                                                Row(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 24.0.w),
                                                      child: Icon(
                                                        Icons.favorite_rounded,
                                                        size: 16.sp,
                                                        color: MukGenColor
                                                            .primaryLight2,
                                                      ),
                                                    ),
                                                    SizedBox(width: 4.0.w),
                                                    Text(
                                                      snapshot.data!
                                                          .boardListResponse!
                                                          .boardMinimumResponseList![index]
                                                          .likeCount.toString(),
                                                      style: TextStyle(
                                                        fontFamily: 'MukgenRegular',
                                                        fontSize: 14.sp,
                                                        fontWeight: FontWeight
                                                            .w400,
                                                        color: MukGenColor
                                                            .primaryLight2,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 24.0.w),
                                                      child: Icon(
                                                        CommentIcon
                                                            .commentCount,
                                                        size: 13.sp,
                                                        color: MukGenColor
                                                            .primaryLight2,
                                                      ),
                                                    ),
                                                    SizedBox(width: 4.0.w),
                                                    Text(
                                                      snapshot.data!
                                                          .boardListResponse!
                                                          .boardMinimumResponseList![index]
                                                          .commentCount
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontFamily: 'MukgenRegular',
                                                        fontSize: 14.sp,
                                                        fontWeight: FontWeight
                                                            .w400,
                                                        color: MukGenColor
                                                            .primaryLight2,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 24.0.w),
                                                      child: Icon(
                                                        Icons
                                                            .remove_red_eye_rounded,
                                                        size: 16.sp,
                                                        color: MukGenColor
                                                            .primaryLight2,
                                                      ),
                                                    ),
                                                    SizedBox(width: 4.0.w),
                                                    Text(
                                                      snapshot.data!
                                                          .boardListResponse!
                                                          .boardMinimumResponseList![index]
                                                          .viewCount.toString(),
                                                      style: TextStyle(
                                                        fontFamily: 'MukgenRegular',
                                                        fontSize: 14.sp,
                                                        fontWeight: FontWeight
                                                            .w400,
                                                        color: MukGenColor
                                                            .primaryLight2,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8.0.h),
                                      ],
                                    );
                                  };
                                },
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(child: Text(snapshot.error.toString()));
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
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
