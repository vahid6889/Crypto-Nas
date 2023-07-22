import 'package:crypto_nas/core/presentation/widgets/bottom_nav.dart';
import 'package:crypto_nas/features/feature_exchange/presentation/screens/exchange_page.dart';
import 'package:crypto_nas/features/feature_home/presentation/screens/home_page.dart';
import 'package:crypto_nas/features/feature_market/presentation/screens/market_page.dart';
import 'package:crypto_nas/features/feature_profile/presentation/screens/profile_page.dart';
import 'package:crypto_nas/features/feature_watch_list/presentation/screens/watch_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class MainWrapper extends StatelessWidget {
  static const routeName = "/main_wrapper";

  MainWrapper({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();
  final PageController pageController = PageController(initialPage: 0);

  List<Widget> topLevelScreens = [
    const HomePage(),
    const MarketPage(),
    ProfilePage(),
    const WatchListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: themeData.brightness,
        statusBarColor: themeData.primaryColor,
        systemNavigationBarColor: themeData.primaryColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 250),
                  reverseTransitionDuration: const Duration(milliseconds: 250),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const ExchangePage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    animation = CurvedAnimation(
                        parent: animation, curve: Curves.linear);
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 1),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                ),
              );
            },
            child: const Icon(Icons.compare_arrows_outlined),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNav(Controller: pageController),
          body: PageView(
            controller: pageController,
            children: topLevelScreens,
          ),
        ),
      ),
    );
  }
}
