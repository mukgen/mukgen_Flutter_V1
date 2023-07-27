import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';

class MainSuggestionPostingPage extends StatefulWidget {
  const MainSuggestionPostingPage({Key? key}) : super(key: key);

  @override
  State<MainSuggestionPostingPage> createState() => _MainSuggestionPostingPageState();
}

class _MainSuggestionPostingPageState extends State<MainSuggestionPostingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 61.0.h,
        backgroundColor: MukGenColor.white,
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0.w),
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).pop();
              });
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: MukGenColor.primaryLight1,
              size: 20.0.sp,
            ),
          ),
        ),
        title: Text(
          '글쓰기',
          style: TextStyle(
            color: MukGenColor.black,
            fontWeight: FontWeight.w600,
            fontFamily: 'MukgenSemiBold',
            fontSize: 20.sp,
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 20.0.w),
              child: GestureDetector(
                onTap: (){
                  setState(() {

                  });
                },
                child: Text(
                  '등록',
                  style: TextStyle(
                      color: MukGenColor.pointBase,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'MukgenSemiBold',
                      fontSize: 16.sp
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
