import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/model/meal/today_meal.dart';
import 'package:mukgen_flutter_v1/model/review/detail_review.dart';
import 'package:mukgen_flutter_v1/service/get/meals/get_today_meals_info.dart';
import 'package:mukgen_flutter_v1/service/get/review/get_detail_review_info.dart';
import 'package:mukgen_flutter_v1/widget/custom_icons.dart';

class MainReviewDetailPage extends StatefulWidget {
  const MainReviewDetailPage({Key? key, required this.riceType, required this.reviewId}) : super(key: key);

  final String riceType;
  final int reviewId;

  @override
  State<MainReviewDetailPage> createState() => _MainReviewDetailPageState();
}

class _MainReviewDetailPageState extends State<MainReviewDetailPage> {
  final String now = DateTime.now().toString();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<TodayMeal>? todayMeal;
  Future<DetailReview>? detailReview;

  @override
  void initState() {
    super.initState();
    todayMeal = getTodayMealInfo();
    detailReview = getDetailReviewInfo(widget.reviewId);
  }

  List<String> foodImage = [
    'MORNING.png',
    'LUNCH.png',
    'DINNER.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      body: Column(
        children: [
          SizedBox(height: 65.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formattedDate,
                style: TextStyle(
                  color: MukGenColor.primaryBase,
                  fontSize: 20.sp,
                  fontFamily: 'MukgenSemiBold',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 8.0.w),
              GestureDetector(
                onTap: () {

                },
                child: Icon(
                  CustomIcons.calendar,
                  color: MukGenColor.primaryLight2,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0.h),
          Row(
            children: [
              SizedBox(width: 20.0.w),
              Container(
                height: 150.0.h,
                width: 171.0.w,
                decoration: BoxDecoration(
                  color: MukGenColor.primaryLight3,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: FutureBuilder(
                  future: todayMeal,
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                          return Column(
                            children: [
                              SizedBox(height: 4.0.h),
                              Row(
                                children: [
                                  SizedBox(width: 10.0.w),
                                  SizedBox(
                                    width: 91.0.w,
                                    height: 142.0.h,
                                    child: ListView(
                                      padding: EdgeInsets.zero,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 10.0.h),
                                          child: Center(
                                            child: Text(
                                              widget.riceType == "BREAKFAST"
                                                  ? snapshot.data!.responseList![0].item.toString().replaceAll(',', '\n')
                                                  : widget.riceType == "LUNCH"
                                                  ? snapshot.data!.responseList![1].item.toString().replaceAll(',', '\n')
                                                  : snapshot.data!.responseList![2].item.toString().replaceAll(',', '\n'),
                                              style: TextStyle(
                                                color: MukGenColor.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'MukgenRegular',
                                                fontSize: 12.sp,
                                                height: 1.8,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 24.0.w),
                                  SizedBox(
                                    width: 36.5.w,
                                    height: 142.0.h,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 8.0.h),
                                        SizedBox(
                                          width: 25.0.w,
                                          height: 25.0.h,
                                          child: widget.riceType == "BREAKFAST" ? Image.asset("assets/images/MORNING.png")
                                                : widget.riceType == "LUNCH" ? Image.asset("assets/images/LUNCH.png")
                                                : Image.asset("assets/images/DINNER.png"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
              ),
              SizedBox(width: 10.0.w),
              Container(
                height: 150.0.h,
                width: 171.0.w,
                decoration: BoxDecoration(
                  color: MukGenColor.primaryLight3,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: FutureBuilder(
                  future: detailReview,
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${snapshot.data!.count.toString()}.0',
                              style: TextStyle(
                                color: MukGenColor.primaryLight1,
                                fontSize: 48.sp,
                                fontFamily: 'MukgenSemiBold',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.0.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List<Widget>.generate(5, (index1) {
                              return index1 < snapshot.data!.count! ? Image.asset(
                                'assets/images/Star.png',
                                width: 24.0.w,
                                height: 24.0.h,
                              ) : Image.asset(
                                'assets/images/Star_outlined.png',
                                width: 24.0.w,
                                height: 24.0.h,
                              );
                            }),
                          )
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0.h),
          Container(
            width: 353.0.w,
            height: 265.0.h,
            decoration: BoxDecoration(
              color: MukGenColor.primaryLight3,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: FutureBuilder(
              future: detailReview,
              builder:(context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(height: 15.0.h),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            snapshot.data!.userName.toString(),
                            style: TextStyle(
                              color: MukGenColor.primaryDark2,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'MukgenSemiBold',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0.h),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            /*DateFormat('yy.MM.dd HH:mm')
                                .format(DateTime.parse(
                                snapshot.data!..toString()))
                                .toString(),*/
                            '23.05.07 10:32',
                            style: TextStyle(
                              color: MukGenColor.primaryLight2,
                              fontSize: 12.sp,
                              fontFamily: 'MukgenRegular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0.h),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            snapshot.data!.content!,
                            style: TextStyle(
                              color: MukGenColor.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'MukgenRegular',
                              fontSize: 14.sp,
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
          )
        ],
      ),
    );
  }
}
