import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainHomeApp extends StatefulWidget {
  const MainHomeApp({Key? key}) : super(key: key);

  @override
  State<MainHomeApp> createState() => _MainHomeAppState();
}

class _MainHomeAppState extends State<MainHomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
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
                  image: AssetImage('assets/images/MukgenMainHomeAppBar.png'),
                  width: 104.0.w,
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 210.0.w),
                  child: IconButton(
                    icon: Icon(Icons.person),
                    iconSize: 28,
                    color: Color(0xFFC9CAD0),
                    onPressed: (){

                    },
                  )
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
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold'),
            ),
          ),
          SizedBox(height: 12.0.w),
          SizedBox(
            width: 353.0.w,
            height: 220.0.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 353.0.w,
                  height: 220.0.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF5F6F6),
                  ),
                ),
                SizedBox(width: 7.0.w),
                Container(
                  alignment: Alignment.center,
                  width: 353.0.w,
                  height: 220.0.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF000000),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.0.h),
          Container(
            alignment: Alignment.center,
            width: 353.0.w,
            height: 69.0.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFF5F6F6),
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
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'MukgenSemiBold'),
                ),
              ),
              SizedBox(width: 252.0.w),
              Container(
                child: TextButton(
                  onPressed: (){
                    setState(() {

                    });
                  },
                  child: Text('더보기',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'MukgenRegular',
                        color: Color(0xFFFF7A1B)
                    ),
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
                  color: Color(0xFFF5F6F6),
                ),
              ),
              SizedBox(height: 8.0.h),
              Container(
                width: 353.0.w,
                height: 49.0.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF5F6F6),
                ),
              ),
              SizedBox(height: 8.0.h),
              Container(
                width: 353.0.w,
                height: 49.0.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF5F6F6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
