import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/delivery/posting/view/delivery_where_meet_page.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';
import 'package:transition/transition.dart';

class DeliveryHowManyPage extends StatefulWidget {
  const DeliveryHowManyPage({Key? key, required this.menu}) : super(key: key);

  final String menu;

  @override
  State<DeliveryHowManyPage> createState() => _DeliveryHowManyPageState();
}

class _DeliveryHowManyPageState extends State<DeliveryHowManyPage> {
  late FixedExtentScrollController howmanyscrollController =
  FixedExtentScrollController();
  bool _isButtonEnabled = true;

  int howmanyValue = 1; // 컨트롤러에 있는 값을 옮겨주는 변수임., 픽커를 움직여주지 않고 1명을 지정하였을 때 변수의 초기값인 0으로 되기 때문에 1로 설정함.

  @override
  void initState() {
    super.initState();
    howmanyscrollController = FixedExtentScrollController(initialItem: 0);
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
          SizedBox(
            height: 240.0.h,
            width: 353.0.w,
            child: CupertinoPicker(
                itemExtent: 56.0.h, // 각 항목의 높이
                onSelectedItemChanged: (index) {
                  HapticFeedback.mediumImpact();
                  howmanyValue = index + 1;
                },
                squeeze: 0.9.h,
                diameterRatio: 3.r,
                scrollController: howmanyscrollController,
                children: List<Widget>.generate(9, (index) {
                  return Center(
                    child: Text(
                      (index + 1).toString(), // 1부터 9까지의 숫자를 생성
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
                outlineColor: MukGenColor.pointBase,
                outlineWidth: 1.0,
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
                      child: DeliveryWhereMeetPage(menu: widget.menu, participantNumber: howmanyValue + 1),
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
