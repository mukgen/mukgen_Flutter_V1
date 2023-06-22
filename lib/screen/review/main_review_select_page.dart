import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/model/meal/today_meal.dart';
import 'package:mukgen_flutter_v1/service/get_today_meals_info.dart';

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
          FutureBuilder(
            future: todayMeal,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.responseList!.length,
                  itemBuilder: (context, index) {
                    final itemList = _parseItemList(
                        snapshot.data!.responseList![index].item.toString());
                    return Container(
                      width: 353.0.w,
                      height: 198.0.h,
                      decoration: BoxDecoration(
                        color: MukGenColor.primaryLight3,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        child: Row(
                          children: [
                            SizedBox(width: 24.0.w),
                            Column(
                              children: [

                              ],
                            )
                          ],
                        ),
                        onPressed: () {

                        },
                      ),
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
    );
  }
}

List<String> _parseItemList(String itemData) {
  final itemListString = itemData.substring(1, itemData.length - 1);
  return itemListString.split(', ');
}
