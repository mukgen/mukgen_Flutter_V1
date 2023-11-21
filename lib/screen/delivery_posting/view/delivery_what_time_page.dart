import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mukgen_flutter_v1/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:mukgen_flutter_v1/core/constant/custom_text.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';
import 'package:mukgen_flutter_v1/service/delivery_service.dart';
import 'package:mukgen_flutter_v1/screen/widget/mukgen_button.dart';

class DeliveryWhatTimePage extends StatefulWidget {
  const DeliveryWhatTimePage(
      {Key? key,
      required this.menu,
      required this.participantNumber,
      required this.place})
      : super(key: key);

  final String menu, place;
  final int participantNumber;

  @override
  State<DeliveryWhatTimePage> createState() => _DeliveryWhatTimePageState();
}

class _DeliveryWhatTimePageState extends State<DeliveryWhatTimePage> {
  FixedExtentScrollController timeController = FixedExtentScrollController();
  FixedExtentScrollController hourController = FixedExtentScrollController();
  FixedExtentScrollController minuteController = FixedExtentScrollController();

  bool timeValues = false;
  int hourValues = 1;
  int minuteValues = 0;

  @override
  void initState() {
    super.initState();
    timeController = FixedExtentScrollController(initialItem: 0);
    hourController = FixedExtentScrollController(initialItem: 0);
    minuteController = FixedExtentScrollController(initialItem: 0);
  }

  List<String> time = [
    '오전',
    '오후',
  ];

  List<String> hour = [
    '1시',
    '2시',
    '3시',
    '4시',
    '5시',
    '6시',
    '7시',
    '8시',
    '9시',
    '10시',
    '11시',
    '12시',
  ];

  List<String> minute = [
    '0분',
    '10분',
    '20분',
    '30분',
    '40분',
    '50분',
  ];

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200.0.h,
                width: 100.0.w,
                child: CupertinoPicker.builder(
                  itemExtent: 49.0.h,
                  childCount: time.length,
                  onSelectedItemChanged: (index) {
                    if (timeController.selectedItem == 1) {
                      setState(() {
                        if (hourValues == 0 || hourValues == 1) {
                          hourValues = 13;
                          timeValues = true;
                        } else {
                          hourValues += 12;
                          timeValues = true;
                        }
                      });
                    } else {
                      setState(() {
                        timeValues = false;
                      });
                    }
                  },
                  squeeze: 0.95.h,
                  diameterRatio: 2.0.r,
                  scrollController: timeController,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text(
                        time[index],
                        style: TextStyle(
                          color: MukGenColor.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'MukgenSemiBold',
                          fontSize: 24.sp,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Text(
                ':',
                style: TextStyle(
                  color: MukGenColor.primaryLight1,
                  fontSize: 32.sp,
                  fontFamily: 'MukgenSemiBold',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 200.0.h,
                width: 100.0.w,
                child: CupertinoPicker.builder(
                  itemExtent: 49.0.h,
                  childCount: hour.length,
                  onSelectedItemChanged: (index) {
                    print(timeValues);
                    print(hourValues);
                    if (timeValues == true) {
                      if (index == 11) {
                        hourValues = 12;
                      } else {
                        hourValues = (index + 1) + 12;
                      }
                    } else {
                      if (index == 11) {
                        hourValues = 0;
                      } else {
                        hourValues = index + 1;
                      }
                    }
                  },
                  squeeze: 0.95.h,
                  diameterRatio: 2.0.r,
                  scrollController: hourController,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text(
                        hour[index],
                        style: TextStyle(
                          color: MukGenColor.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'MukgenSemiBold',
                          fontSize: 24.sp,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Text(
                ':',
                style: TextStyle(
                  color: MukGenColor.primaryLight1,
                  fontSize: 32.sp,
                  fontFamily: 'MukgenSemiBold',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 200.0.h,
                width: 100.0.w,
                child: CupertinoPicker.builder(
                  itemExtent: 49.0.h,
                  childCount: minute.length,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      minuteValues = index * 10;
                    });
                  },
                  squeeze: 0.95.h,
                  diameterRatio: 2.0.r,
                  scrollController: minuteController,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text(
                        minute[index],
                        style: TextStyle(
                          color: MukGenColor.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'MukgenSemiBold',
                          fontSize: 24.sp,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const Spacer(),
          MukGenButton(
            width: 352,
            height: 55,
            text: PtdTextWidget.bodyLarge2(
              '모집하기',
              MukGenColor.white,
            ),
            backgroundColor: MukGenColor.pointBase,
            onPressed: () {
              DateTime now = DateTime.now();
              DateTime customDateTime = DateTime(
                  now.year, now.month, now.day, hourValues, minuteValues, 0);
              String formattedDateTime =
                  DateFormat('yyyy-MM-ddTHH:mm:ss').format(customDateTime);
              DeliveryService.postDeliveryPartyInfo(widget.menu,
                  widget.participantNumber, widget.place, formattedDateTime);
              print(formattedDateTime);
              Navigator.of(context).popUntil((route) =>
                  route.isFirst ||
                  route.settings.name ==
                      '/MainDeliveryPartyPage'); // Main 페이지로 갈 때 까지 pop
            },
          ),
          SizedBox(height: 10.0.h),
          MukGenButton(
            width: 352,
            height: 55,
            text: PtdTextWidget.bodyLarge2(
              '뒤로',
              MukGenColor.black,
            ),
            backgroundColor: MukGenColor.primaryLight3,
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
