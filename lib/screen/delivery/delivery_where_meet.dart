import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/delivery/delivery_how_many.dart';
import 'package:mukgen_flutter_v1/screen/delivery/delivery_what_time.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_text_field.dart';
import 'package:transition/transition.dart';

class DeliveryWhereMeetPage extends StatefulWidget {
  const DeliveryWhereMeetPage({Key? key}) : super(key: key);

  @override
  State<DeliveryWhereMeetPage> createState() => _DeliveryWhereMeetPageState();
}

class _DeliveryWhereMeetPageState extends State<DeliveryWhereMeetPage> {
  late TextEditingController WheremeetController;

  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    WheremeetController = TextEditingController();
    WheremeetController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    super.dispose();
    WheremeetController.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = WheremeetController.text.isNotEmpty;
    });
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
            alignment: Alignment.bottomRight,
            child: Text(
              '3 / 4',
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
              '어디서\n만나실 건가요?',
              style: TextStyle(
                color: MukGenColor.black,
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
                fontFamily: 'MukgenSemiBold',
              ),
            ),
          ),
          SizedBox(height: 24.0.h),
          Container(
            child: MukGenTextField(
              width: 353,
              controller: WheremeetController,
              fontSize: 20,
              isPwdTextField: false,
              autofocus: true,
              maxLength: null,
              hintText: "장소",
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
                      child: DeliveryWhatTimePage(),
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
