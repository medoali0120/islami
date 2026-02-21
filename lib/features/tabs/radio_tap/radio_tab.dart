import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manger.dart';
import 'package:islami/features/tabs/radio_tap/widget/custom_tapbar.dart';
import 'package:islami/features/tabs/radio_tap/widget/radio_card_widget.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsManger.radioBg)),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Image.asset(AssetsManger.islamiLogo),
                SizedBox(height: 7),
                CustomTapbar(),
                SizedBox(height: 10),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView.separated(
                        itemBuilder: (context, index) => RadioCardWidget(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: 10,
                      ),

                      ListView.separated(
                        itemBuilder: (context, index) => RadioCardWidget(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
