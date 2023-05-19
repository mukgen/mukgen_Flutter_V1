import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherDaysApp extends StatefulWidget {
  const OtherDaysApp({Key? key}) : super(key: key);

  @override
  State<OtherDaysApp> createState() => _OtherDaysAppState();
}

class _OtherDaysAppState extends State<OtherDaysApp> {
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
            Icons.arrow_back_ios_new,
            color: Color(0xFF85858D),
            size: 24,
          ),
        ),
        centerTitle: true,
        title: Text(
          '급식',
          style: TextStyle(
            color: Color(0xFF85858D),
            fontWeight: FontWeight.w600,
            fontSize: 20,
            fontFamily: 'MukgenSemiBold',
          ),
        ),
      ),
      body: SingleChildScrollView(

      ),
      floatingActionButton: Container(
        width: 70.0.w,
        height: 70.0.h,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: (){

            },
            elevation: 0,
            backgroundColor: Color(0xFFFE6B01),
            child: Icon(Icons.add,size: 30,color: Color(0xFFFFFFFF)),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
