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
                                 children: [
                                   SizedBox(width: 10.0.w),
                                   SizedBox(
                                     width: 91.0.w,
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
                                       return index1 < detailReview.count! ? Image.asset(
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