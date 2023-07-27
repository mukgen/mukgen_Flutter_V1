import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/model/suggestion/total_suggestion.dart';
import 'package:mukgen_flutter_v1/service/get/suggestion/get_total_suggestion_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/service/post/suggestion/post_dislike_suggestion_info.dart';
import 'package:mukgen_flutter_v1/service/post/suggestion/post_like_suggestion_info.dart';

class MainSuggestionPage extends StatefulWidget {
  const MainSuggestionPage({Key? key, required this.onPosting}) : super(key: key);

  final VoidCallback onPosting;

  @override
  State<MainSuggestionPage> createState() => _MainSuggestionPageState();
}

class _MainSuggestionPageState extends State<MainSuggestionPage> {
  Future<TotalSuggestion>? totalSuggestion;

  @override
  Widget build(BuildContext context) {
    totalSuggestion = getTotalSuggestionInfo();
    return Scaffold(
      backgroundColor: MukGenColor.white,
      appBar: AppBar(
        backgroundColor: MukGenColor.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '급식 건의',
          style: TextStyle(
            color: MukGenColor.primaryLight1,
            fontSize: 20.sp,
            fontFamily: 'MukGenSemiBold',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70.0.w,
        height: 70.0.h,
        child: FittedBox(
          child: FloatingActionButton(
            heroTag: 'addmeal-suggestion',
            onPressed: () {
              widget.onPosting();
            },
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
