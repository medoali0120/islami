import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manger.dart';
import 'package:islami/core/resources/color_manger.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  BottomNavigationBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: ColorManger.gold,
      type: BottomNavigationBarType.fixed, //عشان اللون يسمع معاك
      selectedItemColor: ColorManger.white,
      unselectedItemColor: ColorManger.black,
      showSelectedLabels: true, //عشان يظهر ال selected labales
      showUnselectedLabels: false, //عشان ميظهرش ال unselected labales
      //بتبعت ال index ديcallbackFunction
      onTap: onTap,
      currentIndex:
          selectedIndex, //عشان اقدر انا بتنقل بين التاب لون الي selected item يتغير معايا
      items: [
        BottomNavigationBarItem(
          icon: _buildiconWidget(
            icon: IconManger.quran,
            isSelected: selectedIndex == 0,
          ),
          label: 'Quran',
        ),
        BottomNavigationBarItem(
          icon: _buildiconWidget(
            icon: IconManger.book,
            isSelected: selectedIndex == 1,
          ),
          label: 'book',
        ),
        BottomNavigationBarItem(
          icon: _buildiconWidget(
            icon: IconManger.sebha,
            isSelected: selectedIndex == 2,
          ),
          label: 'sebha',
        ),
        BottomNavigationBarItem(
          icon: _buildiconWidget(
            icon: IconManger.radio,
            isSelected: selectedIndex == 3,
          ),
          label: 'radio',
        ),
        BottomNavigationBarItem(
          icon: _buildiconWidget(
            icon: IconManger.time,
            isSelected: selectedIndex == 4,
          ),
          label: 'Time',
        ),
      ],
    );
  }

  Widget _buildiconWidget({required String icon, required bool isSelected}) {
    return isSelected
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              color: ColorManger.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ImageIcon(AssetImage(icon)),
          )
        : ImageIcon(AssetImage(icon));
  }
}
