import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manger.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetsManger.tabBg)),
      ),
      child: Column(children: [Image.asset(AssetsManger.islamiLogo)]),
    );
  }
}
