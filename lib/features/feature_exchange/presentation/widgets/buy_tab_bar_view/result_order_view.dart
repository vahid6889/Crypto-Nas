import 'package:crypto_nas/features/feature_exchange/presentation/utils/curve_painter.dart';
import 'package:crypto_nas/features/feature_exchange/presentation/utils/exchange_order_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

Dialog resultOrderDialogBuy(BuildContext context) {
  var themeData = Theme.of(context);
  final List<ExchangeOrderModel> orderTile = [
    ExchangeOrderModel(
      textTitle: Text(
        "${AppLocalizations.of(context).orderType}:",
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      content: Text(
        AppLocalizations.of(context).sell,
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ),
    ExchangeOrderModel(
      textTitle: Text(
        "${AppLocalizations.of(context).token}:",
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      content: Text(
        "BTC",
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ),
    ExchangeOrderModel(
      textTitle: Text(
        "${AppLocalizations.of(context).until}:",
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      content: Text(
        "1.0",
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ),
    ExchangeOrderModel(
      textTitle: Text(
        "${AppLocalizations.of(context).untilPrice}:",
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      content: Text(
        "36583.7774",
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ),
    ExchangeOrderModel(
      textTitle: Text(
        "${AppLocalizations.of(context).fullName}:",
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      content: Text(
        "Vahid Ghasemi",
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ),
    ExchangeOrderModel(
      textTitle: Text(
        "${AppLocalizations.of(context).bankId}:",
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      content: Text(
        "113535151321",
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ),
  ];
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        color: themeData.dialogBackgroundColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      constraints: const BoxConstraints(maxHeight: 350),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: orderTile.length,
              itemBuilder: (context, index) {
                return CustomPaint(
                  size: const Size(200, 3),
                  painter: index > 0
                      ? CurvePainter(color: themeData.primaryColor)
                      : null,
                  child: ListTile(
                    title: orderTile[index].textTitle,
                    trailing: orderTile[index].content,
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  height: 40,
                  minWidth: 330,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  onPressed: () {},
                  color: const Color(0xFF16B180),
                  child: Text(
                    AppLocalizations.of(context).sendOrder,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: themeData.dialogBackgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
