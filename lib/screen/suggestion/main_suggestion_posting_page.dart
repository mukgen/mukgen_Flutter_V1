import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/service/post/review/post_review_info.dart';
import 'package:mukgen_flutter_v1/service/post/suggestion/post_suggestion_info.dart';

class MainSuggestionPostingPage extends StatefulWidget {
  const MainSuggestionPostingPage({Key? key}) : super(key: key);

  @override
  State<MainSuggestionPostingPage> createState() => _MainSuggestionPostingPageState();
}

class _MainSuggestionPostingPageState extends State<MainSuggestionPostingPage> {
  bool _isButtonEnabled = false;

  final FocusNode _focusNode = FocusNode();

  late TextEditingController contentController;
  late int contentCharacterCount;

  @override
  void initState() {
    super.initState();
    contentController = TextEditingController();
    contentController.addListener(_updateButtonState);
    contentCharacterCount = 0;
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    contentController.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = contentController.text.isNotEmpty;
      contentCharacterCount = contentController.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      appBar: AppBar(
        toolbarHeight: 61.0.h,
        backgroundColor: MukGenColor.white,
        centerTitle: true,
        elevation: 0,
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
                  postSuggestionInfo(contentController.text);
                  Navigator.of(context).popUntil((route) => route.isFirst || route.settings.name == '/MainSuggestionPage');
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
      body: Column(
        children: [
          SizedBox(height: 8.0.h),
          Center(
            child: Container(
              width: 353.0.w,
              height: 261.0.h,
              decoration: BoxDecoration(
                color: MukGenColor.postIt1,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: _focusNode.hasFocus ? MukGenColor.pointLight3 : MukGenColor.postIt1,
                  width: 2.0.w
                )
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.0.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'ㅇㅇ',
                        style: TextStyle(
                          color: MukGenColor.primaryLight1,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'MukgenSemiBold',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4.0.h),
                  SizedBox(
                    width: 313.0.w,
                    height: 200.0.h,
                    child: TextFormField(
                      focusNode: _focusNode,
                      onChanged: (value) => setState(() {}),
                      controller: contentController,
                      maxLength: 60,
                      maxLines: 10,
                      style: TextStyle(
                        color: MukGenColor.black,
                        fontSize: 20.sp,
                        fontFamily: 'MukgenSemiBold',
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: '',
                        hintText: '내용을 입력해주세요',
                        hintStyle: TextStyle(
                          color: MukGenColor.pointLight3,
                          fontSize: 20.sp,
                          fontFamily: 'MukgenSemiBold',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.0.h, right: 20.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '$contentCharacterCount/60',
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
        ],
      ),
    );
  }
}
