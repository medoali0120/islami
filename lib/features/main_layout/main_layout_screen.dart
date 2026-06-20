import 'package:flutter/material.dart';
import 'package:islami/core/resources/color_manger.dart';
import 'package:islami/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:islami/features/tabs/quran_tab/Quran_tab.dart';
import 'package:islami/features/tabs/time_tap/Time_tab.dart';
import 'package:islami/features/tabs/hadith_tab/book_tab.dart';
import 'package:islami/features/tabs/radio_tap/presentation/pages/radio_tab.dart';
import 'package:islami/features/tabs/sebha_tap/sebha_tab.dart';

class MainLayoutScreen extends StatefulWidget {
  MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  List<Widget> tabs = [
    QuranTab(),
    BookTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  int selectedIndex = 0;
  void onTapp(int newIndex) {
    // عاملها برايفت عشان مش هستخدمها غير هنا
    selectedIndex = newIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.black,
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: selectedIndex,
        onTap: onTapp,
      ),
      body: tabs[selectedIndex],
    );
  }
}
