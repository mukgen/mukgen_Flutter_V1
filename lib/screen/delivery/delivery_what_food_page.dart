import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/delivery/delivery_how_many_page.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_text_field.dart';
import 'package:transition/transition.dart';

class DeliveryWhatFoodPage extends StatefulWidget {
  const DeliveryWhatFoodPage({Key? key}) : super(key: key);

  @override
  State<DeliveryWhatFoodPage> createState() => _DeliveryWhatFoodPageState();
}

class _DeliveryWhatFoodPageState extends State<DeliveryWhatFoodPage> {
  late TextEditingController whatfoodController;

  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    whatfoodController = TextEditingController();
    whatfoodController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    super.dispose();
    whatfoodController.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = whatfoodController.text.isNotEmpty;
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
              '1 / 4',
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
              '어떤 음식을\n배달 시키시나요?',
              style: TextStyle(
                color: MukGenColor.black,
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
                fontFamily: 'MukgenSemiBold',
              ),
            ),
          ),
          SizedBox(height: 24.0.h),
          MukGenTextField(
            width: 353,
            controller: whatfoodController,
            fontSize: 20,
            isPwdTextField: false,
            autofocus: true,
            maxLength: null,
            hintText: "음식 이름",
          ),
          const Spacer(),
          MukGenButton(
            width: 352,
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
                        child: DeliveryHowManyPage(menu: whatfoodController.text),
                        transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                      ),
                    )
                  : null;
            },
          ),
          SizedBox(height: 20.0.h),
        ],
      ),
    );
  }
}
