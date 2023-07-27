import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/widget/custom_icons.dart';

class MainReviewOtherDaysPage extends StatefulWidget {
  const MainReviewOtherDaysPage({Key? key}) : super(key: key);

  @override
  State<MainReviewOtherDaysPage> createState() => _MainReviewOtherDaysPageState();
}

class _MainReviewOtherDaysPageState extends State<MainReviewOtherDaysPage> {
  final String now = DateTime.now().toString();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  bool calendarChecked = false;
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
                  setState(() {
                    !calendarChecked;
                    if(calendarChecked) {

                    }
                  });
                },
                child: Icon(
                  CustomIcons.calendar,
                  color: MukGenColor.primaryLight2,
                ),
              ),
            ],
          )
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
