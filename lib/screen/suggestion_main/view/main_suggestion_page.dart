import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';
import 'package:mukgen_flutter_v1/screen/suggestion_main/provider/meal_suggestion_page_state.dart';
import 'package:mukgen_flutter_v1/screen/suggestion_main/provider/meal_suggestion_page_view_model_provider.dart';

class MainSuggestionPage extends ConsumerStatefulWidget {
  final VoidCallback onPosting;

  const MainSuggestionPage({Key? key, required this.onPosting})
      : super(key: key);

  @override
  ConsumerState<MainSuggestionPage> createState() => _MainSuggestionPageState();
}

class _MainSuggestionPageState extends ConsumerState<MainSuggestionPage> {
  double lengthContainer(int length) {
    Map<int, double> widthMap = {
      4: 65.0.w,
      3: 52.0.w,
      2: 46.0.w,
    };
    return widthMap[length] ?? 40.0.w;
  }

  String formatCount(int count) {
    return count >= 999 ? '999+' : '$count';
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration.zero,
        () => ref
            .watch(mealSuggestionPageViewModelProvider.notifier)
            .readAllMealSuggestion());
  }

  @override
  Widget build(BuildContext context) {
    final viewModelState = ref.watch(mealSuggestionPageViewModelProvider);
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
      body: Center(
        child: switch (viewModelState.state) {
          MealSuggestionPageStateEnum.initial ||
          MealSuggestionPageStateEnum.loading =>
            const CircularProgressIndicator(),
          MealSuggestionPageStateEnum.failure =>
            Text(viewModelState.failMessage),
          MealSuggestionPageStateEnum.success => SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10.0.h),
                  SizedBox(
                    height: 658.0.h,
                    width: double.infinity,
                    child: RefreshIndicator(
                      onRefresh: () async => ref
                          .watch(mealSuggestionPageViewModelProvider.notifier)
                          .readAllMealSuggestion(),
                      child: Center(
                        child: SizedBox(
                          width: 353.0.w,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 171.5.w,
                              mainAxisSpacing: 10.0.h,
                              crossAxisSpacing: 10.0.w,
                              childAspectRatio: 171.5.w / 150.0.h,
                            ),
                            itemCount: viewModelState.mealSuggestions.length,
                            itemBuilder: (context, index) {
                              String like = formatCount(viewModelState
                                  .mealSuggestions[index].likeCount);
                              String dislike = formatCount(viewModelState
                                  .mealSuggestions[index].dislikeCount);
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                            color: viewModelState
                                                    .mealSuggestions[index]
                                                    .checked
                                                ? MukGenColor.pointBase
                                                : MukGenColor.primaryLight1,
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
                                        viewModelState
                                            .mealSuggestions[index].content,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              width:
                                                  lengthContainer(like.length),
                                              height: 20.0.h,
                                              decoration: BoxDecoration(
                                                color: MukGenColor.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8.07.r),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.favorite_rounded,
                                                    size: 14.sp,
                                                    color:
                                                        MukGenColor.pointLight1,
                                                  ),
                                                  SizedBox(width: 4.0.w),
                                                  StatefulBuilder(
                                                    builder:
                                                        (context, likeIndex) {
                                                      return Text(
                                                        like,
                                                        style: TextStyle(
                                                          color: MukGenColor
                                                              .primaryLight1,
                                                          fontSize: 12.11.sp,
                                                          fontFamily:
                                                              'InterBold',
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
                                            onTap: () => ref
                                                .watch(
                                                    mealSuggestionPageViewModelProvider
                                                        .notifier)
                                                .addMealSuggestionDislike(
                                                    mealSuggestionId:
                                                        viewModelState
                                                            .mealSuggestions[
                                                                index]
                                                            .id),
                                            child: Container(
                                              width: lengthContainer(
                                                  dislike.length),
                                              height: 20.0.h,
                                              decoration: BoxDecoration(
                                                color: MukGenColor.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8.07.r),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.close_rounded,
                                                    size: 14.sp,
                                                    color:
                                                        MukGenColor.pointLight1,
                                                  ),
                                                  SizedBox(width: 4.0.w),
                                                  StatefulBuilder(
                                                    builder: (context,
                                                        dislikeIndex) {
                                                      return Text(
                                                        dislike,
                                                        style: TextStyle(
                                                          color: MukGenColor
                                                              .primaryLight1,
                                                          fontSize: 12.11.sp,
                                                          fontFamily:
                                                              'InterBold',
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
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        },
      ),
      floatingActionButton: SizedBox(
        width: 70.0.w,
        height: 70.0.h,
        child: FittedBox(
          child: FloatingActionButton(
            heroTag: 'addmeal-suggestion',
            onPressed: widget.onPosting,
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
