import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/prefs_manger/prefsmanger.dart';
import 'package:islami/core/resources/assets_manger.dart';
import 'package:islami/core/resources/color_manger.dart';
import 'package:islami/core/route_manger/route_manger.dart';
import 'package:islami/features/tabs/quran_tab/most_recent.dart';
import 'package:islami/models/sura_details.dart';
import 'package:islami/models/sura_model.dart';

class MostResentWidget extends StatelessWidget {
  MostResentWidget({
    super.key,
    required this.sura,
    required this.mostRecentKey,
  });
  SuraModel sura;
  GlobalKey<MostRecentState> mostRecentKey;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Prefsmanger.saveSuraIndex(sura.suraIndex);
        Navigator.pushNamed(
          context,
          RouteManger.suraDetails,
          arguments: SuraDetailsArrg(sura: sura, mostRecentKey: mostRecentKey),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorManger.gold,
          borderRadius: BorderRadius.circular(24.r),
        ),
        padding: REdgeInsets.symmetric(vertical: 12, horizontal: 16),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  sura.suraNameEn,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  sura.suraNameAr,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${sura.versesNumber} Verses',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Image.asset(AssetsManger.imgMostRecent),
          ],
        ),
      ),
    );
  }
}
