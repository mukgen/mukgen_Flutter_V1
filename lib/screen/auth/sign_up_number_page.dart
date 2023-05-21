import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/starting_page.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpNumberPage extends StatefulWidget {
  const SignUpNumberPage({Key? key}) : super(key: key);

  @override
  State<SignUpNumberPage> createState() => _SignUpNumberPageState();
}

class _SignUpNumberPageState extends State<SignUpNumberPage> {
  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;

  late TextEditingController _firstController;
  late TextEditingController _secondController;
  late TextEditingController _thirdController;

  @override
  void initState() {
    super.initState();
    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _firstController = TextEditingController();
    _secondController = TextEditingController();
    _thirdController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      appBar: AppBar(
        backgroundColor: MukGenColor.white,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 10.0.w),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: MukGenColor.primaryLight1,
            size: 24.0.sp,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40.0.h),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20.0.w),
            child: Text(
              '전화번호를 입력해주세요.',
              style: TextStyle(
                fontSize: 24.0.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'MukgenSemiBold',
              ),
            ),
          ),
          SizedBox(height: 12.0.h),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20.0.w),
            child: Text(
              '배달 파티 모집 시 사용됩니다.',
              style: TextStyle(
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'MukgenRegular'),
            ),
          ),
          SizedBox(height: 24.0.h),
          Row(
            children: [
              SizedBox(width: 20.0.w),
              SizedBox(
                height: 56.0.h,
                width: 98.0.w,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 3) {
                      _secondFocusNode.requestFocus();
                    }
                    setState(() {});
                  },
                  autofocus: true,
                  focusNode: _firstFocusNode,
                  controller: _firstController,
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'MukgenSemiBold',
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    enabledBorder: _firstController.text.isEmpty
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MukGenColor.primaryLight2, width: 2))
                        : UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: MukGenColor.black, width: 2)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: MukGenColor.pointBase, width: 2)),
                  ),
                ),
              ),
              SizedBox(width: 10.0.w),
              Text(
                '-',
                style: TextStyle(
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold',
                ),
              ),
              SizedBox(width: 10.0.w),
              SizedBox(
                height: 56.0.h,
                width: 98.0.w,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 4) {
                      _thirdFocusNode.requestFocus();
                    }
                    setState(() {});
                  },
                  focusNode: _secondFocusNode,
                  controller: _secondController,
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'MukgenSemiBold',
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    enabledBorder: _secondController.text.isEmpty
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MukGenColor.primaryLight2, width: 2))
                        : UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: MukGenColor.black, width: 2)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: MukGenColor.pointBase, width: 2)),
                  ),
                ),
              ),
              SizedBox(width: 10.0.w),
              Text(
                '-',
                style: TextStyle(
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold',
                ),
              ),
              SizedBox(width: 10.0.w),
              SizedBox(
                height: 56.0.h,
                width: 98.0.w,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  focusNode: _thirdFocusNode,
                  controller: _thirdController,
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'MukgenSemiBold'),
                  decoration: InputDecoration(
                    counterText: '',
                    enabledBorder: _thirdController.text.isEmpty
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MukGenColor.primaryLight2, width: 2))
                        : UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: MukGenColor.black, width: 2)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: MukGenColor.pointBase, width: 2)),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          MukGenButton(
            text: "완료",
            width: 352,
            height: 55,
            backgroundColor: _firstController.text.length == 3 &&
                    _secondController.text.length == 4 &&
                    _thirdController.text.length == 4
                ? MukGenColor.grey
                : MukGenColor.primaryLight2,
            fontSize: 16,
            textColor: MukGenColor.white,
            onPressed: () {
              if (_firstController.text.length == 3 &&
                  _secondController.text.length == 4 &&
                  _thirdController.text.length == 4) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => StartingPage()));
              }
            },
          ),
          SizedBox(height: 20.0.h),
        ],
      ),
    );
  }
}
