import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/prefs_manger/prefsmanger.dart';
import 'package:islami/core/resources/color_manger.dart';
import 'package:islami/features/tabs/quran_tab/most_resent_widget.dart';
import 'package:islami/models/sura_model.dart';

class MostRecent extends StatefulWidget {
  const MostRecent({super.key});

  @override
  State<MostRecent> createState() => MostRecentState();
}

class MostRecentState extends State<MostRecent> {
  List<SuraModel> mostRecent = [];
  void featchMostRecent() async {
    mostRecent = await Prefsmanger.getMostRecentSura();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    featchMostRecent();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mostRecent.isEmpty ? false : true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Most Recently ',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: ColorManger.ofwhite,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 150.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => MostResentWidget(
                sura: mostRecent[index],
                mostRecentKey: widget.key as GlobalKey<MostRecentState>,
              ),
              separatorBuilder: (context, index) => SizedBox(width: 10.w),
              itemCount: mostRecent.length,
            ),
          ),
        ],
      ),
    );
  }
}
