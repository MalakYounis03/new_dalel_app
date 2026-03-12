import 'package:dalel_app/app/core/app_colors.dart';
import 'package:dalel_app/app/modules/cart/views/cart_view.dart';
import 'package:dalel_app/app/modules/home/views/home_view.dart';
import 'package:dalel_app/app/modules/profile/views/profile_view.dart';
import 'package:dalel_app/app/modules/search_feature/views/search_feature_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentTabController _controller = PersistentTabController();
List<Widget> _buildScreens() {
  return [HomeView(), CartView(), SearchFeatureView(), ProfileView()];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      inactiveIcon: SvgPicture.asset(
        "assets/svg/Home.svg",
        width: 26,
        height: 26,
      ),

      icon: SvgPicture.asset(
        "assets/svg/HomeOpened.svg",
        width: 20,
        height: 20,
      ),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: SvgPicture.asset(
        "assets/svg/Cart.svg",
        width: 20,
        height: 20,
      ),
      icon: SvgPicture.asset(
        "assets/svg/CartOpened.svg",
        width: 26,
        height: 26,
      ),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: SvgPicture.asset(
        "assets/svg/Search.svg",
        width: 26,
        height: 26,
      ),
      icon: SvgPicture.asset(
        "assets/svg/SearchOpened.svg",
        width: 26,
        height: 26,
      ),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: SvgPicture.asset(
        "assets/svg/Person.svg",
        width: 26,
        height: 26,
      ),
      icon: SvgPicture.asset(
        "assets/svg/PersonOpened.svg",
        width: 26,
        height: 26,
      ),
    ),
  ];
}

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      // handleAndroidBackButtonPress: true,
      // resizeToAvoidBottomInset: true,
      // stateManagement: true,
      // hideNavigationBarWhenKeyboardAppears: true,
      backgroundColor: AppColors.primaryColor,
      // isVisible: true,

      // animationSettings: const NavBarAnimationSettings(
      //   navBarItemAnimation: ItemAnimationSettings(
      //     duration: Duration(milliseconds: 400),
      //     curve: Curves.ease,
      //   ),
      //   screenTransitionAnimation: ScreenTransitionAnimationSettings(
      //     animateTabTransition: true,
      //     duration: Duration(milliseconds: 200),
      //     screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
      //   ),
      // ),
      // confineToSafeArea: true,
      // navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style12,

      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [],
        colorBehindNavBar: Colors.white,
      ),
    );
  }
}
