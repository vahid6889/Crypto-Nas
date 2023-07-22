import 'package:flutter/material.dart';

class TwoStepView extends StatelessWidget {
  const TwoStepView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeData = Theme.of(context);

    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: themeData.dividerColor,
                style: BorderStyle.solid,
                width: 1.2,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.copy,
                  color: themeData.canvasColor,
                ),
                SizedBox(width: width * 0.02),
                Text(
                  'BTC ERC20',
                  style: themeData.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: height * 0.005),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: themeData.dividerColor,
                style: BorderStyle.solid,
                width: 1.2,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.wallet,
                  color: themeData.canvasColor,
                ),
                SizedBox(width: width * 0.02),
                Text(
                  'TXID',
                  style: themeData.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
        Expanded(child: Container()),
      ],
    );
  }
}
