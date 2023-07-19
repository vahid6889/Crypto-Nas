import 'dart:ui';

import 'package:blobs/blobs.dart';
import 'package:crypto_nas/features/feature_exchange/presentation/utils/curve_painter.dart';
import 'package:crypto_nas/features/feature_exchange/presentation/widgets/buy_tab_bar_view/result_order_view.dart';
import 'package:crypto_nas/features/feature_exchange/presentation/widgets/buy_tab_bar_view/one_step_view.dart';
import 'package:crypto_nas/features/feature_exchange/presentation/widgets/buy_tab_bar_view/two_step_view.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BuyTabBarView extends StatefulWidget {
  const BuyTabBarView({super.key});

  @override
  State<BuyTabBarView> createState() => _BuyTabBarViewState();
}

class _BuyTabBarViewState extends State<BuyTabBarView> {
  String dropdownValue = 'BTC';
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeData = Theme.of(context);
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 50,
          child: Blob.animatedRandom(
            size: 250,
            edgesCount: 6,
            minGrowth: 6,
            duration: const Duration(milliseconds: 1500),
            loop: true,
            styles: BlobStyles(color: themeData.dialogBackgroundColor),
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: const Opacity(opacity: 1),
          ),
        ),
        Positioned(
          bottom: height * 0.76,
          child: Lottie.asset(
            'assets/waveloop.json',
            height: height * 0.2,
            width: width,
            fit: BoxFit.fill,
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: const Opacity(opacity: 1),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Column(
              children: [
                SizedBox(
                  width: width,
                  child: Column(
                    children: [
                      _buildStepper(
                        StepperType.vertical,
                        themeData,
                        dropdownValue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  CupertinoStepper _buildStepper(
      StepperType type, ThemeData themeData, String dropdownValue) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final canCancel = currentStep > 0;
    final canContinue = currentStep < 3;

    return CupertinoStepper(
      type: type,
      currentStep: currentStep,
      onStepTapped: (step) => setState(() => currentStep = step),
      onStepCancel: canCancel ? () => setState(() => --currentStep) : null,
      onStepContinue: () {
        if (canContinue) {
          if (currentStep == 2) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return resultOrderDialogBuy(context);
              },
            );
          } else {
            setState(() {
              ++currentStep;
            });
          }
        } else {
          null;
        }
      },
      steps: [
        for (var i = 0; i < 2; ++i) ...[
          _buildStep(
            title: Text('Step ${i + 1}'),
            isActive: i == currentStep,
            state: i == currentStep ? StepState.editing : StepState.indexed,
            themeData: themeData,
            dropdownValue: dropdownValue,
            height: height,
            child: i == 0 ? const OneStepView() : const TwoStepView(),
          ),
        ],
        _buildStep(
          title: const Text('Step 3'),
          state: currentStep == 2 ? StepState.complete : StepState.indexed,
          themeData: themeData,
          dropdownValue: dropdownValue,
          height: height,
          width: width,
          child: Container(
            decoration: BoxDecoration(
              color: themeData.cardColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            constraints: const BoxConstraints(maxHeight: 150),
            child: Padding(
              padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Vahid Ghasemi',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      Icon(
                        Icons.wallet,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                  const Text(
                    'bank id: 113535151321',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  CustomPaint(
                    size: const Size(200, 3),
                    painter: CurvePainter(color: themeData.primaryColorLight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.01),
                        const Text(
                          'sheba: 100020034435456675642',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Step _buildStep({
    required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
    ThemeData? themeData,
    String? dropdownValue,
    double? height,
    double? width,
    Widget? child,
  }) {
    return Step(
      title: title,
      subtitle: const Text(
        'Pleas enter the transaction',
        style: TextStyle(fontSize: 14),
      ),
      state: state,
      isActive: isActive,
      content: LimitedBox(
        maxWidth: 300,
        maxHeight: 300,
        child: SizedBox(
          width: width ?? 220,
          child: child,
        ),
      ),
    );
  }
}
