import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/widget/custom_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/screen/main_page.dart';
import 'package:mukgen_flutter_v1/screen/main_board.dart';
import 'package:mukgen_flutter_v1/screen/main_delivery_party.dart';
import 'package:mukgen_flutter_v1/screen/main_review.dart';
import 'package:mukgen_flutter_v1/screen/main_suggestion.dart';

class MainNavigatorApp extends StatefulWidget {
  const MainNavigatorApp({Key? key}) : super(key: key);

  @override
  State<MainNavigatorApp> createState() => _MainNavigatorAppState();
}

class _MainNavigatorAppState extends State<MainNavigatorApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MainHomePage(),
    const MainBoardPage(),
    const MainSuggestionPage(),
    const MainReviewPage(),
    const MainDeliveryPartyPage(),
  ];

  final PageController _pageController = PageController(initialPage: 0);

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
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
          onTap: _onItemTapped,
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
    );
  }
}
