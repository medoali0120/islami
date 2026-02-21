import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/resources/assets_manger.dart';
import 'package:islami/core/resources/color_manger.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int zekrIndex = 0;
  List<String> azkar = ["سبحان الله", "الحمد لله", "الله اكبر"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManger.sebhaBg),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(AssetsManger.islamiLogo, width: 300.w),

            Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
              style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.w700,
                color: ColorManger.white,
              ),
            ),
            SizedBox(height: 16.h),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(AssetsManger.sebhaBody),
                Padding(
                  padding: REdgeInsets.only(top: 94),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;

                        if (counter == 33) {
                          counter = 0;
                          zekrIndex = (zekrIndex + 1) % azkar.length;
                        }
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          azkar[zekrIndex],
                          style: TextStyle(
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w700,
                            color: ColorManger.white,
                          ),
                        ),

                        Text(
                          counter.toString(),
                          style: TextStyle(
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w700,
                            color: ColorManger.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
