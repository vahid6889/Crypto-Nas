import 'package:flutter/material.dart';

class OneStepView extends StatelessWidget {
  const OneStepView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeData = Theme.of(context);

    return Column(
      children: [
        Container(
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
              itemHeight: 60,
              dropdownColor: themeData.splashColor,
              focusColor: themeData.scaffoldBackgroundColor,
              items: ['BTC']
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(
                        value == 'English' ? value : value,
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
        SizedBox(height: height * 0.005),
        Container(
          width: width * 0.48,
          height: height * 0.06,
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
        SizedBox(height: height * 0.005),
        Container(
          width: width * 0.48,
          height: height * 0.06,
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
      ],
    );
  }
}
