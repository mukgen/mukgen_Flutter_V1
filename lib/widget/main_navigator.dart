import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/main_review_otherdays.dart';
import 'package:mukgen_flutter_v1/widget/custom_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/screen/main_page.dart';
import 'package:mukgen_flutter_v1/screen/main_board.dart';
import 'package:mukgen_flutter_v1/screen/main_delivery_party.dart';
import 'package:mukgen_flutter_v1/screen/main_review.dart';
import 'package:mukgen_flutter_v1/screen/main_suggestion.dart';
import 'package:flutter/widgets.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
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

        print(
            'isFirstRouteInCurrentTab: ' + isFirstRouteInCurrentTab.toString());

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
          height: 86.0.h,
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
              fontSize: 14,
              fontFamily: 'MukgenSemiBold',
            ),
            selectedLabelStyle: TextStyle(
              color: MukGenColor.pointBase,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: 'MukgenSemiBold',
            ),
            selectedItemColor: MukGenColor.pointBase,
            unselectedItemColor: MukGenColor.primaryLight2,
            iconSize: 30,
            elevation: 0,
          ),
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          const MainHomePage(),
          const MainBoardPage(),
          const MainSuggestionPage(),
          const MainReviewPage(),
          const MainDeliveryPartyPage(),
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
