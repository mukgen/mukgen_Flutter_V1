import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/service/post/review/post_review_info.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';
import 'package:mukgen_flutter_v1/widget/review/review_posting_image.dart';

class MainReviewPostingPage extends StatefulWidget {
  const MainReviewPostingPage(
      {Key? key, required this.riceId, required this.riceType})
      : super(key: key);

  final int? riceId;
  final String? riceType;

  @override
  State<MainReviewPostingPage> createState() => _MainReviewPostingPageState();
}

class _MainReviewPostingPageState extends State<MainReviewPostingPage> {
  final String now = DateTime.now().toString();
  String formattedDate = DateFormat('MM월 dd일').format(DateTime.now());

  final FocusNode _focusNode = FocusNode();

  int starIndex = 0;

  late TextEditingController reviewController;
  late int reviewCharacterCount;

  bool _isButtonEnabled = false;

  Future<XFile?> _pickImage(ImageSource imageSource) async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile == null) {
      return ReviewPostingImage.image = null;
    } else {
      setState(() {
        ReviewPostingImage.image = pickedFile;
      });
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    reviewController = TextEditingController();
    reviewController.addListener(_updateButtonState);
    reviewCharacterCount = 0;
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    reviewController.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = reviewController.text.isNotEmpty && starIndex != 0;
      reviewCharacterCount = reviewController.text.length;
    });
  }

  Widget _starChange(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          starIndex = index;
          _updateButtonState();
        });
      },
      child: Image(
        color: starIndex >= index
            ? MukGenColor.pointLight1
            : MukGenColor.primaryLight2,
        image: const AssetImage(
          'assets/images/Star.png',
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
              Navigator.of(context).pop();
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
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: _focusNode.hasFocus
                      ? MukGenColor.pointBase
                      : MukGenColor.primaryLight3,
                  width: 2.0.w),
            ),
            child: TextFormField(
              focusNode: _focusNode,
              controller: reviewController,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                color: MukGenColor.black,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 16.0.w, top: 16.0.h),
                counterText: '',
                hintText: '내용을 입력해주세요.',
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
          Padding(
            padding: EdgeInsets.only(top: 4.0.h, right: 20.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '$reviewCharacterCount/100',
                  style: TextStyle(
                    color: MukGenColor.primaryLight2,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'MukgenRegular',
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0.h),
          SizedBox(
            width: 353.0.w,
            height: 24.0.h,
            child: Row(
              children: [
                Text(
                  '사진',
                  style: TextStyle(
                    color: MukGenColor.black,
                    fontSize: 20.sp,
                    fontFamily: 'MukgenSemiBold',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 6.0.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '최대 1장',
                      style: TextStyle(
                        color: MukGenColor.primaryLight2,
                        fontSize: 14.sp,
                        fontFamily: 'MukgenSemiBold',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0.h),
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
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 100.0.h,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _pickImage(ImageSource.camera);
                                  },
                                  child: Container(
                                    color: MukGenColor.pointLight1,
                                    height: 50.h,
                                    width: 70.0.w,
                                    child: const Center(
                                      child: Text(
                                        '카메라',
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _pickImage(ImageSource.gallery);
                                  },
                                  child: Container(
                                    color: MukGenColor.pointLight1,
                                    height: 50.h,
                                    width: 70.0.w,
                                    child: const Center(
                                      child: Text(
                                        '갤러리',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Icon(
                    Icons.add,
                    color: MukGenColor.primaryLight2,
                    size: 32.sp,
                  ),
                ),
              ),
              SizedBox(width: 10.0.w),
              if (ReviewPostingImage.image != null)
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 80.0.w,
                      height: 80.0.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(File(ReviewPostingImage.image!.path)),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -7.0.h,
                      right: -7.0.w,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            ReviewPostingImage.image = null;
                          });
                        },
                        child: Container(
                          width: 24.0.w,
                          height: 24.0.h,
                          decoration: BoxDecoration(
                            color: MukGenColor.primaryLight2,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.close,
                              color: MukGenColor.white,
                              size: 15.sp,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
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
                      fontFamily: 'MukgenSemiBold'),
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
                      onPressed: () {},
                      child: Text(
                        '급식 건의',
                        style: TextStyle(
                          color: MukGenColor.white,
                          fontFamily: 'MukgenSemiBold',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ))
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
              postReviewInfo(starIndex, reviewController.text, widget.riceId!);
              Navigator.of(context).popUntil((route) =>
                  route.isFirst || route.settings.name == '/MainReviewPage');
            },
          ),
          SizedBox(height: 20.0.h),
        ],
      ),
    );
  }
}
