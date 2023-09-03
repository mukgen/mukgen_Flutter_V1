import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/model/review/date_review.dart';
import 'package:mukgen_flutter_v1/widget/custom_icons.dart';
import 'package:mukgen_flutter_v1/widget/review/review_calendar_total_widget.dart';

class MainReviewOtherDaysPage extends StatefulWidget{
  const MainReviewOtherDaysPage({Key? key}) : super(key: key);

  @override
  State<MainReviewOtherDaysPage> createState() =>
      _MainReviewOtherDaysPageState();
}

class _MainReviewOtherDaysPageState extends State<MainReviewOtherDaysPage> {
  Future<DateReview>? dateReview;
  final String now = DateTime.now().toString();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      appBar: AppBar(
        backgroundColor: MukGenColor.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0.w),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: MukGenColor.primaryLight1,
              size: 20.0.sp,
            ),
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
          SizedBox(height: 24.0.h),
          Row(
            children: [
              SizedBox(width: 20.0.w),
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
                  setState(
                    () {
                      StateCalendar.calendarChecked =
                          !StateCalendar.calendarChecked;
                      if (StateCalendar.calendarChecked) {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  side: BorderSide(
                                    color: MukGenColor.pointLight3,
                                    width: 2.w,
                                  )),
                              content: ReviewCalendarTotalWidget(
                                onCancel: () {
                                  setState(() {
                                    StateCalendar.calendarChecked = false;
                                  });
                                },
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
                child: Icon(
                  CustomIcons.calendar,
                  color: StateCalendar.calendarChecked
                      ? MukGenColor.pointLight1
                      : MukGenColor.primaryLight2,
                ),
              ),
            ],
          ),
          FutureBuilder(
            future: dateReview,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final dateReview = snapshot.data!;
                return ListView.builder(
                  itemCount: dateReview.reviewResponseList!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {

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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0.w),
                                      child: Row(
                                        children: List<Widget>.generate(5, (index1) {
                                          return index1 < dateReview.reviewResponseList![index].count! ? Image.asset(
                                            'assets/images/Star.png',
                                            width: 24.0.w,
                                            height: 24.0.h,
                                          ) : Image.asset(
                                            'assets/images/StarOutlined.png',
                                            width: 24.0.w,
                                            height: 24.0.h,
                                          );
                                        }),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 21.0.w, top: 1.0.h),
                                      child: Text(
                                        dateReview.reviewResponseList![index].userName.toString(),
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
                                          dateReview.reviewResponseList![index].review.toString(),
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
                                              DateFormat('yy.MM.dd').format(DateTime.parse(dateReview.reviewResponseList![index].createdAt!)).toString(),
                                              style: TextStyle(
                                                color: MukGenColor.primaryLight2,
                                                fontSize: 12.sp,
                                                fontFamily: 'MukgenRegular',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'ㅣ',
                                            style: TextStyle(
                                              color: MukGenColor.primaryLight2,
                                              fontSize: 12.sp,
                                              fontFamily: 'MukgenRegular',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            DateFormat('HH:mm').format(DateTime.parse(dateReview.reviewResponseList![index].createdAt!)).toString(),
                                            style: TextStyle(
                                              color: MukGenColor.primaryLight1,
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
        ],
      ),
      floatingActionButton: SizedBox(
        width: 70.0.w,
        height: 70.0.h,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: null,
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

class StateCalendar {
  static bool calendarChecked = false;
}
