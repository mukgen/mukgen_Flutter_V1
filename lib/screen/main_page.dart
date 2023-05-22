import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/model/meal/today_meal.dart';
import 'package:mukgen_flutter_v1/service/get_today_meals_info.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  Future<TodayMeal>? todayMeal;

  @override
  void initState() {
    super.initState();
    todayMeal = getTodayMealInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0.w),
                child: Image(
                  image: const AssetImage(
                      'assets/images/MukgenMainHomeAppBar.png'),
                  width: 104.0.w,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 210.0.w),
                child: IconButton(
                  icon: const Icon(Icons.person),
                  iconSize: 28,
                  color: MukGenColor.primaryLight2,
                  onPressed: null,
                ),
              ),
            ],
          ),
          SizedBox(height: 32.0.h),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 20.0.w),
            child: Text(
              '오늘의 급식',
              style: TextStyle(
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold'),
            ),
          ),
          SizedBox(height: 12.0.w),
          SizedBox(
            width: 353.0.w,
            height: 220.0.h,
            child: FutureBuilder(
              future: todayMeal,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.responseList!.length,
                    itemBuilder: (context, index) {
                      final itemList = _parseItemList(
                          snapshot.data!.responseList![index].item.toString());
                      return Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 353.0.w,
                            height: 220.0.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MukGenColor.primaryLight3,
                            ),
                            child: ListView.builder(
                              itemCount: itemList.length,
                              itemBuilder: (context, itemIndex) {
                                return Text(itemList[itemIndex]);
                              },
                            ),
                          ),
                          SizedBox(width: 7.0.w),
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
          SizedBox(height: 32.0.h),
          Container(
            alignment: Alignment.center,
            width: 353.0.w,
            height: 69.0.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MukGenColor.primaryLight3,
            ),
          ),
          SizedBox(height: 20.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 20.0.w),
                child: Text(
                  '인기글',
                  style: TextStyle(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'MukgenSemiBold'),
                ),
              ),
              SizedBox(width: 252.0.w),
              SizedBox(
                child: TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text(
                    '더보기',
                    style: TextStyle(
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'MukgenRegular',
                        color: MukGenColor.pointLight1),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.0.h),
          Column(
            children: [
              Container(
                width: 353.0.w,
                height: 49.0.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MukGenColor.primaryLight3,
                ),
              ),
              SizedBox(height: 8.0.h),
              Container(
                width: 353.0.w,
                height: 49.0.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MukGenColor.primaryLight3,
                ),
              ),
              SizedBox(height: 8.0.h),
              Container(
                width: 353.0.w,
                height: 49.0.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MukGenColor.primaryLight3,
                ),
              ),
            ],
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
