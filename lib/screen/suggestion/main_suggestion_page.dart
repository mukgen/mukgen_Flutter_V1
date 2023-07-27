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
                                String formatCount(int count) {
                                  String countString = '';
                                  if (count >= 999) {
                                    countString = '999+';
                                  }
                                  return countString;
                                }

                                String likeCounts = snapshot.data!.mealSuggestionResponseList![index].likeCount.toString();
                                String like = formatCount(int.parse(likeCounts));

                                String dislikeCounts = snapshot.data!.mealSuggestionResponseList![index].dislikeCount.toString();
                                String dislike = formatCount(int.parse(dislikeCounts));
                                return Container(
                                  decoration: BoxDecoration(
                                    color: MukGenColor.postIt1,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 12.0.h),
                                      SizedBox(
                                        width: 139.5.w,
                                        height: 24.0.h,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'ㅇㅇ',
                                              style: TextStyle(
                                                color: MukGenColor.primaryLight1,
                                                fontSize: 14.sp,
                                                fontFamily: 'MukgenSemiBold',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Icon(
                                              Icons.check_circle_rounded,
                                              color: snapshot.data!.mealSuggestionResponseList![index].checked! ? MukGenColor.pointBase : MukGenColor.primaryLight1,
                                              size: 24.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 6.0.h),
                                      SizedBox(
                                        width: 139.5.w,
                                        height: 70.0.h,
                                        child: Text(
                                          snapshot.data!.mealSuggestionResponseList![index].content!.toString(),
                                          style: TextStyle(
                                            color: MukGenColor.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'MukgenRegular',
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 6.0.h),
                                      SizedBox(
                                        width: 140.0.w,
                                        height: 20.0.h,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  postLikeSuggestionInfo(snapshot.data!.mealSuggestionResponseList![index].id!);
                                                });
                                              },
                                              child: Container(
                                                width: like.length == 4 ? 65.0.w : like.length == 3 ? 52 : like.length == 2 ? 46.0.w : 40.0.w,
                                                height: 20.0.h,
                                                decoration: BoxDecoration(
                                                  color: MukGenColor.white,
                                                  borderRadius: BorderRadius.circular(8.07.r),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.favorite_rounded,
                                                      size: 14.sp,
                                                      color: MukGenColor.pointLight1,
                                                    ),
                                                    SizedBox(width: 4.0.w),
                                                    StatefulBuilder(
                                                      builder: (context, likeIndex) {
                                                        return Text(
                                                          like.toString(),
                                                          style: TextStyle(
                                                            color: MukGenColor.primaryLight1,
                                                            fontSize: 12.11.sp,
                                                            fontFamily: 'InterBold',
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 4.0.w),
                                            GestureDetector(
                                              onTap: () {
                                                postDislikeSuggestionInfo(snapshot.data!.mealSuggestionResponseList![index].id!);
                                              },
                                              child: Container(
                                                width: dislike.length == 4 ? 65.0.w : dislike.length == 3 ? 52 : dislike.length == 2 ? 46.0.w : 40.0.w,
                                                height: 20.0.h,
                                                decoration: BoxDecoration(
                                                  color: MukGenColor.white,
                                                  borderRadius: BorderRadius.circular(8.07.r),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.close_rounded,
                                                      size: 14.sp,
                                                      color: MukGenColor.pointLight1,
                                                    ),
                                                    SizedBox(width: 4.0.w),
                                                    StatefulBuilder(
                                                      builder: (context,dislikeIndex) {
                                                        return Text(
                                                          dislike.toString(),
                                                          style: TextStyle(
                                                            color: MukGenColor.primaryLight1,
                                                            fontSize: 12.11.sp,
                                                            fontFamily: 'InterBold',
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
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
