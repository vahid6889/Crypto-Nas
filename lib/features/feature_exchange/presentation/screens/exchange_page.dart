import 'dart:ui';
import 'package:blobs/blobs.dart';
import 'package:crypto_nas/features/feature_exchange/presentation/widgets/buy_tab_bar_view/buy_tab_bar_view.dart';
import 'package:crypto_nas/features/feature_exchange/presentation/widgets/sell_tab_bar_view/sell_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({super.key});

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  BlobController blobCtrl = BlobController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeData = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: themeData.primaryColorLight, //change your color here
          ),
          title: Text(AppLocalizations.of(context).exchangeCn),
          titleTextStyle: themeData.textTheme.displayMedium,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                ),
                width: width * 50,
                height: 60,
                child: DefaultTabController(
                  length: 2,
                  child: Material(
                    color: themeData.primaryColorDark,
                    child: TabBar(
                      controller: _tabController,
                      tabs: [
                        Tab(
                          text: AppLocalizations.of(context).buy,
                        ),
                        Tab(
                          text: AppLocalizations.of(context).sell,
                        ),
                      ],
                      labelColor: themeData.secondaryHeaderColor,
                      unselectedLabelColor: Colors.white,
                      indicator: RectangularIndicator(
                        color: themeData.scaffoldBackgroundColor,
                        bottomLeftRadius: 100,
                        bottomRightRadius: 100,
                        topLeftRadius: 100,
                        topRightRadius: 100,
                        verticalPadding: 5,
                        horizontalPadding: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  BuyTabBarView(),
                  SellTabBarView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
