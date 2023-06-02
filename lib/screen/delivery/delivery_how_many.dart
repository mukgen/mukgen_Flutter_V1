import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/delivery/delivery_what_food.dart';
import 'package:mukgen_flutter_v1/screen/delivery/delivery_what_time.dart';
import 'package:mukgen_flutter_v1/screen/delivery/delivery_where_meet.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';
import 'package:transition/transition.dart';

class DeliveryHowManyPage extends StatefulWidget {
  const DeliveryHowManyPage({Key? key}) : super(key: key);

  @override
  State<DeliveryHowManyPage> createState() => _DeliveryHowManyPageState();
}

class _DeliveryHowManyPageState extends State<DeliveryHowManyPage> {
  int _selectedIndex = 0;
  FixedExtentScrollController HowmanyscrollController =
      FixedExtentScrollController();
  bool _isButtonEnabled = true;

  @override
  void initState() {
    super.initState();
    HowmanyscrollController = FixedExtentScrollController(initialItem: 0);
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
            alignment: Alignment.centerRight,
            child: Text(
              '2 / 4',
              style: TextStyle(
                color: MukGenColor.primaryLight2,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'MukgenSemiBold',
              ),
            ),
          ),
          SizedBox(height: 24.0.h),
          Container(
            padding: EdgeInsets.only(left: 20.0.w),
            alignment: Alignment.centerLeft,
            child: Text(
              '몇명을\n모집하시나요?',
              style: TextStyle(
                color: MukGenColor.black,
                fontWeight: FontWeight.w600,
                fontFamily: 'MukgenSemiBold',
                fontSize: 24.sp,
              ),
            ),
          ),
          SizedBox(height: 24.0.h),
          Container(
                height: 240.0.h,
                width: 353.0.w,
                child: CupertinoPicker(
                    itemExtent: 56.0.h, // 각 항목의 높이
                    onSelectedItemChanged: (index) {
                      // 선택된 항목이 변경될 때 호출되는 콜백 함수
                      // index에 선택된 항목의 인덱스가 전달됩니다.
                      // 원하는 동작을 수행할 수 있습니다.
                    },
                    scrollController: HowmanyscrollController,
                    children: List<Widget>.generate(10, (index) {
                      return Center(
                        child: Text(
                          (index + 1).toString(), // 1부터 10까지의 숫자를 생성
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: 'MukgenSemiBold',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    })
                ),
              ),
          const Spacer(),
          Row(
            children: [
              SizedBox(width: 30.0.w),
              MukGenButton(
                width: 161.5,
                height: 55,
                text: "이전",
                backgroundColor: MukGenColor.primaryLight3,
                textColor: MukGenColor.pointBase,
                fontSize: 16.sp,
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop();
                  });
                },
              ),
              SizedBox(width: 10.0.w),
              MukGenButton(
                width: 161.5,
                height: 55,
                text: "다음",
                backgroundColor: _isButtonEnabled
                    ? MukGenColor.pointBase
                    : MukGenColor.primaryLight2,
                textColor: MukGenColor.white,
                fontSize: 16.sp,
                onPressed: () {
                  _isButtonEnabled
                      ? Navigator.push(
                    context,
                    Transition(
                      child: DeliveryWhereMeetPage(),
                      transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                    ),
                  )
                      : null;
                },
              ),
            ],
          ),
          SizedBox(height: 20.0.h),
        ],
      ),
    );
  }
}
