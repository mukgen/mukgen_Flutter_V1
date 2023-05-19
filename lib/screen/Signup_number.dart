import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/screen/StartingPage.dart';
import 'package:transition/transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupnumberApp extends StatefulWidget {
  const SignupnumberApp({Key? key}) : super(key: key);

  @override
  State<SignupnumberApp> createState() => _SignupnumberAppState();
}

class _SignupnumberAppState extends State<SignupnumberApp> {
  String _inputValue = '';
  String _inputValue2 = '';
  String _inputValue3 = '';

  bool get isFormValid =>
      _inputValue.isNotEmpty &&
          _inputValue2.isNotEmpty &&
          _inputValue3.isNotEmpty;
  bool get isFormValid2 =>
      _inputValue.length == 3 &&
          _inputValue2.length == 4 &&
          _inputValue3.length == 4;

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
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 10.0.w),
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF85858D),
            size: 24,
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
                fontSize: 24,
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
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'MukgenRegular'),
            ),
          ),
          SizedBox(height: 24.0.h),
          Row(
            children: [
              SizedBox(width: 20.0.w),
              Container(
                height: 56.0.h,
                width: 98.0.w,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 3) {
                      _secondFocusNode.requestFocus();
                    }
                    setState(() {
                      _inputValue = value;
                    });
                  },
                  autofocus: true,
                  focusNode: _firstFocusNode,
                  controller: _firstController,
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'MukgenSemiBold',
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    enabledBorder: _inputValue.isEmpty
                        ? UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xFFC9CAD0), width: 2))
                        : UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xFF000000), width: 2)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xFFFE6B01), width: 2)),
                  ),
                ),
              ),
              SizedBox(width: 10.0.w),
              Text(
                '-',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold',
                ),
              ),
              SizedBox(width: 10.0.w),
              Container(
                height: 56.0.h,
                width: 98.0.w,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 4) {
                      _thirdFocusNode.requestFocus();
                    }
                    setState(() {
                      _inputValue2 = value;
                    });
                  },
                  focusNode: _secondFocusNode,
                  controller: _secondController,
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'MukgenSemiBold',
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    enabledBorder: _inputValue2.isEmpty
                        ? UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xFFC9CAD0), width: 2))
                        : UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xFF000000), width: 2)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xFFFE6B01), width: 2)),
                  ),
                ),
              ),
              SizedBox(width: 10.0.w),
              Text(
                '-',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold',
                ),
              ),
              SizedBox(width: 10.0.w),
              Container(
                height: 56.0.h,
                width: 98.0.w,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _inputValue3 = value;
                    });
                  },
                  focusNode: _thirdFocusNode,
                  controller: _thirdController,
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'MukgenSemiBold'
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    enabledBorder: _inputValue3.isEmpty
                        ? UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xFFC9CAD0), width: 2))
                        : UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xFF000000), width: 2)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xFFFE6B01), width: 2)),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: 352.0.w,
            height: 55.0.h,
            child: TextButton(
              onPressed: () {
                setState(() {
                  if (isFormValid == true) {
                    Navigator.push(
                      context,
                      Transition(
                        child: StartingApp(),
                        transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                      ),
                    );
                  }
                });
              },
              child: Text(
                '완료',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'MukgenSemiBold',
                  color: Color(0xFFFFFFFF),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: isFormValid == false
                    ? MaterialStateProperty.all(Color(0xFFC9CAD0))
                    : MaterialStateProperty.all(Color(0xFF6B6C71)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0.h),
        ],
      ),
    );
  }
}
