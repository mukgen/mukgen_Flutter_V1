import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';
import 'package:mukgen_flutter_v1/screen/board_detail/view/main_board_detail_page.dart';
import 'package:mukgen_flutter_v1/screen/board_main/view/main_board_page.dart';
import 'package:mukgen_flutter_v1/screen/board_posting/view/main_board_posting_page.dart';
import 'package:mukgen_flutter_v1/screen/delivery_main/view/main_delivery_party_page.dart';
import 'package:mukgen_flutter_v1/screen/delivery_posting/view/delivery_what_food_page.dart';
import 'package:mukgen_flutter_v1/screen/main/view/main_page.dart';
import 'package:mukgen_flutter_v1/screen/mypage/view/my_page.dart';
import 'package:mukgen_flutter_v1/screen/review_detail/view/main_review_detail_page.dart';
import 'package:mukgen_flutter_v1/screen/review_main/view/main_review_page.dart';
import 'package:mukgen_flutter_v1/screen/review_select/view/main_review_select_page.dart';
import 'package:mukgen_flutter_v1/screen/suggestion_main/view/main_suggestion_page.dart';
import 'package:mukgen_flutter_v1/screen/suggestion_posting/view/main_suggestion_posting_page.dart';
import 'package:mukgen_flutter_v1/screen/widget/custom_icons.dart';
import 'package:transition/transition.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState!.maybePop();
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            _buildOffstageNavigator(3),
            _buildOffstageNavigator(4),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 100.0.h,
          child: BottomNavigationBar(
            backgroundColor: MukGenColor.white,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.home),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.board),
                label: '게시판',
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.vector),
                label: '급식 건의',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: '급식 리뷰',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(Icons.groups),
                  ],
                ),
                label: '배달 파티',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            unselectedLabelStyle: TextStyle(
              color: MukGenColor.primaryLight2,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              fontFamily: 'MukgenSemiBold',
            ),
            selectedLabelStyle: TextStyle(
              color: MukGenColor.pointBase,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              fontFamily: 'MukgenSemiBold',
            ),
            selectedItemColor: MukGenColor.pointBase,
            unselectedItemColor: MukGenColor.primaryLight2,
            iconSize: 30.sp,
            elevation: 0,
          ),
        ),
      ),
    );
  }

  void onNext(Widget page) {
    Navigator.push(
      context,
      Transition(
        child: page,
        transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          MainHomePage(
            onMyPage: () {
              onNext(const MyPage());
            },
            onDetail: (int boardId) {
              onNext(MainBoardDetailPage(
                boardId: boardId,
                query: "total",
              ));
            },
          ),
          MainBoardPage(
            onPosting: (String query) {
              onNext(MainBoardPostingPage(query: query));
            },
            onDetail: (int boardId, String query) {
              onNext(MainBoardDetailPage(boardId: boardId, query: query));
            },
          ),
          MainSuggestionPage(
            onPosting: () {
              onNext(const MainSuggestionPostingPage());
            },
          ),
          MainReviewPage(
            onReview: () {
              onNext(const MainReviewSelectPage());
            },
            onDetail: (String riceType, int reviewId) {
              onNext(
                MainReviewDetailPage(
                  riceType: riceType,
                  reviewId: reviewId,
                ),
              );
            },
            onMyPage: () {
              onNext(const MyPage());
            },
          ),
          MainDeliveryPartyPage(onFood: () {
            onNext(const DeliveryWhatFoodPage());
          }),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
