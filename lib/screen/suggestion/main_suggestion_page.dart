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
            SizedBox(height: 10.0.h),
            SizedBox(
              height: 658.0.h,
              width: double.infinity,
              child: RefreshIndicator(
                onRefresh: () async {
                  setState(() {
                    totalSuggestion = getTotalSuggestionInfo();
                  });
                },
                child: FutureBuilder(
                  future: totalSuggestion,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 353.0.w,
                          child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 171.5.w,
                                mainAxisSpacing: 10.0.h,
                                crossAxisSpacing: 10.0.w,
                                childAspectRatio: 171.5.w / 150.0.h,
                              ),
                              itemCount: snapshot.data!.mealSuggestionResponseList!.length,
                              itemBuilder: (context, index) {
                                
                              }
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
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
