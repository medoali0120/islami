import 'package:islami/core/resources/constants_manger.dart';

class SuraModel {
  final String suraNameEn;
  final String suraNameAr;
  final String versesNumber;
  final String suraIndex;
  const SuraModel({
    required this.suraNameEn,
    required this.suraNameAr,
    required this.versesNumber,
    required this.suraIndex,
  });
  static List<SuraModel> suras = [];
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
}
