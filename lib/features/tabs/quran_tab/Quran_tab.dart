import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/resources/assets_manger.dart';
import 'package:islami/core/resources/color_manger.dart';
import 'package:islami/core/resources/constants_manger.dart';
import 'package:islami/core/widgets/text_field_widget.dart';
import 'package:islami/features/tabs/quran_tab/most_recent.dart';
import 'package:islami/features/tabs/quran_tab/most_resent_widget.dart';
import 'package:islami/features/tabs/quran_tab/sura_item.dart';
import 'package:islami/models/sura_model.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});
  List<SuraModel> filteredList = SuraModel.suras;

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  static List<SuraModel> suras = [];

  @override
  void initState() {
    super.initState();
    loadSuras();
  }

  void newMethod() {
    SuraModel.suras.clear();
    for (int i = 0; i < ConstantsManger.arabicAuranSuras.length; i++) {
      SuraModel.suras.add(
        SuraModel(
          suraNameEn: ConstantsManger.englishQuranSurahs[i],
          suraNameAr: ConstantsManger.arabicAuranSuras[i],
          versesNumber: ConstantsManger.ayaNumber[i],
          suraIndex: (i + 1).toString(),
        ),
      );
    }
  }

  GlobalKey<MostRecentState> mostRecentKey = GlobalKey<MostRecentState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetsManger.tabBg)),
      ),
      child: Padding(
        padding: REdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AssetsManger.islamiLogo),
            SizedBox(height: 21.h),
            TextFieldWidget(
              onChange: (Text) {
                searchByName(Text);
              },
            ),

            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            MostRecent(key: mostRecentKey),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
            Text(
              'Suras List',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: ColorManger.ofwhite,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => SuraItem(
                  suraModel: widget.filteredList[index],
                  mostRecentKey: mostRecentKey,
                ),
                separatorBuilder: (context, index) => Padding(
                  padding: REdgeInsets.all(8.0),
                  child: Divider(
                    color: ColorManger.white,
                    indent: 35,
                    endIndent: 25,
                  ),
                ),
                itemCount: widget.filteredList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void searchByName(String searchKey) {
    if (searchKey.isEmpty) {
      widget.filteredList = SuraModel.suras;
    } else {
      widget
          .filteredList = // (widget.filteredList ) انا هنا غيرتها عشان كده هعمل فلتر ل فلتر ليست الي انا لسه باحث فيها مش السور كلها
      SuraModel.suras
          .where(
            (sura) =>
                sura.suraNameEn.toLowerCase().contains(
                  searchKey.toLowerCase(),
                ) ||
                sura.suraNameAr.contains(searchKey),
          )
          .toList();
    }

    setState(() {});
  }
}

void loadSuras() {
  SuraModel.suras.clear();
  for (int i = 0; i < ConstantsManger.arabicAuranSuras.length; i++) {
    SuraModel.suras.add(
      SuraModel(
        suraNameEn: ConstantsManger.englishQuranSurahs[i],
        suraNameAr: ConstantsManger.arabicAuranSuras[i],
        versesNumber: ConstantsManger.ayaNumber[i],
        suraIndex: (i + 1).toString(),
      ),
    );
  }
}
