import 'package:flutter/material.dart';

class OneStepView extends StatelessWidget {
  const OneStepView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
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
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                dropdownColor: themeData.splashColor,
                focusColor: themeData.scaffoldBackgroundColor,
                items: ['BTC']
                    .map(
                      (value) => DropdownMenuItem(
                        alignment: Alignment.centerLeft,
                        value: value,
                        child: Text(
                          value,
                          style: themeData.textTheme.bodySmall,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (String? value) {},
                isExpanded: true,
                value: 'BTC',
              ),
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
                Text(
                  'O 1.0',
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
                Text(
                  '\$ 36583.7774',
                  style: themeData.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
