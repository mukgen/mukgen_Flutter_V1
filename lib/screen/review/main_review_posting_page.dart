import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/service/post/review/post_review_info.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';

class MainReviewPostingPage extends StatefulWidget {
  const MainReviewPostingPage({Key? key, required this.riceId, required this.riceType}) : super(key: key);

  final int? riceId;
  final String? riceType;

  @override
  State<MainReviewPostingPage> createState() => _MainReviewPostingPageState();
}

class _MainReviewPostingPageState extends State<MainReviewPostingPage> {
  final String now = DateTime.now().toString();
  String formattedDate = DateFormat('MM월 dd일').format(DateTime.now());

  int starIndex = 0;

  late TextEditingController reviewController;

  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    reviewController = TextEditingController();
    reviewController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    super.dispose();
    reviewController.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = reviewController.text.isNotEmpty;
    });
  }

  Widget _starChange (int index){
    return GestureDetector(
      onTap: () {
        setState(() {
          starIndex = index;
        });
      },
      child: starIndex >= index ? Image(
        image: AssetImage(
          'assets/images/Star.png',
        ),
        width: 48.0.w,
        height: 48.0.h,
      ) : Image(
        image: AssetImage(
          'assets/images/Star_outlined.png',
        ),
        width: 48.0.w,
        height: 48.0.h,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      appBar: AppBar(
        backgroundColor: MukGenColor.white,
        elevation: 0,
        centerTitle: true,
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
          '급식 리뷰 작성',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'MukgenSemibold',
            fontSize: 20.sp,
            color: MukGenColor.primaryLight1,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 24.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formattedDate,
                style: TextStyle(
                  color: MukGenColor.primaryDark1,
                  fontSize: 20.sp,
                  fontFamily: 'MukgenSemibold',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 10.0.w),
              Text(
                widget.riceType.toString(),
                style: TextStyle(
                  color: MukGenColor.pointLight1,
                  fontSize: 20.sp,
                  fontFamily: 'MukgenSemibold',
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _starChange(1),
              _starChange(2),
              _starChange(3),
              _starChange(4),
              _starChange(5),
            ],
          ),
          SizedBox(height: 16.0.h),
          Container(
            width: 353.0.w,
            height: 200.0.h,
            decoration: BoxDecoration(
                color: MukGenColor.primaryLight3,
                borderRadius: BorderRadius.circular(10)
            ),
            child: TextFormField(
              controller: reviewController,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                color: MukGenColor.black,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 16.0.w, top: 16.0.h),
                hintText : '내용을 입력해주세요.',
                hintStyle: TextStyle(
                  color: MukGenColor.primaryLight2,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  fontFamily: 'MukgenSemiBold',
                ),
                border: InputBorder.none,

              ),
              maxLines: null,
              maxLength: 100,
            ),
          ),
          SizedBox(height: 17.0.h),
          Row(
            children: [
              SizedBox(width: 20.0.w),
              SizedBox(
                width: 80.0.w,
                height: 80.0.h,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: MukGenColor.primaryLight3,
                      width: 3.0.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: (){

                  },
                  child: Icon(
                    Icons.add,
                    color: MukGenColor.primaryLight2,
                    size: 32.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0.h),
          Container(
            height: 95.0.h,
            width: 353.0.w,
            decoration: BoxDecoration(
              color: MukGenColor.primaryLight3,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SizedBox(width: 20.0.w),
                Text(
                  '건의하고 싶은\n내용이 있다면',
                  style: TextStyle(
                      color: MukGenColor.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: 'MukgenSemiBold'
                  ),
                ),
                Container(
                    height: 55.0.h,
                    width: 108.0.w,
                    margin: EdgeInsets.only(left: 118.0.w),
                    decoration: BoxDecoration(
                      color: MukGenColor.pointBase,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: (){

                      },
                      child: Text(
                        '급식 건의',
                        style: TextStyle(
                          color: MukGenColor.white,
                          fontFamily: 'MukgenSemiBold',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                )
              ],
            ),
          ),
          const Spacer(),
          MukGenButton(
            width: 352,
            height: 55,
            text: "등록",
            backgroundColor: _isButtonEnabled
                ? MukGenColor.pointBase
                : MukGenColor.primaryLight2,
            textColor: MukGenColor.white,
            fontSize: 16.sp,
            onPressed: () {
              print('yes');
              postReviewInfo(starIndex, reviewController.text, widget.riceId!);
            },
          ),
          SizedBox(height: 20.0.h),
        ],
      ),
    );
  }
}