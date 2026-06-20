import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.lable,
    required this.selectedBgGroundColor,
    required this.selectedFgGroundColor,
    required this.unSelectedBgGroundColor,
    required this.unSelectedFgGroundColor,
    required this.isSelected,
  });

  final String lable;
  final Color selectedBgGroundColor;
  final Color selectedFgGroundColor;
  final Color unSelectedBgGroundColor;
  final Color unSelectedFgGroundColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 65),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isSelected ? selectedBgGroundColor : unSelectedBgGroundColor,
      ),
      child: Text(
        lable,
        style: TextStyle(
          color: isSelected ? selectedFgGroundColor : unSelectedFgGroundColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
