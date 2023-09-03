// 메인 페이지 : 게시판

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/model/board/total_board.dart';
import 'package:mukgen_flutter_v1/service/board_service.dart';
import 'package:mukgen_flutter_v1/widget/comment_icon.dart';

class MainBoardPage extends StatefulWidget {
  const MainBoardPage(
      {Key? key, required this.onPosting, required this.onDetail})
      : super(key: key);

  final Function(String) onPosting;
  final Function(int, String) onDetail;

  @override
  State<MainBoardPage> createState() => _MainBoardPageState();
}

class _MainBoardPageState extends State<MainBoardPage> {
  int boardId = 0, buttonStateNum = 0;

  Map<int, String> buttonState = {0: "total", 1: "day", 2: "week"};

  List<int> smallContainerIndices = [];

  Future<BoardResponse>? totalBoard;
  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.9);

  @override
  void initState() {
    super.initState();
    totalBoard =
        BoardService.getBoardInfo(buttonState[buttonStateNum].toString());
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    totalBoard =
        BoardService.getBoardInfo(buttonState[buttonStateNum].toString());
    return Scaffold(
      backgroundColor: MukGenColor.white,
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                SizedBox(height: 105.0.h),
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
                        color: buttonStateNum == 0
                            ? MukGenColor.pointBase
                            : MukGenColor.white,
                        border: Border.all(
                          color: buttonStateNum == 0
                              ? MukGenColor.pointBase
                              : MukGenColor.primaryLight2, // 외곽선 색깔
                          width: 1.0.w, // 외곽선 두께
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () => setState(() => buttonStateNum = 0),
                        child: Center(
                          child: Text(
                            '전체',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: buttonStateNum == 0
                                  ? MukGenColor.white
                                  : MukGenColor.primaryLight1,
                              fontFamily: buttonStateNum == 0
                                  ? 'MukgenSemiBold'
                                  : 'MukgenRegular',
                              fontSize: 16.0.sp,
                              fontWeight: buttonStateNum == 0
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
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
                        color: buttonStateNum == 1
                            ? MukGenColor.pointBase
                            : MukGenColor.white,
                        border: Border.all(
                          color: buttonStateNum == 1
                              ? MukGenColor.pointBase
                              : MukGenColor.primaryLight2, // 외곽선 색깔
                          width: 1.0.w, // 외곽선 두께
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () => setState(() => buttonStateNum = 1),
                        child: Center(
                          child: Text(
                            '일간',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: buttonStateNum == 1
                                  ? MukGenColor.white
                                  : MukGenColor.primaryLight1,
                              fontFamily: buttonStateNum == 1
                                  ? 'MukgenSemiBold'
                                  : 'MukgenRegular',
                              fontSize: 16.0.sp,
                              fontWeight: buttonStateNum == 1
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
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
                        color: buttonStateNum == 2
                            ? MukGenColor.pointBase
                            : MukGenColor.white,
                        border: Border.all(
                          color: buttonStateNum == 2
                              ? MukGenColor.pointBase
                              : MukGenColor.primaryLight2, // 외곽선 색깔
                          width: 1.0.w, // 외곽선 두께
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () => setState(() => buttonStateNum = 2),
                        child: Center(
                          child: Text(
                            '주간',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: buttonStateNum == 2
                                  ? MukGenColor.white
                                  : MukGenColor.primaryLight1,
                              fontFamily: buttonStateNum == 2
                                  ? 'MukgenSemiBold'
                                  : 'MukgenRegular',
                              fontSize: 16.0.sp,
                              fontWeight: buttonStateNum == 2
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 560.0.h,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          setState(() {
                            totalBoard = BoardService.getBoardInfo("total");
                          });
                        },
                        child: Column(
                          children: [
                            FutureBuilder(
                              future: totalBoard,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final totalBoard =
                                  snapshot.data! as BoardResponse;
                                  return Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 32.0.h),
                                      child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: totalBoard.boardListResponse!.boardMinimumResponseList!.length + 3,
                                          itemBuilder: (context, index) {
                                            if (index < 3) {
                                              smallContainerIndices.add(index);
                                              return Column(
                                                children: [
                                                  Column(children: [
                                                    InkWell(
                                                      onTap: () {
                                                        boardId = totalBoard.boardPopularListResponse!.boardPopularResponseList![index].boardId!.toInt();
                                                        widget.onDetail(
                                                          boardId,
                                                          buttonState[buttonStateNum].toString(),
                                                        );
                                                      },
                                                      child: Row(
                                                        children: [
                                                          SizedBox(width: 20.0.w),
                                                          Container(
                                                            width: 353.0.w,
                                                            height: 51.0.h,
                                                            decoration: BoxDecoration(
                                                              color: MukGenColor.primaryLight3,
                                                              borderRadius: BorderRadius.circular(10),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                    width:
                                                                        24.0.w),
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
                                                                    totalBoard.boardPopularListResponse!.boardPopularResponseList![index].title!.toString(),
                                                                    overflow: TextOverflow.ellipsis,
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
                                                                  CommentIcon.commentCount,
                                                                  size: 13.sp,
                                                                  color: MukGenColor.primaryLight2,
                                                                ),
                                                                SizedBox(width: 4.0.h),
                                                                SizedBox(
                                                                  width: 26.0.w,
                                                                  height: 17.0.h,
                                                                  child: Text(
                                                                    totalBoard.boardPopularListResponse!.boardPopularResponseList![index].commentCount.toString(),
                                                                    style: TextStyle(
                                                                      color: MukGenColor.primaryLight2,
                                                                      fontSize: 14.sp,
                                                                      fontWeight: FontWeight.w400,
                                                                      fontFamily: 'MukgenRegular',
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(width: 4.0.w),
                                                                Icon(
                                                                  Icons.remove_red_eye_rounded,
                                                                  size: 16.sp,
                                                                  color: MukGenColor.primaryLight2,
                                                                ),
                                                                SizedBox(width: 4.0.w),
                                                                SizedBox(
                                                                  width: 26.0.w,
                                                                  height: 17.0.h,
                                                                  child: Text(
                                                                    totalBoard.boardPopularListResponse!.boardPopularResponseList![index].viewCount.toString(),
                                                                    style: TextStyle(
                                                                      color: MukGenColor.primaryLight2,
                                                                      fontSize: 14.sp,
                                                                      fontWeight: FontWeight.w400,
                                                                      fontFamily: 'MukgenRegular',
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
                                                  ]),
                                                ],
                                              );
                                            } else {
                                              int adjustedIndex = index - 3;
                                              return Column(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        boardId = totalBoard.boardListResponse!.boardMinimumResponseList![adjustedIndex].boardId!.toInt();
                                                        widget.onDetail(
                                                            boardId,
                                                            buttonState[buttonStateNum].toString(),
                                                        );
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 353.0.w,
                                                      height: 144.0.h,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        color: MukGenColor.primaryLight3,
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          SizedBox(height: 24.0.h),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              SizedBox(width: 24.0.w),
                                                              Container(
                                                                width: 260.0.w,
                                                                alignment: Alignment.centerLeft,
                                                                child: Text(
                                                                  totalBoard.boardListResponse!.boardMinimumResponseList![adjustedIndex].title.toString(),
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style: TextStyle(
                                                                    color: MukGenColor.black,
                                                                    fontFamily: 'MukgenSemiBold',
                                                                    fontSize: 16.sp,
                                                                    fontWeight: FontWeight.w600,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 6.0.h),
                                                          Container(
                                                            width: 305.0.w,
                                                            alignment: Alignment.centerLeft,
                                                            child: Text(
                                                              totalBoard.boardListResponse!.boardMinimumResponseList![adjustedIndex].content.toString(),
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(
                                                                color: MukGenColor.black,
                                                                fontFamily: 'MukgenRegular',
                                                                fontSize: 16.sp,
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 6.0.h),
                                                          Container(
                                                            alignment: Alignment.centerLeft,
                                                            padding: EdgeInsets.only(left: 24.0.w),
                                                            child: Text(
                                                              totalBoard.boardListResponse!.boardMinimumResponseList![adjustedIndex].userNickname.toString(),
                                                              style: TextStyle(
                                                                color: MukGenColor.primaryLight1,
                                                                fontFamily: 'MukgenBody',
                                                                fontSize: 14.sp,
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 12.0.h),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                padding: EdgeInsets.only(left: 24.0.w),
                                                                child: Icon(
                                                                  Icons.favorite_rounded,
                                                                  size: 16.sp,
                                                                  color: MukGenColor.primaryLight2,
                                                                ),
                                                              ),
                                                              SizedBox(width: 4.0.w),
                                                              Text(
                                                                totalBoard.boardListResponse!.boardMinimumResponseList![adjustedIndex].likeCount.toString(),
                                                                style: TextStyle(
                                                                  fontFamily: 'MukgenRegular',
                                                                  fontSize: 14.sp,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: MukGenColor.primaryLight2,
                                                                ),
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets.only(left: 24.0.w),
                                                                child: Icon(
                                                                  CommentIcon.commentCount,
                                                                  size: 13.sp,
                                                                  color: MukGenColor.primaryLight2,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 4.0.w),
                                                              Text(
                                                                totalBoard.boardListResponse!.boardMinimumResponseList![adjustedIndex].commentCount.toString(),
                                                                style: TextStyle(
                                                                  fontFamily: 'MukgenRegular',
                                                                  fontSize: 14.sp,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: MukGenColor.primaryLight2,
                                                                ),
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets.only(left: 24.0.w),
                                                                child: Icon(
                                                                  Icons.remove_red_eye_rounded,
                                                                  size: 16.sp,
                                                                  color: MukGenColor.primaryLight2,
                                                                ),
                                                              ),
                                                              SizedBox(width: 4.0.w),
                                                              Text(
                                                                totalBoard.boardListResponse!.boardMinimumResponseList![adjustedIndex].viewCount.toString(),
                                                                style: TextStyle(
                                                                  fontFamily: 'MukgenRegular',
                                                                  fontSize: 14.sp,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: MukGenColor.primaryLight2,
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
                                            }
                                          }),
                                    ),
                                  );
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
            heroTag: 'addboard',
            onPressed: () {
              widget.onPosting(buttonState[buttonStateNum].toString());
            },
            elevation: 0,
            backgroundColor: MukGenColor.pointBase,
            child: Icon(Icons.add, size: 30.sp, color: MukGenColor.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
