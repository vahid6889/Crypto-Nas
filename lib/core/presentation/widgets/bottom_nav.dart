import 'package:crypto_nas/core/blocs/user_profile_bloc/user_profile_bloc.dart';
import 'package:crypto_nas/features/feature_home/presentation/screens/home_page.dart';
import 'package:crypto_nas/features/feature_market/presentation/screens/market_page.dart';
import 'package:crypto_nas/features/feature_profile/presentation/screens/profile_page.dart';
import 'package:crypto_nas/features/feature_watch_list/presentation/screens/watch_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class BottomNav extends StatelessWidget {
  PageController Controller;
  BottomNav({Key? key, required this.Controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var themeData = Theme.of(context);

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      color: themeData.primaryColor,
      child: SizedBox(
        height: (width > 360) ? 63 : 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width / 2 - 20,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      Controller.animateToPage(
                        HomePage.page,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: const Icon(
                      Icons.home,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Controller.animateToPage(
                        MarketPage.page,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: const Icon(
                      Icons.bar_chart,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: width / 2 - 20,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<UserProfileBloc>(context)
                          .add(UserProfileLoadingEvent());
                      Controller.animateToPage(
                        ProfilePage.page,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: const Icon(
                      Icons.person,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Controller.animateToPage(
                        WatchListPage.page,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: const Icon(
                      Icons.bookmark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
