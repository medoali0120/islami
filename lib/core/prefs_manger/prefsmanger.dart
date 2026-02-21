import 'package:flutter/material.dart';
import 'package:islami/core/resources/constants_key.dart';
import 'package:islami/models/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefsmanger extends ChangeNotifier {
  static Future<void> saveSuraIndex(String suraIndex) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> mostRecentSuraIndex =
        sharedPreferences.getStringList(ConstantsKey.mostRecentSuraKey) ?? [];
    if (mostRecentSuraIndex.contains(suraIndex)) {
      mostRecentSuraIndex.remove(suraIndex);
    }
    if (mostRecentSuraIndex.length > 6) {
      mostRecentSuraIndex.remove(mostRecentSuraIndex.first);
    }
    mostRecentSuraIndex.add(suraIndex);
    sharedPreferences.setStringList(
      ConstantsKey.mostRecentSuraKey,
      mostRecentSuraIndex,
    );
  }

  static Future<List<SuraModel>> getMostRecentSura() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> mostRecentSuraIndex =
        sharedPreferences.getStringList(ConstantsKey.mostRecentSuraKey) ?? [];
    List<SuraModel> mostRecentSuras = [];
    for (int i = 0; i < mostRecentSuraIndex.length; i++) {
      int index = int.parse(mostRecentSuraIndex[i]);
      mostRecentSuras.add(SuraModel.suras[index - 1]);
    }
    return mostRecentSuras.reversed.toList();
  }
}
