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

  final Map<String, String> riceTypeToImage = {
    "BREAKFAST": "assets/images/BREAKFAST.png",
    "LUNCH": "assets/images/LUNCH.png",
    "DINNER": "assets/images/DINNER.png",
  };

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
          FutureBuilder(
             future: Future.wait([todayMeal, detailReview].cast<Future<dynamic>>()),
             builder: (context, snapshot) {
               int mealIndex = widget.riceType == "BREAKFAST" ? 0 : widget.riceType == "LUNCH" ? 1 : 2;
               if(snapshot.hasData) {
                 final todayMeal = snapshot.data![0] as TodayMeal;
                 final detailReview = snapshot.data![1] as DetailReview;
                     return Column(
                       children: [
                         SizedBox(height: 4.0.h),
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
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   SizedBox(
                                     width: 120.0.w,
                                     height: 142.0.h,
                                     child: ListView.builder(
                                       padding: EdgeInsets.zero,
                                       itemCount: todayMeal.responseList![mealIndex].items!.length,
                                       itemBuilder: (context, index) {
                                         final itemList = _parseItemList(
                                             todayMeal.responseList![mealIndex].items.toString());
                                         return Row(
                                           children: [
                                             Padding(
                                               padding: EdgeInsets.only(left: 10.0.w),
                                               child: Text(
                                                 itemList[index],
                                                 style: TextStyle(
                                                   color: MukGenColor.black,
                                                   fontSize: 12.sp,
                                                   fontFamily: 'MukgenRegular',
                                                   fontWeight: FontWeight.w400,
                                                   height: 1.8.h,
                                                 ),
                                               ),
                                             ),
                                           ],
                                         );
                                       },
                                     ),
                                   ),
                                   SizedBox(
                                     width: 36.5.w,
                                     height: 142.0.h,
                                     child: Column(
                                       children: [
                                         SizedBox(height: 8.0.h),
                                         SizedBox(
                                           width: 25.0.w,
                                           height: 25.0.h,
                                           child: Image.asset(riceTypeToImage[widget.riceType]!),
                                         ),
                                       ],
                                     ),
                                   ),
                                   SizedBox(width: 10.0.w),
                                 ],
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
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Align(
                                     alignment: Alignment.center,
                                     child: Text(
                                       '${detailReview.count.toString()}.0',
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
                                       return Image.asset(
                                         index1 < detailReview.count! ? 'assets/images/Star.png' : 'assets/images/StarOutlined.png',
                                         width: 24.0.w,
                                         height: 24.0.h,
                                       );
                                     }),
                                   )
                                 ],
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
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               SizedBox(height: 15.0.h),
                               Padding(
                                 padding: EdgeInsets.only(left: 15.0.w),
                                 child: Text(
                                   detailReview.userNickname.toString(),
                                   style: TextStyle(
                                     color: MukGenColor.primaryDark2,
                                     fontWeight: FontWeight.w600,
                                     fontFamily: 'MukgenSemiBold',
                                     fontSize: 20.sp,
                                   ),
                                 ),
                               ),
                               SizedBox(height: 5.0.h),
                               Padding(
                                 padding: EdgeInsets.only(left: 15.0.w),
                                 child: Text(
                                   DateFormat('yy.MM.dd HH:mm').format(DateTime.parse(detailReview.createdAt!)).toString(),
                                   style: TextStyle(
                                     color: MukGenColor.primaryLight2,
                                     fontSize: 12.sp,
                                     fontFamily: 'MukgenRegular',
                                     fontWeight: FontWeight.w400,
                                   ),
                                 ),
                               ),
                               SizedBox(height: 5.0.h),
                               Padding(
                                 padding: EdgeInsets.only(left: 15.0.w),
                                 child: SizedBox(
                                   width: 323.0.w,
                                   height: 187.0.h,
                                   child: Padding(
                                     padding: EdgeInsets.only(top: 4.0.h),
                                     child: Text(
                                       detailReview.content!.toString(),
                                       style: TextStyle(
                                         color: MukGenColor.black,
                                         fontWeight: FontWeight.w400,
                                         fontFamily: 'MukgenRegular',
                                         fontSize: 14.sp,
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                         SizedBox(height: 10.0.h),
                         SizedBox(
                           width: 353.0.w,
                           height: 288.0.h,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               SizedBox(height: 10.0.h),
                               Padding(
                                 padding: EdgeInsets.only(left: 10.0.w),
                                 child: Text(
                                   '댓글',
                                   style: TextStyle(
                                     color: MukGenColor.black,
                                     fontSize: 20.sp,
                                     fontFamily: 'MukgenSemiBold',
                                     fontWeight: FontWeight.w600,
                                   ),
                                 ),
                               ),
                               SizedBox(height: 24.0.h),
                               SizedBox(
                                 width: 333.0.w,
                                 height: 220.0.h,
                                 child: ListView.builder(
                                   padding: EdgeInsets.zero,
                                   itemCount: detailReview.reviewCommentResponseList!.length,
                                   itemBuilder: (context, reviewIndex) {
                                     DateTime postTime = DateTime.parse(detailReview.reviewCommentResponseList![reviewIndex].createdAt.toString());
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
                                             SizedBox(width: 10.0.w),
                                             Text(
                                               '영양사 선생님',
                                               style: TextStyle(
                                                 color: MukGenColor.primaryLight1,
                                                 fontSize: 14.sp,
                                                 fontWeight: FontWeight.w400,
                                                 fontFamily: 'MukgenRegular',
                                               ),
                                             ),
                                             Text(
                                               'ㅣ',
                                               style: TextStyle(
                                                 color: MukGenColor.primaryLight2,
                                                 fontSize: 14.sp,
                                                 fontWeight: FontWeight.w400,
                                                 fontFamily: 'MukgenRegular',
                                               ),
                                             ),
                                             Text(
                                               timeAgo,
                                               style: TextStyle(
                                                 color: MukGenColor.primaryLight2,
                                                 fontSize: 14.sp,
                                                 fontWeight: FontWeight.w400,
                                                 fontFamily: 'MukgenRegular',
                                               ),
                                             ),
                                           ],
                                         ),
                                         SizedBox(height: 8.0.h),
                                         Row(
                                           children: [
                                             SizedBox(width: 10.0.w),
                                             Text(
                                               detailReview.reviewCommentResponseList![reviewIndex].content.toString(),
                                               style: TextStyle(
                                                 color: MukGenColor.black,
                                                 fontSize: 14.sp,
                                                 fontWeight: FontWeight.w400,
                                                 fontFamily: 'MukgenRegular',
                                               ),
                                             ),
                                           ],
                                         )
                                       ],
                                     );
                                   },
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
                 return const Center(child: CircularProgressIndicator());
               }
             },
           ),
        ],
      ),
    );
  }
}
List<String> _parseItemList(String itemData) {
  final itemListString = itemData.substring(1, itemData.length - 1);
  return itemListString.split(', ');
}