import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_nas/core/utils/constants.dart';
import 'package:crypto_nas/features/feature_home/data/models/CryptoData.dart';
import 'package:crypto_nas/features/feature_home/domain/entities/top_market_coin_entity.dart';
import 'package:crypto_nas/features/feature_home/presentation/widgets/decimalRounder.dart';
import 'package:crypto_nas/features/feature_market/presentation/bloc/market_bloc/all_crypto_status.dart';
import 'package:crypto_nas/features/feature_market/presentation/bloc/market_bloc/market_bloc.dart';
import 'package:crypto_nas/features/feature_market/presentation/widgets/shimmer_martket.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});
  static int page = 1;

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  late Timer timer;
  late List<CryptoData?> allCrypto;
  List<CryptoData?>? modelSuggestion;

  void searchCrypto(String query) {
    final suggestion = allCrypto.where((crypto) {
      final cryptoName = crypto!.name!.toLowerCase();
      final input = query.toLowerCase();

      return cryptoName.contains(input);
    }).toList();

    setState(() {
      modelSuggestion = suggestion;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<MarketBloc>(context).add(LoadAllCryptoEvent());

    timer = Timer.periodic(
      const Duration(seconds: 120),
      (Timer t) =>
          BlocProvider.of<MarketBloc>(context).add(LoadAllCryptoEvent()),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: themeData.primaryColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: themeData.primaryColor,
        title: Text(
          AppLocalizations.of(context).allCryptocurrencies,
        ),
        centerTitle: true,
        titleTextStyle: themeData.textTheme.displayMedium,
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<MarketBloc, MarketState>(
                buildWhen: (previous, current) {
                  if (previous.allCryptoStatus == current.allCryptoStatus) {
                    return false;
                  }
                  return true;
                },
                builder: (context, state) {
                  if (state.allCryptoStatus is AllCryptoLoading) {
                    return const ShimmerMarketView();
                  }
                  if (state.allCryptoStatus is AllCryptoCompleted) {
                    /// cast data
                    final AllCryptoCompleted allCryptoCompleted =
                        state.allCryptoStatus as AllCryptoCompleted;

                    final TopMarketCoinEntity? topMarketCoinEntity =
                        allCryptoCompleted.topMarketCoinEntity;
                    List<CryptoData?>? model =
                        topMarketCoinEntity!.data!.cryptoCurrencyList;
                    allCrypto = model!;
                    if (modelSuggestion != null) {
                      model = modelSuggestion;
                    }

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            style: themeData.textTheme.bodySmall,
                            onChanged: searchCrypto,
                            decoration: InputDecoration(
                              hintStyle: themeData.textTheme.bodySmall,
                              prefixIcon: Icon(
                                Icons.search,
                                color: themeData.secondaryHeaderColor,
                              ),
                              // hintText: AppLocalizations.of(context)!.search,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: themeData.secondaryHeaderColor,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider();
                            },
                            itemCount: model!.length,
                            itemBuilder: (context, index) {
                              final number = index + 1;
                              final tokenId = model![index]!.id;

                              // get filter color for chart (green or red)
                              final MaterialColor filterColor =
                                  DecimalRounder.setColorFilter(
                                model[index]!.quotes![0].percentChange24h,
                              );

                              // get price decimals fix
                              final finalPrice =
                                  DecimalRounder.removePriceDecimals(
                                model[index]!.quotes![0].price,
                              );

                              // percent change setup decimals and colors
                              final percentChange =
                                  DecimalRounder.removePercentDecimals(
                                model[index]!.quotes![0].percentChange24h,
                              );

                              final Color percentColor =
                                  DecimalRounder.setPercentChangesColor(
                                model[index]!.quotes![0].percentChange24h,
                              );
                              final Icon percentIcon =
                                  DecimalRounder.setPercentChangesIcon(
                                model[index]!.quotes![0].percentChange24h,
                              );

                              // allCrypto = model;

                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => TokenDetailPage(cryptoData: model[index])));
                                  },
                                  child: SizedBox(
                                    height: height * 0.075,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            number.toString(),
                                            style:
                                                themeData.textTheme.bodySmall,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10.0,
                                            right: 15,
                                          ),
                                          child: CachedNetworkImage(
                                            height: 32,
                                            width: 32,
                                            imageUrl:
                                                "${Constants.imageUrl}/32x32/$tokenId.png",
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                              baseColor: Colors.grey.shade400,
                                              highlightColor: Colors.white,
                                              child: SizedBox(
                                                width: 32,
                                                height: 32,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      20,
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                model[index]!.name!,
                                                style: themeData
                                                    .textTheme.bodySmall,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                model[index]!.symbol!,
                                                style: themeData
                                                    .textTheme.labelSmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          // flex: 2,
                                          child: ColorFiltered(
                                            colorFilter: ColorFilter.mode(
                                              filterColor,
                                              BlendMode.srcATop,
                                            ),
                                            child: SvgPicture.network(
                                              "${Constants.chartSvgUrl}/30d/2781/$tokenId.svg",
                                            ),
                                          ),
                                        ),
                                        // Spacer(),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              right: 10.0,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "\$$finalPrice",
                                                  style: themeData
                                                      .textTheme.bodySmall,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    percentIcon,
                                                    Text(
                                                      "$percentChange%",
                                                      style: GoogleFonts.ubuntu(
                                                        color: percentColor,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
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
                      ],
                    );
                  }
                  if (state.allCryptoStatus is AllCryptoError) {
                    final AllCryptoError allCryptoStatus =
                        state.allCryptoStatus as AllCryptoError;
                    return Center(
                      child: Text(allCryptoStatus.message),
                    );
                  }
                  return const ShimmerMarketView();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
