import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/constant/custom_text.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';
import 'package:mukgen_flutter_v1/core/component/text/pretendard.dart';
import 'package:mukgen_flutter_v1/screen/widget/comment_icon.dart';
import 'package:mukgen_flutter_v1/screen/widget/custom_icons.dart';
import 'package:mukgen_flutter_v1/screen/widget/show_detail_widget.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.9);

  List<String> foodImage = ['BREAKFAST.png', 'LUNCH.png', 'DINNER.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(59.h),
        child: AppBar(
          backgroundColor: MukGenColor.white,
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/logo/mukgen2.png',
                height: 32.h,
                width: 104.w,
                fit: BoxFit.contain,
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.person,
                  size: 24.sp,
                  color: MukGenColor.primaryLight2,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 20.w),
            child: Subtitle(
              customText: CustomText(
                text: '오늘의 급식',
                color: MukGenColor.black,
              ),
            ),
          ),
          SizedBox(
            height: 220.h,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: PageView.builder(
                pageSnapping: true,
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Center(
                    child: Container(
                      margin: EdgeInsets.only(right: index != 2 ? 10.w : 0.w),
                      height: 220.h,
                      width: 353.w,
                      decoration: BoxDecoration(
                        color: MukGenColor.primaryLight3,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 100.w,
                              height: 172.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BodyLarge2(
                                    customText: CustomText(
                                      text: '아침',
                                      color: MukGenColor.pointBase,
                                    ),
                                  ),
                                  SizedBox(height: 24.h),
                                  Image.asset(
                                    'assets/images/meal/${foodImage[index]}',
                                    width: 64.w,
                                    height: 64.h,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 172.h,
                              width: 181.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(5, (index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 6.h),
                                    child: Body2(
                                      customText: CustomText(
                                        text: '밥/카레소스',
                                        color: MukGenColor.black,
                                        textOverflow: TextOverflow.clip,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20.h),
                width: 353.w,
                height: 69.h,
                decoration: BoxDecoration(
                  color: MukGenColor.pointLight4,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Subtitle(
                                customText: CustomText(
                                  text: 'PICK',
                                  color: MukGenColor.pointBase,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Image.asset(
                                'assets/images/icon/gpt.png',
                                width: 20.w,
                                height: 20.h,
                              ),
                            ],
                          ),
                          Body(
                            customText: CustomText(
                              text: 'GPT가 골라주는 급식',
                              color: MukGenColor.pointBase,
                            ),
                          ),
                        ],
                      ),
                      tTitle(
                        customText: CustomText(
                          text: '5월 10일',
                          color: MukGenColor.pointBase,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Subtitle(
                  customText: CustomText(
                    text: '인기글',
                    color: MukGenColor.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Body2(
                    customText: CustomText(
                      text: '더보기',
                      color: MukGenColor.pointLight1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              width: 353.w,
              height: 163.h,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: index != 2 ? 8.h : 0.h),
                    width: 353.w,
                    height: 49.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: MukGenColor.primaryLight3,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 191.w,
                            height: 17.h,
                            child: Body2(
                              customText: CustomText(
                                text: '여기에 쓸 거 10분동안 고민함 이거 뭐써야됨?',
                                color: MukGenColor.black,
                                textOverflow: TextOverflow.ellipsis
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ShowDetailWidget(
                                text: '5',
                                type: IconType.comment,
                              ),
                              SizedBox(width: 8.w),
                              ShowDetailWidget(
                                text: '999+',
                                type: IconType.view,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mukgen_flutter_v1/common/mukgen_color.dart';
// import 'package:mukgen_flutter_v1/model/board/hot_board.dart';
// import 'package:mukgen_flutter_v1/model/meal/mukgen_pick.dart';
// import 'package:mukgen_flutter_v1/model/meal/today_meal_data_source.dart';
//
// class MainHomePage extends StatefulWidget {
//   const MainHomePage({Key? key, required this.onDetail, required this.onMyPage})
//       : super(key: key);
//
//   final Function(int) onDetail;
//   final VoidCallback onMyPage;
//
//   @override
//   State<MainHomePage> createState() => _MainHomePageState();
// }
//
// class _MainHomePageState extends State<MainHomePage> {
//   final PageController pageController =
//       PageController(initialPage: 0, viewportFraction: 0.9);
//
//   int boardId = 0;
//
//   List<String> foodImage = ['BREAKFAST.png', 'LUNCH.png', 'DINNER.png'];
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MukGenColor.white,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SizedBox(height: 50.0.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 padding: EdgeInsets.only(left: 20.0.w),
//                 child: Image(
//                   image: const AssetImage('assets/images/mukgen2.png'),
//                   width: 104.0.w,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(right: 21.5.w),
//                 child: GestureDetector(
//                   onTap: () {
//                     widget.onMyPage();
//                   },
//                   child: Icon(
//                     Icons.person,
//                     size: 28.sp,
//                     color: MukGenColor.primaryLight2,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 32.0.h),
//           Container(
//             alignment: Alignment.topLeft,
//             padding: EdgeInsets.only(left: 20.0.w),
//             child: Text(
//               '오늘의 급식',
//               style: TextStyle(
//                   fontSize: 20.0.sp,
//                   fontWeight: FontWeight.w600,
//                   fontFamily: 'MukgenSemiBold'),
//             ),
//           ),
//           SizedBox(height: 12.0.w),
//           Expanded(
//             child: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
//               if (state is Loading) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (state is Error) {
//                 return Center(child: Text(state.message));
//               } else if (state is Loaded) {
//                 return PageView.builder(
//                   pageSnapping: true,
//                   controller: pageController,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: state.todayMeal!.responseList!.length,
//                   itemBuilder: (context, index) {
//                     final itemList = _parseItemList(
//                         state.todayMeal!.responseList![index].items.toString());
//                     return Center(
//                       child: Container(
//                         margin: EdgeInsets.only(right: 10.0.w),
//                         alignment: Alignment.center,
//                         width: 353.0.w,
//                         height: 220.0.h,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: MukGenColor.primaryLight3,
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.all(24.0.r),
//                           child: Row(
//                             children: [
//                               SizedBox(
//                                 width: 100.0.w,
//                                 height: 172.0.h,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       state.todayMeal!.responseList![index]
//                                           .riceType
//                                           .toString(),
//                                       style: TextStyle(
//                                         color: MukGenColor.pointBase,
//                                         fontFamily: 'MukgenSemiBold',
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 16.sp,
//                                       ),
//                                     ),
//                                     SizedBox(height: 24.0.h),
//                                     Image(
//                                       image: AssetImage(
//                                         "assets/images/${foodImage[index]}",
//                                       ),
//                                       width: 64.0.r,
//                                       height: 64.0.r,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(width: 24.0.w),
//                               SizedBox(
//                                 width: 170.0.w,
//                                 height: 170.0.h,
//                                 child: ListView.builder(
//                                   itemCount: state.todayMeal!
//                                       .responseList![index].items!.length,
//                                   itemBuilder: (context, itemIndex) {
//                                     return Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           itemList[itemIndex],
//                                           style: TextStyle(
//                                             fontSize: 14.0.sp,
//                                             fontFamily: 'MukgenRegular',
//                                             fontWeight: FontWeight.w400,
//                                             height: 1.6.h,
//                                           ),
//                                         ),
//                                       ],
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               } else {
//                 return const Center(child: CircularProgressIndicator());
//               }
//             }),
//           ),
//           SizedBox(height: 32.0.h),
//           InkWell(
//               int ? month = state.mukGenPick!.month;
//               int? day = state.mukGenPick!.day;
//             onTap: () {},
//             child: Container(
//               alignment: Alignment.center,
//               width: 353.0.w,
//               height: 69.0.h,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: MukGenColor.primaryLight3,
//                 border: Border.all(
//                   color: MukGenColor.pointLight4,
//                   width: 2.0.w,
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: 24.0.w),
//                     child: SizedBox(
//                       width: 139.5.w,
//                       height: 42.0.h,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'PICK',
//                               style: TextStyle(
//                                 color: MukGenColor.pointBase,
//                                 fontWeight: FontWeight.w600,
//                                 fontFamily: 'MukgenSemiBold',
//                                 fontSize: 16.sp,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 4.0.h),
//                           Container(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               '맛있을 거 같은 급식의 날',
//                               style: TextStyle(
//                                 color: MukGenColor.pointBase,
//                                 fontSize: 12.sp,
//                                 fontFamily: 'MukgenRegular',
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 65.0.w),
//                   Text(
//                     '$month월 $day일',
//                     style: TextStyle(
//                       color: MukGenColor.pointBase,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: 'MukgenSemiBold',
//                       fontSize: 24.sp,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 32.0.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 padding: EdgeInsets.only(left: 20.0.w),
//                 child: Text(
//                   '인기글',
//                   style: TextStyle(
//                       fontSize: 20.0.sp,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: 'MukgenSemiBold'),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: Padding(
//                   padding: EdgeInsets.only(right: 20.0.w),
//                   child: Text(
//                     '더보기',
//                     style: TextStyle(
//                       fontSize: 14.0.sp,
//                       fontWeight: FontWeight.w400,
//                       fontFamily: 'MukgenRegular',
//                       color: MukGenColor.pointLight1,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 12.0.h),
//           Expanded(
//             child: BlocBuilder<MainBloc, MainState>(
//               builder: (context, state) {
//                 if (state is Loading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state is Error) {
//                   return Center(child: Text(state.message));
//                 } else if (state is Loaded) {
//                   return SizedBox(
//                     height: 163.0.h,
//                     width: 353.0.w,
//                     child: ListView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       padding: EdgeInsets.zero,
//                       itemCount:
//                           state.hotBoard!.boardPopularResponseList!.length,
//                       itemBuilder: (context, index) {
//                         return Column(
//                           children: [
//                             StatefulBuilder(
//                               builder: (context, hotIndex) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       boardId = state
//                                           .hotBoard!
//                                           .boardPopularResponseList![index]
//                                           .boardId!
//                                           .toInt();
//                                       widget.onDetail(boardId);
//                                     });
//                                   },
//                                   child: Container(
//                                     alignment: Alignment.center,
//                                     padding: EdgeInsets.only(left: 16.0.w),
//                                     width: 353.0.w,
//                                     height: 49.0.h,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: MukGenColor.primaryLight3,
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         SizedBox(
//                                           height: 17.0.h,
//                                           width: 209.0.w,
//                                           child: Text(
//                                             state
//                                                 .hotBoard!
//                                                 .boardPopularResponseList![
//                                                     index]
//                                                 .title
//                                                 .toString(),
//                                             overflow: TextOverflow.ellipsis,
//                                             style: TextStyle(
//                                               color: MukGenColor.black,
//                                               fontSize: 14.sp,
//                                               fontFamily: 'MukgenRegular',
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(width: 12.0.w),
//                                         Container(
//                                           padding: EdgeInsets.only(top: 2.0.h),
//                                           child: Icon(
//                                             CommentIcon.commentCount,
//                                             size: 14.sp,
//                                             color: MukGenColor.primaryLight2,
//                                           ),
//                                         ),
//                                         SizedBox(width: 4.0.w),
//                                         SizedBox(
//                                           width: 26.0.w,
//                                           child: Text(
//                                             state
//                                                 .hotBoard!
//                                                 .boardPopularResponseList![
//                                                     index]
//                                                 .commentCount
//                                                 .toString(),
//                                             style: TextStyle(
//                                               fontFamily: 'MukgenRegular',
//                                               fontSize: 14.sp,
//                                               fontWeight: FontWeight.w400,
//                                               color: MukGenColor.primaryLight2,
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(width: 8.0.w),
//                                         Icon(
//                                           Icons.remove_red_eye_rounded,
//                                           size: 18.sp,
//                                           color: MukGenColor.primaryLight2,
//                                         ),
//                                         SizedBox(width: 4.0.w),
//                                         SizedBox(
//                                           width: 26.0.w,
//                                           child: Text(
//                                             state
//                                                 .hotBoard!
//                                                 .boardPopularResponseList![
//                                                     index]
//                                                 .viewCount
//                                                 .toString(),
//                                             style: TextStyle(
//                                               fontFamily: 'MukgenRegular',
//                                               fontSize: 14.sp,
//                                               fontWeight: FontWeight.w400,
//                                               color: MukGenColor.primaryLight2,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                             SizedBox(height: 8.0.h),
//                           ],
//                         );
//                       },
//                     ),
//                   );
//                 } else {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//               },
//             ),
//           ),
//           SizedBox(height: 8.0.h),
//         ],
//       ),
//     );
//   }
// }
//
// List<String> _parseItemList(String itemData) {
//   final itemListString = itemData.substring(1, itemData.length - 1);
//   return itemListString.split(', ');
// }
