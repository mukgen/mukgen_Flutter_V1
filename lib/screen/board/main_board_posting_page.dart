import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/service/post/board/post_board_info.dart';

class MainBoardPostingPage extends StatefulWidget {
  const MainBoardPostingPage({Key? key}) : super(key: key);

  @override
  State<MainBoardPostingPage> createState() => _MainBoardPostingPageState();
}

class _MainBoardPostingPageState extends State<MainBoardPostingPage> {
  bool _isButtonEnabled = false;

  late TextEditingController titleController;
  late TextEditingController contentController;
  late int titleCharacterCount;
  late int contentCharacterCount;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
    titleController.addListener(_updateButtonState);
    contentController.addListener(_updateButtonState);
    titleCharacterCount = 0;
    contentCharacterCount = 0;
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = titleController.text.isNotEmpty && contentController.text.isNotEmpty;
      titleCharacterCount = titleController.text.length;
      contentCharacterCount = contentController.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 61.0.h,
        backgroundColor: MukGenColor.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: MukGenColor.black,
          ),
          iconSize: 24.sp,
          onPressed: () {
            Navigator.of(context).pop();
          },
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
                    if(titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
                      postBoard(titleController.text, contentController.text);
                      Navigator.of(context).pop();
                    }
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
      backgroundColor: MukGenColor.white,
      body: Column(
        children: [
          SizedBox(height: 20.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0.w),
                child: Text(
                  '제목',
                  style: TextStyle(
                    color: MukGenColor.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'MukgenSemiBold',
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0.h,
          ),
          Center(
            child: Container(
              width: 352.0.w,
              height: 56.0.h,
              decoration: BoxDecoration(
                color: MukGenColor.primaryLight3,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0.w),
                  child: TextFormField(
                    onChanged: (value) => setState(() {}),
                    controller: titleController,
                    maxLength: 60,
                    style: TextStyle(
                      color: MukGenColor.black,
                      fontSize: 20.sp,
                      fontFamily: 'MukgenSemiBold',
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: '제목을 입력해주세요',
                      hintStyle: TextStyle(
                        color: MukGenColor.primaryLight2,
                        fontSize: 20.sp,
                        fontFamily: 'MukgenSemiBold',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.0.h, right: 20.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '$titleCharacterCount/60',
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
          Padding(
            padding: EdgeInsets.only(left: 20.0.w, top: 20.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '내용',
                  style: TextStyle(
                    color: MukGenColor.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'MukgenSemiBold',
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0.h,
          ),
          Center(
            child: Container(
              width: 352.0.w,
              height: 496.0.h,
              decoration: BoxDecoration(
                color: MukGenColor.primaryLight3,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 16.0.w, top: 5.0.h),
                child: TextFormField(
                  onChanged: (value) => setState(() {}),
                  controller: contentController,
                  maxLength: 300,
                  maxLines: 30, // 정해진 줄은 없지만 30줄은 안 넘을 거 같아서 30줄로 설정할게요.
                  style: TextStyle(
                    color: MukGenColor.black,
                    fontSize: 20.sp,
                    fontFamily: 'MukgenSemiBold',
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    hintText: '내용을 입력해주세요',
                    hintStyle: TextStyle(
                      color: MukGenColor.primaryLight2,
                      fontSize: 20.sp,
                      fontFamily: 'MukgenSemiBold',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.0.h, right: 20.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '$contentCharacterCount/300',
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
