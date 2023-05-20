import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';

class OtherDaysPage extends StatefulWidget {
  const OtherDaysPage({Key? key}) : super(key: key);

  @override
  State<OtherDaysPage> createState() => _OtherDaysPageState();
}

class _OtherDaysPageState extends State<OtherDaysPage> {
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
      body: SingleChildScrollView(),
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
