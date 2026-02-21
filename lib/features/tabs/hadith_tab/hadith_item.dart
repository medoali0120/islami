import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/resources/assets_manger.dart';
import 'package:islami/core/resources/color_manger.dart';
import 'package:islami/models/hadith_model.dart';

class HadithItem extends StatefulWidget {
  HadithItem({super.key, required this.index});
  int index;

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  HadithModel? hadith;
  @override
  void initState() {
    super.initState();
    loadHadith(widget.index); //عشان ال varموجود في ال widget
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(vertical: 12, horizontal: 12),
      width: double.infinity,
      height: 600.h,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetsManger.hadithCardBack)),
        borderRadius: BorderRadius.circular(20.r),
        color: ColorManger.gold,
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AssetsManger.imgLeftCorner,
                    color: ColorManger.black,
                    width: 93.w,
                  ),

                  Image.asset(
                    AssetsManger.imgRightCorner,
                    color: ColorManger.black,
                    width: 93.w,
                  ),
                ],
              ),
              Text(
                hadith?.title ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorManger.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Expanded(
            child: hadith == null
                ? Center(
                    child: CircularProgressIndicator(color: ColorManger.black),
                  )
                : SingleChildScrollView(
                    padding: REdgeInsets.all(16),
                    child: Text(
                      hadith!.content,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorManger.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
          Image.asset(AssetsManger.hadithBottomImage),
        ],
      ),
    );
  }

  void loadHadith(int index) async {
    String filePath = 'assets/files/Hadeeth/h$index.txt';
    String fileContent = await rootBundle.loadString(filePath);
    List<String> hadithContent = fileContent.split('\n');
    String title = hadithContent[0];
    hadithContent.remove(0);
    String contentH = hadithContent.join();
    hadith = HadithModel(title: title, content: contentH);
    // await Future.delayed(Duration(seconds: 1));
    if (!mounted) return;
    setState(() {});

    setState(() {});
  }
}
