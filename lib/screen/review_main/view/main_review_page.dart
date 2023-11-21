import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';
import 'package:mukgen_flutter_v1/model/review/today_review.dart';
import 'package:mukgen_flutter_v1/screen/review_otherdays/view/main_review_otherdays_page.dart';
import 'package:mukgen_flutter_v1/service/review_service.dart';
import 'package:mukgen_flutter_v1/screen/widget/custom_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/model/review/rank_review.dart';
import 'package:transition/transition.dart';

class MainReviewPage extends StatefulWidget {
  const MainReviewPage(
      {Key? key,
      required this.onReview,
      required this.onDetail,
      required this.onMyPage})
      : super(key: key);

  final VoidCallback onReview, onMyPage;
  final Function(String, int) onDetail;

  @override
  State<MainReviewPage> createState() => _MainReviewPageState();
}

class _MainReviewPageState extends State<MainReviewPage> {
  final String now = DateTime.now().toString();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<RankReview>? rankReview;
  Future<TodayReview>? todayReview;

  @override
  Widget build(BuildContext context) {
    rankReview = ReviewService.getRankReviewInfo();
    todayReview = ReviewService.getTodayReviewInfo();
    return Scaffold(
      backgroundColor: MukGenColor.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                  SizedBox(width: 8.0.w),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      CustomIcons.calendar,
                      color: MukGenColor.primaryLight2,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(right: 23.0.w),
                child: GestureDetector(
                  onTap: () {
                    widget.onMyPage();
                  },
                  child: Icon(
                    Icons.person,
                    color: MukGenColor.primaryLight2,
                    size: 28.sp,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 17.5.h),
              Container(
                width: 353.0.w,
                height: 200.0.h,
                decoration: BoxDecoration(
                  color: MukGenColor.primaryLight3,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 10.0.h),
                      Text(
                        '리뷰 작성자 순위',
                        style: TextStyle(
                          color: MukGenColor.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'MukgenSemiBold',
                          fontSize: 24.sp,
                        ),
                      ),
                      SizedBox(
                        width: 353.0.w,
                        height: 151.0.h,
                        child: FutureBuilder(
                          future: rankReview,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Padding(
                                padding: EdgeInsets.only(left: 16.5.w),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot
                                      .data!.reviewRankResponseList!.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        SizedBox(
                                          width: 100.0.w,
                                          height: 143.0.h,
                                          child: Column(
                                            children: [
                                              SizedBox(height: 5.0.h),
                                              Text(
                                                '${index + 1}',
                                                style: TextStyle(
                                                  color: MukGenColor.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'MukgenSemiBold',
                                                  fontSize: 16.sp,
                                                ),
                                              ),
                                              SizedBox(height: 4.0.h),
                                              Container(
                                                height: 65.0.h,
                                                width: 65.0.w,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color:
                                                            MukGenColor.white,
                                                        width: 5.0.w)),
                                                child: snapshot
                                                            .data!
                                                            .reviewRankResponseList![
                                                                index]
                                                            .profileUrl !=
                                                        null
                                                    ? CircleAvatar(
                                                        radius: 100.r,
                                                        backgroundImage:
                                                            NetworkImage(snapshot
                                                                .data!
                                                                .reviewRankResponseList![
                                                                    index]
                                                                .profileUrl
                                                                .toString()),
                                                      )
                                                    : CircleAvatar(
                                                        radius: 100.r,
                                                        backgroundImage:
                                                            const AssetImage(
                                                                'assets/images/DefaultProfile.png'),
                                                        backgroundColor:
                                                            MukGenColor
                                                                .primaryLight2,
                                                      ),
                                              ),
                                              SizedBox(height: 4.0.h),
                                              Text(
                                                snapshot
                                                    .data!
                                                    .reviewRankResponseList![
                                                        index]
                                                    .userName
                                                    .toString(),
                                                style: TextStyle(
                                                    color: MukGenColor.black,
                                                    fontSize: 16.sp,
                                                    fontFamily:
                                                        'MukgenSemiBold',
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(height: 4.0.h),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star_rounded,
                                                    size: 13.sp,
                                                    color: MukGenColor
                                                        .primaryLight2,
                                                  ),
                                                  Text(
                                                    snapshot
                                                        .data!
                                                        .reviewRankResponseList![
                                                            index]
                                                        .averageReview
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: MukGenColor
                                                          .primaryLight2,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily:
                                                          'MukgenRegular',
                                                    ),
                                                  ),
                                                  Text(
                                                    'ㅣ',
                                                    style: TextStyle(
                                                      color: MukGenColor
                                                          .primaryLight2,
                                                      fontSize: 12.sp,
                                                      fontFamily:
                                                          'MukgenRegular',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    '리뷰 ${snapshot.data!.reviewRankResponseList![index].reviewCount}개',
                                                    style: TextStyle(
                                                      color: MukGenColor
                                                          .primaryLight2,
                                                      fontSize: 12.sp,
                                                      fontFamily:
                                                          'MukgenRegular',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10.0.w),
                                      ],
                                    );
                                  },
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text(snapshot.error.toString()));
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.0.h),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Padding(
                padding: EdgeInsets.only(right: 20.0.w),
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
                        child: MainReviewOtherDaysPage(),
                        transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0.h),
          SizedBox(
            width: 353.0.w,
            height: 296.0.h,
            child: FutureBuilder(
              future: todayReview,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.reviewResponseList!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              widget.onDetail(
                                  snapshot
                                      .data!.reviewResponseList![index].riceType
                                      .toString(),
                                  snapshot.data!.reviewResponseList![index]
                                      .reviewId!);
                            },
                            child: Container(
                              width: 353.0.w,
                              height: 92.0.h,
                              decoration: BoxDecoration(
                                color: MukGenColor.primaryLight3,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 15.0.w),
                                        child: Row(
                                          children: List<Widget>.generate(5,
                                              (index1) {
                                            return index1 <
                                                    snapshot
                                                        .data!
                                                        .reviewResponseList![
                                                            index]
                                                        .count!
                                                ? Image.asset(
                                                    'assets/images/Star.png',
                                                    width: 24.0.w,
                                                    height: 24.0.h,
                                                  )
                                                : Image.asset(
                                                    'assets/images/StarOutlined.png',
                                                    width: 24.0.w,
                                                    height: 24.0.h,
                                                  );
                                          }),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 21.0.w, top: 1.0.h),
                                        child: Text(
                                          snapshot
                                              .data!
                                              .reviewResponseList![index]
                                              .userNickname
                                              .toString(),
                                          style: TextStyle(
                                            color: MukGenColor.primaryLight2,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'MukgenSemiBold',
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 21.0.w),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 4.0.h),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            snapshot
                                                .data!
                                                .reviewResponseList![index]
                                                .review
                                                .toString(),
                                            style: TextStyle(
                                              color: MukGenColor.black,
                                              fontSize: 14.sp,
                                              fontFamily: 'MukgenRegular',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8.0.h),
                                        Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                DateFormat('yy.MM.dd')
                                                    .format(DateTime.parse(
                                                        snapshot
                                                            .data!
                                                            .reviewResponseList![
                                                                index]
                                                            .createdAt!))
                                                    .toString(),
                                                style: TextStyle(
                                                  color:
                                                      MukGenColor.primaryLight2,
                                                  fontSize: 12.sp,
                                                  fontFamily: 'MukgenRegular',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'ㅣ',
                                              style: TextStyle(
                                                color:
                                                    MukGenColor.primaryLight2,
                                                fontSize: 12.sp,
                                                fontFamily: 'MukgenRegular',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              DateFormat('HH:mm')
                                                  .format(DateTime.parse(
                                                      snapshot
                                                          .data!
                                                          .reviewResponseList![
                                                              index]
                                                          .createdAt!))
                                                  .toString(),
                                              style: TextStyle(
                                                color:
                                                    MukGenColor.primaryLight1,
                                                fontSize: 12.sp,
                                                fontFamily: 'MukgenRegular',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0.h),
                        ],
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
          SizedBox(height: 10.0.h),
          Image.asset(
            'assets/images/ReviewEventBanner.png',
            width: 353.0.w,
            height: 57.0.h,
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 70.0.w,
        height: 70.0.h,
        child: FittedBox(
          child: FloatingActionButton(
            heroTag: 'addreview',
            onPressed: () {
              widget.onReview();
            },
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
