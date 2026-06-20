import 'package:flutter/material.dart';
import 'package:islami/core/resources/color_manger.dart';
import 'package:islami/features/tabs/radio_tap/presentation/widget/tab_item.dart';

class CustomTapbar extends StatefulWidget {
  CustomTapbar({super.key});

  @override
  State<CustomTapbar> createState() => _CustomTapbarState();
}

class _CustomTapbarState extends State<CustomTapbar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (index) {
        currentIndex = index;
        setState(() {});
      },
      padding: EdgeInsets.zero,
      tabAlignment: TabAlignment.start,
      dividerColor: Colors.transparent,
      indicatorColor: Colors.transparent,
      isScrollable: true,
      tabs: [
        Tab(
          child: TabItem(
            lable: "Radio",
            selectedBgGroundColor: ColorManger.gold,
            selectedFgGroundColor: ColorManger.white,
            unSelectedBgGroundColor: ColorManger.grey,
            unSelectedFgGroundColor: ColorManger.white,
            isSelected: currentIndex == 0,
          ),
        ),
        Tab(
          child: TabItem(
            lable: "Reciters",
            selectedBgGroundColor: ColorManger.gold,
            selectedFgGroundColor: ColorManger.white,
            unSelectedBgGroundColor: ColorManger.grey,
            unSelectedFgGroundColor: ColorManger.white,
            isSelected: currentIndex == 1,
          ),
        ),
      ],
    );
  }
}
