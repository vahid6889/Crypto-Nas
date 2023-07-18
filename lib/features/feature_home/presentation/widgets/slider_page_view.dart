import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class SliderPageView extends StatefulWidget {
  PageController controller;
  SliderPageView({Key? key, required this.controller}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SliderPageViewState createState() => _SliderPageViewState();
}

class _SliderPageViewState extends State<SliderPageView> {
  bool _loading = false;
  var images = [
    'assets/images/a1.png',
    'assets/images/a2.png',
    'assets/images/a3.png',
    'assets/images/a4.png',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _loading = true;
    });
    Timer(
      const Duration(seconds: 1),
      () => setState(
        () {
          _loading = false;
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (_loading)
        ? Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 5, right: 5),
            child: SizedBox(
              height: 160,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.white,
                  child: Container(
                    margin: const EdgeInsets.only(right: 0),
                    height: 350,
                    width: 270,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                // ),
              ),
            ),
          )
        : PageView(
            allowImplicitScrolling: true,
            controller: widget.controller,
            children: [
              myPages(images[0]),
              myPages(images[1]),
              myPages(images[2]),
              myPages(images[3]),
            ],
          );
  }

  Widget myPages(String image) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ));
  }
}
