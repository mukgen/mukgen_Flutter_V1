import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/service/get/review/get_date_review_info.dart';
import 'package:table_calendar/table_calendar.dart';

class ReviewCalendarTotalWidget extends StatefulWidget {
  final Function onCancel;

  const ReviewCalendarTotalWidget({Key? key, required this.onCancel}) : super(key: key);

  @override
  State<ReviewCalendarTotalWidget> createState() => _ReviewCalendarTotalWidgetState();
}

class _ReviewCalendarTotalWidgetState extends State<ReviewCalendarTotalWidget> {
  late DateTime _selectedDay;

  @override
  void initState() {
    _selectedDay = DateTime.now();
    super.initState();
  }

  TextStyle calendarTextStyle(Color color) {
    return TextStyle(
      color: color,
      fontSize: 14.sp,
      fontFamily: 'MukgenSemiBold',
      fontWeight: FontWeight.w600,
    );
  }

  String formatDate(DateTime dateTime) {
    return DateFormat('yyyyMMdd').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 330.0.w,
          height: 383.0.h,
          child: TableCalendar(
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
            locale: Intl.defaultLocale,
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: calendarTextStyle(MukGenColor.primaryLight1),
              weekendStyle: calendarTextStyle(MukGenColor.pointLight2),
            ),
            daysOfWeekHeight: 30.0.h,
            rowHeight: 40.0.h,
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: MukGenColor.pointLight1,
                shape: BoxShape.circle,
              ),
              todayDecoration: const BoxDecoration(
                color: null,
                shape: BoxShape.circle
              ),
              todayTextStyle: calendarTextStyle(MukGenColor.primaryDark1),
              defaultTextStyle: calendarTextStyle(MukGenColor.primaryDark1),
              weekendTextStyle: calendarTextStyle(MukGenColor.pointLight1),
              outsideTextStyle: calendarTextStyle(MukGenColor.primaryLight2),
              selectedTextStyle: calendarTextStyle(MukGenColor.white),
            ),
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              titleTextFormatter: (date, locale) =>
                  DateFormat.yMMMM(locale).format(date),
              titleTextStyle: TextStyle(
                color: MukGenColor.black,
                fontSize: 16.sp,
                fontFamily: 'MukgenSemiBold',
                fontWeight: FontWeight.w600,
              ),
              headerPadding: EdgeInsets.only(bottom: 16.0.h),
              leftChevronIcon: Icon(
                Icons.arrow_back_ios_new,
                size: 16.sp,
                color: MukGenColor.pointLight1,
              ),
              rightChevronIcon: Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: MukGenColor.pointLight1,
              ),
            ),
            firstDay: DateTime(2007, 8, 26),
            lastDay: DateTime(2107, 8, 26),
            focusedDay: _selectedDay,
          ),
        ),
        Positioned(
          bottom: 0.0.h,
          right: 0.0.w,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.onCancel();
                    Navigator.pop(context);
                  });
                },
                child: SizedBox(
                  height: 39.0.h,
                  width: 88.0.w,
                  child: Center(
                    child: Text(
                      '취소',
                      style: TextStyle(
                        color: MukGenColor.black,
                        fontSize: 16.sp,
                        fontFamily: 'MukgenSemiBold',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.0.w),
              GestureDetector(
                onTap: () {
                  setState(() {
                    getDateReviewInfo(formatDate(_selectedDay));
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  height: 39.0.h,
                  width: 88.0.w,
                  decoration: BoxDecoration(
                    color: MukGenColor.pointBase,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      '확인',
                      style: TextStyle(
                        color: MukGenColor.white,
                        fontSize: 16.sp,
                        fontFamily: 'MukgenSemiBold',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
