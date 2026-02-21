import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/prefs_manger/prefsmanger.dart';
import 'package:islami/core/resources/assets_manger.dart';
import 'package:islami/core/resources/color_manger.dart';
import 'package:islami/core/route_manger/route_manger.dart';
import 'package:islami/features/tabs/quran_tab/most_recent.dart';
import 'package:islami/models/sura_details.dart';

import 'package:islami/models/sura_model.dart';

class SuraItem extends StatelessWidget {
  SuraItem({super.key, required this.suraModel, required this.mostRecentKey});
  SuraModel suraModel;
  GlobalKey<MostRecentState> mostRecentKey;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Prefsmanger.saveSuraIndex(suraModel.suraIndex);
        Navigator.pushNamed(
          context,
          RouteManger.suraDetails,
          arguments: SuraDetailsArrg(
            sura: suraModel,
            mostRecentKey: mostRecentKey,
          ),
        );
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AssetsManger.imgSurNumberFrame, width: 60.w),
              Text(
                suraModel.suraIndex,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManger.white,
                ),
              ),
            ],
          ),
          SizedBox(width: 24.w),
          Column(
            children: [
              Text(
                suraModel.suraNameEn,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManger.white,
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
              Text(
                '${suraModel.versesNumber} verses',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManger.white,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            suraModel.suraNameAr,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: ColorManger.white,
            ),
          ),
        ],
      ),
    );
  }
}
