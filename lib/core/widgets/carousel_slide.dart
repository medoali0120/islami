import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manger.dart';
import 'package:islami/core/resources/color_manger.dart';
import 'package:islami/features/tabs/hadith_tab/hadith_item.dart';

class CarouselSlide extends StatelessWidget {
  const CarouselSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.black,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AssetsManger.backgroundHadith),
          ),
        ),
        child: Column(
          children: [
            Expanded(flex: 1, child: Image.asset(AssetsManger.islamiLogo)),
            Expanded(
              flex: 5,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 550.0,
                  viewportFraction: 0.8,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                ),
                items: List.generate(50, (index) => index + 1).map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return HadithItem(index: i);
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
