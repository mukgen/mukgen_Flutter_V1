import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/model/board/detail_board.dart';
import 'package:mukgen_flutter_v1/model/board/like_board.dart';
import 'package:mukgen_flutter_v1/service/get_detail_board_info.dart';
import 'package:mukgen_flutter_v1/service/post_like_board_info.dart';

class MainBoardDetailPage extends StatefulWidget {
  const MainBoardDetailPage({Key? key, required this.boardId}) : super(key: key);

  final int boardId;

  @override
  State<MainBoardDetailPage> createState() => _MainBoardDetailPageState();
}

class _MainBoardDetailPageState extends State<MainBoardDetailPage> {

  late bool _isLiked;
  late int _isLikeCount;

  Future<DetailBoard>? detailBoard;
  final PageController pageController =
  PageController(initialPage: 0, viewportFraction: 0.9);

  @override
  void initState() {
    super.initState();
    detailBoard = getDetailBoardInfo(widget.boardId).then((value){
      _isLikeCount = value.likeCount!;
      _isLiked = value.liked!;
      return value;
    });
  }

  @override
  void dispose(){

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
          SizedBox(height: 10.0.h),
          Container(
            alignment: Alignment.center,
            width: 353.0.w,
            height: 292.0.h,
            decoration: BoxDecoration(
              color: MukGenColor.primaryLight3,
              borderRadius: BorderRadius.circular(10),
            ),
            child: FutureBuilder(
              future: detailBoard,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return Column(
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
                              DateFormat('yy.MM.dd HH:mm').format(DateTime.parse(snapshot.data!.createdAt.toString())).toString(),
                              style: TextStyle(
                                fontFamily: 'MukgenSemiBold',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: MukGenColor.primaryLight2,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0.w),
                          Container(
                            child: Icon(
                              Icons.remove_red_eye_rounded,
                              size: 16.sp,
                              color: MukGenColor.primaryLight2,
                            ),
                          ),
                          SizedBox(width: 3.0.w),
                          Text(
                            snapshot.data!.viewCount.toString(),
                            style: TextStyle(
                              fontFamily: 'MukgenRegular',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: MukGenColor
                                  .primaryLight2,
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
                            Container(
                              child: InkWell(
                                onTap: () {
                                  if (_isLiked == true){
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
                                  color: _isLiked == false ? MukGenColor.primaryLight2 : MukGenColor.pointLight1,
                                ),
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
          )
        ],
      ),
    );
  }
}
