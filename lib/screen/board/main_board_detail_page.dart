import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/model/board/detail_board.dart';
import 'package:mukgen_flutter_v1/service/get/board/get_detail_board_info.dart';
import 'package:mukgen_flutter_v1/service/post/board/post_board_comment_info.dart';
import 'package:mukgen_flutter_v1/service/post/board/post_like_board_info.dart';

class MainBoardDetailPage extends StatefulWidget {
  const MainBoardDetailPage({Key? key, required this.boardId})
      : super(key: key);

  final int boardId;

  @override
  State<MainBoardDetailPage> createState() => _MainBoardDetailPageState();
}

class _MainBoardDetailPageState extends State<MainBoardDetailPage> {
  late bool _isLiked;
  late bool _initLikeState;
  late int _isLikeCount;

  late TextEditingController commentController;

  bool _isButtonEnabled = false;

  Future<DetailBoard>? detailBoard;
  final PageController pageController =
  PageController(initialPage: 0, viewportFraction: 0.9);

  @override
  void initState() {
    super.initState();
    detailBoard = getDetailBoardInfo(widget.boardId).then((value) {
      _isLikeCount = value.likeCount!;
      _isLiked = value.liked!;
      _initLikeState = _isLiked;
      return value;
    });
    commentController = TextEditingController();
    commentController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    super.dispose();
    commentController.dispose();
    if (_isLiked != _initLikeState) {
      postLikeBoardInfo(widget.boardId);
    }
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = commentController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      appBar: AppBar(
        backgroundColor: MukGenColor.white,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 20.0.w),
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: MukGenColor.primaryLight1,
            size: 24.0.sp,
          ),
        ),
        centerTitle: true,
        title: Text(
          '급식',
          style: TextStyle(
            color: MukGenColor.primaryLight1,
            fontWeight: FontWeight.w600,
            fontSize: 20.0.sp,
            fontFamily: 'MukgenSemiBold',
          ),
        ),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: detailBoard,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return Column(
                  children: [
                    Container(
                      width: 353.0.w,
                      height: 292.0.h,
                      decoration: BoxDecoration(
                        color: MukGenColor.primaryLight3,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 15.0.h),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15.0.w),
                            child: Text(
                              snapshot.data!.title.toString(),
                              style: TextStyle(
                                fontFamily: 'MukgenSemiBold',
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600,
                                color: MukGenColor.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0.h),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15.0.w),
                            child: Text(
                              snapshot.data!.userName.toString(),
                              style: TextStyle(
                                fontFamily: 'MukgenSemiBold',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: MukGenColor.primaryLight1,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0.h),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 15.0.w),
                                child: Text(
                                  DateFormat('yy.MM.dd HH:mm')
                                      .format(DateTime.parse(
                                      snapshot.data!.createdAt.toString()))
                                      .toString(),
                                  style: TextStyle(
                                    fontFamily: 'MukgenSemiBold',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: MukGenColor.primaryLight2,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0.w),
                              Icon(
                                Icons.remove_red_eye_rounded,
                                size: 16.sp,
                                color: MukGenColor.primaryLight2,
                              ),
                              SizedBox(width: 3.0.w),
                              Text(
                                snapshot.data!.viewCount.toString(),
                                style: TextStyle(
                                  fontFamily: 'MukgenRegular',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: MukGenColor.primaryLight2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0.h),
                          Container(
                            padding: EdgeInsets.only(top: 10.0.h),
                            width: 323.0.w,
                            height: 153.0.h,
                            child: Text(
                              snapshot.data!.content.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                fontFamily: 'MukgenRegular',
                                color: MukGenColor.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0.h),
                          Container(
                            padding: EdgeInsets.only(left: 21.0.w),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (_isLiked == true) {
                                      setState(() {
                                        _isLiked = false;
                                        _isLikeCount--;
                                      });
                                    } else {
                                      setState(() {
                                        _isLiked = true;
                                        _isLikeCount++;
                                      });
                                    }
                                  },
                                  child: Icon(
                                    Icons.favorite_rounded,
                                    size: 30.sp,
                                    color: _isLiked == false
                                        ? MukGenColor.primaryLight2
                                        : MukGenColor.pointLight1,
                                  ),
                                ),
                                SizedBox(width: 10.0.w),
                                Text(
                                  _isLikeCount.toString(),
                                  style: TextStyle(
                                    fontFamily: 'MukgenSemiBold',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: MukGenColor.primaryLight1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0.h),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 30.0.w),
                      child: Text(
                        '댓글',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          fontFamily: 'MukgenSemiBold',
                          color: MukGenColor.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.0.h,
                    ),
                    SizedBox(
                      height: 240.0.h,
                      child: Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.0.w),
                          child: ListView.builder(
                            itemCount: snapshot.data!.commentCount!,
                            itemBuilder: (context, index) {
                              DateTime postTime = DateTime.parse(snapshot.data!.boardCommentList![index].createdAt.toString());
                              DateTime currentTime = DateTime.now();
                              Duration difference = currentTime.difference(postTime);
                              int minutesDifference = difference.inMinutes; // 올린 시간과 현재 시간의 차이 (분 단위)
                              int hoursDifference = difference.inHours; // 올린 시간과 현재 시간의 차이 (시간 단위)
                              int daysDifference = difference.inDays; // 올린 시간과 현재 시간의 차이 (일 단위)
                              int monthsDifference = (currentTime.year - postTime.year) * 12 + currentTime.month - postTime.month; // 올린 시간과 현재 시간의 차이 (달 단위)
                              int yearsDifference = currentTime.year - postTime.year; // 올린 시간과 현재 시간의 차이 (년도 단위)
                              String timeAgo;
                              if (minutesDifference < 1) {
                                timeAgo = '방금 전';
                              } else if (minutesDifference < 60) {
                                timeAgo = '$minutesDifference분 전';
                              } else if (hoursDifference < 24) {
                                timeAgo = '$hoursDifference시간 전';
                              } else if (daysDifference < 30) {
                                timeAgo = '$daysDifference일 전';
                              } else if (monthsDifference < 12) {
                                timeAgo = '$monthsDifference달 전';
                              } else {
                                timeAgo = '$yearsDifference년 전';
                              }
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        snapshot.data!
                                            .boardCommentList![index].writer
                                            .toString(),
                                        style: TextStyle(
                                          color: MukGenColor.primaryLight1,
                                          fontFamily: 'MukgenRegular',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        'ㅣ',
                                        style: TextStyle(
                                          color: MukGenColor.primaryLight2,
                                          fontFamily: 'MukgenRegular',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        timeAgo,
                                        style: TextStyle(
                                          color: MukGenColor.primaryLight2,
                                          fontFamily: 'MukgenRegular',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 8.0.h),
                                  Row(
                                    children: [
                                      Text(
                                        snapshot.data!
                                            .boardCommentList![index].content
                                            .toString(),
                                        style: TextStyle(
                                          color: MukGenColor.black,
                                          fontFamily: 'MukgenRegular',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 18.0.h),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          const Spacer(),
          Container(
            width: 393.0.w,
            height: 57.0.h,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: MukGenColor.primaryLight2,
                  width: 1.0.w,
                ),
              ),
            ),
            child: Row(
              children: [
                SizedBox(width: 20.0.w),
                Container(
                  width: 320.0.w,
                  height: 37.0.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: MukGenColor.primaryLight2,
                        width: 1.0.w,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0.w),
                    child: TextFormField(
                      onChanged: (value) => setState(() {}),
                      controller: commentController,
                      style: TextStyle(
                        color: MukGenColor.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        fontFamily: 'MukgenSemiBold',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '댓글을 입력하세요',
                        hintStyle: TextStyle(
                          color: MukGenColor.primaryLight2,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          fontFamily: 'MukgenSemiBold',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 9.0.w),
                GestureDetector(
                  onTap: () {
                    if (_isButtonEnabled) {
                      setState(() {
                        postBoardComment(
                            widget.boardId, commentController.text);
                        commentController.clear();
                      });
                    }
                  },
                  child: Container(
                    width: 32.0.w,
                    height: 32.0.h,
                    decoration: BoxDecoration(
                      color: _isButtonEnabled
                          ? MukGenColor.pointLight1
                          : MukGenColor.primaryLight2,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_upward_rounded,
                      color: MukGenColor.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
