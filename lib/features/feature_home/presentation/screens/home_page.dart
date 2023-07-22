import 'package:crypto_nas/core/blocs/user_profile_bloc/user_profile_bloc.dart';
import 'package:crypto_nas/core/presentation/widgets/theme_switcher.dart';
import 'package:crypto_nas/features/feature_home/presentation/bloc/choice_chip_bloc/choice_chip_bloc.dart';
import 'package:crypto_nas/features/feature_home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:crypto_nas/features/feature_home/presentation/widgets/choice_chips/top_market_cap_choice_chip.dart';
import 'package:crypto_nas/features/feature_home/presentation/widgets/drawer_menu_view.dart';
import 'package:crypto_nas/features/feature_home/presentation/widgets/slider_page_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static int page = 0;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageViewController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserProfileBloc>(context).add(UserProfileLoadingEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    final List<String> choicesList = [
      AppLocalizations.of(context).topMarketCaps,
      AppLocalizations.of(context).topGainers,
      AppLocalizations.of(context).topLosers,
    ];

    return Scaffold(
      drawer: DrawerMenuView(themeData: themeData),
      appBar: AppBar(
        backgroundColor: themeData.primaryColor,
        actions: const [
          ThemeSwitcher(),
        ],
        title: Text(
          AppLocalizations.of(context).exchangeCn,
        ),
        titleTextStyle: themeData.textTheme.displayMedium,
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // PageView
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 5, right: 5),
                child: SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      SliderPageView(controller: _pageViewController),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: SmoothPageIndicator(
                            controller: _pageViewController,
                            count: 4,
                            effect: const ExpandingDotsEffect(
                              dotWidth: 10,
                              dotHeight: 10,
                            ),
                            onDotClicked: (index) =>
                                _pageViewController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 30,
                child: Marquee(
                  text: '🔊 this is place for news in application ',
                  style: themeData.textTheme.bodySmall,
                ),
              ),

              const SizedBox(height: 5.0),

              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700],
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          padding: const EdgeInsets.all(20),
                        ),
                        child: Text(
                          AppLocalizations.of(context).buy,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[700],
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          padding: const EdgeInsets.all(20),
                        ),
                        child: Text(
                          AppLocalizations.of(context).sell,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 5.0),

              BlocBuilder<ChoiceChipBloc, int>(
                builder: (context, choiceState) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Row(
                      children: [
                        Wrap(
                          spacing: 8,
                          children: List.generate(
                            choicesList.length,
                            (index) {
                              return ChoiceChip(
                                label: Text(
                                  choicesList[index],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                selected: choiceState == index,
                                selectedColor: Colors.blue,
                                // disabledColor: Colors.white,
                                backgroundColor: Colors.grey,
                                onSelected: (value) {
                                  BlocProvider.of<ChoiceChipBloc>(context)
                                      .add(ChoiceChipSwitchEvent(index));
                                  switch (index) {
                                    case 1:
                                      BlocProvider.of<HomeBloc>(context)
                                          .add(LoadTopGainerEvent());
                                      break;
                                    case 2:
                                      BlocProvider.of<HomeBloc>(context)
                                          .add(LoadTopLoserEvent());
                                      break;
                                    default:
                                      BlocProvider.of<HomeBloc>(context)
                                          .add(LoadTopMarketCapEvent());
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const TopMarketCapChoiceChip(),
            ],
          ),
        ),
      ),
    );
  }
}
