import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';
import 'package:transition/transition.dart';

class DeliveryWhatTimePage extends StatefulWidget {
  const DeliveryWhatTimePage({Key? key}) : super(key: key);

  @override
  State<DeliveryWhatTimePage> createState() => _DeliveryWhatTimePageState();
}

class _DeliveryWhatTimePageState extends State<DeliveryWhatTimePage> {
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
          '배달 파티',
          style: TextStyle(
            color: MukGenColor.primaryLight1,
            fontFamily: 'MukgenSemiBold',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0.h),
          Container(
            padding: EdgeInsets.only(right: 20.0.w),
            alignment: Alignment.bottomRight,
            child: Text(
              '4 / 4',
              style: TextStyle(
                color: MukGenColor.primaryLight2,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                fontFamily: 'MukgenSemiBold',
              ),
            ),
          ),
          SizedBox(height: 24.0.h),
          Container(
            padding: EdgeInsets.only(left: 20.0.w),
            alignment: Alignment.bottomLeft,
            child: Text(
              '몇시에\n만나실 건가요?',
              style: TextStyle(
                color: MukGenColor.black,
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
                fontFamily: 'MukgenSemiBold',
              ),
            ),
          ),
          SizedBox(height: 40.0.h),
          Container(

          ),
          const Spacer(),
          MukGenButton(
            width: 352,
            height: 55,
            text: "모집하기",
            backgroundColor: MukGenColor.pointBase,
            textColor: MukGenColor.white,
            fontSize: 16.sp,
            onPressed: () {
              /*_isButtonEnabled
                  ? Navigator.push(
                context,
                Transition(
                  child: DeliveryHowManyPage(),
                  transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                ),
              )
                  : null;*/
            },
          ),
          SizedBox(height: 10.0.h),
          MukGenButton(
            width: 352,
            height: 55,
            text: "뒤로",
            backgroundColor: MukGenColor.primaryLight3,
            textColor: MukGenColor.black,
            fontSize: 16.sp,
            onPressed: () {
              setState(() {
                Navigator.of(context).pop();
              });
            },
          ),
          SizedBox(height: 20.0.h),
        ],
      ),
    );
  }
}
