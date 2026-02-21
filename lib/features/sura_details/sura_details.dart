import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/resources/assets_manger.dart';
import 'package:islami/core/resources/color_manger.dart';
import 'package:islami/models/sura_details.dart';

class SuraDetails extends StatefulWidget {
  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String content = '';
  late SuraDetailsArrg arrgument;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    arrgument = ModalRoute.of(context)!.settings.arguments as SuraDetailsArrg;
    loadSuraContent(arrgument.sura.suraIndex);
  }

  @override
  void dispose() {
    arrgument.mostRecentKey.currentState?.featchMostRecent();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.black,
      appBar: AppBar(
        backgroundColor: ColorManger.black,
        foregroundColor: ColorManger.gold,
        title: Text(arrgument.sura.suraNameEn),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AssetsManger.imgLeftCorner,
                    color: ColorManger.gold,
                    width: 93.w,
                  ),

                  Image.asset(
                    AssetsManger.imgRightCorner,
                    color: ColorManger.gold,
                    width: 93.w,
                  ),
                ],
              ),

              Text(
                arrgument.sura.suraNameAr,
                style: TextStyle(
                  color: ColorManger.gold,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: content.isEmpty
                ? Center(
                    child: CircularProgressIndicator(color: ColorManger.gold),
                  )
                : SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .82,
                      padding: REdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        content,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'UthmanicHafs',
                          fontSize: 24.sp,
                          height: 2.1.h,
                          fontWeight: FontWeight.bold,
                          color: ColorManger.gold,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  loadSuraContent(String index) async {
    String filePath = 'assets/files/Suras/$index.txt';
    String filecontent = await rootBundle.loadString(filePath);
    List<String> suraContant = filecontent.trim().split('\n');
    for (int i = 0; i < suraContant.length; i++) {
      suraContant[i] += '[${i + 1}]';
    }

    content = suraContant.join();

    await Future.delayed(
      Duration(seconds: 1),
    ); //حاطتawait عشان اقوله متعملش setstateغير بعد ثانيه
    setState(() {});
  }
}
