import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/model/meal/today_meal.dart';
import 'package:mukgen_flutter_v1/screen/review/main_review_posting_page.dart';
import 'package:mukgen_flutter_v1/service/get/meals/get_today_meals_info.dart';
import 'package:transition/transition.dart';

class MainReviewSelectPage extends StatefulWidget {
  const MainReviewSelectPage({Key? key}) : super(key: key);

  @override
  State<MainReviewSelectPage> createState() => _MainReviewSelectPageState();
}

class _MainReviewSelectPageState extends State<MainReviewSelectPage> {
  String formattedDate = DateFormat('yy.MM.dd').format(DateTime.now());
  Future<TodayMeal>? todayMeal;
  final PageController pageController =
  PageController(initialPage: 0, viewportFraction: 0.9);

  List<String> foodImage = [
    'MORNING.png',
    'LUNCH.png',
    'DINNER.png'
  ];

  @override
  void initState() {
    super.initState();
    todayMeal = getTodayMealInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      appBar: AppBar(
        backgroundColor: MukGenColor.white,
        elevation: 0,
        centerTitle: true,
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
        title: Text(
          '급식 리뷰 작성',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'MukgenSemibold',
            fontSize: 20.sp,
            color: MukGenColor.primaryLight1,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 24.0.h),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20.0.w),
            child: Text(
              '리뷰를 작성하고 싶은\n급식을 선택하세요.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                fontFamily: 'MukgenSemibold',
                color: MukGenColor.black,
              ),
            ),
          ),
          SizedBox(height: 16.0.h),
          SizedBox(
            height: 626.0.h,
            child: FutureBuilder(
              future: todayMeal,
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.responseList!.length,
                    itemBuilder: (context, index) {
                      final itemList = _parseItemList(
                          snapshot.data!.responseList![index].items.toString());
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                Transition(
                                  child: MainReviewPostingPage(riceId: snapshot.data!.responseList![index].riceId, riceType: snapshot.data!.responseList![index].riceType),
                                  transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                                ),
                              );
                            },
                            child: Container(
                              height: 198.0.h,
                              width: 353.0.w,
                              decoration: BoxDecoration(
                                color: MukGenColor.primaryLight3,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 24.0.w),
                                  SizedBox(
                                    width: 100.0.w,
                                    height: 150.0.h,
                                    child: Column(
                                      children: [
                                        Text(
                                          snapshot.data!.responseList![index].riceType.toString(),
                                          style: TextStyle(
                                            color: MukGenColor.pointBase,
                                            fontSize: 16.sp,
                                            fontFamily: 'MukgenSemiBold',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 24.0.h),
                                        Image(
                                          image: AssetImage(
                                            "assets/images/${foodImage[index]}",
                                          ),
                                          width: 55.0.r,
                                          height: 55.0.r,
                                        ),
                                        SizedBox(height: 24.0.h),
                                        Text(
                                          formattedDate,
                                          style: TextStyle(
                                            color: MukGenColor.primaryBase,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'MukgenRegular',
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 24.0.w),
                                  SizedBox(
                                    width: 181.0.w,
                                    height: 140.0.h,
                                    child: ListView.builder(
                                      itemCount: snapshot.data!.responseList![index].items!.length,
                                      itemBuilder: (context, itemIndex) {
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              itemList[itemIndex],
                                              style: TextStyle(
                                                fontSize: 14.0.sp,
                                                fontFamily: 'MukgenRegular',
                                                fontWeight: FontWeight.w400,
                                                height: 1.6.h,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 16.0.h),
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
        ],
      ),
    );
  }
}
List<String> _parseItemList(String itemData) {
  final itemListString = itemData.substring(1, itemData.length - 1);
  return itemListString.split(', ');
}
