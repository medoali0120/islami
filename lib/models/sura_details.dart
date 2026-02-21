import 'package:flutter/material.dart';
import 'package:islami/features/tabs/quran_tab/most_recent.dart';
import 'package:islami/models/sura_model.dart';

class SuraDetailsArrg {
  SuraModel sura;
  GlobalKey<MostRecentState> mostRecentKey;
  SuraDetailsArrg({required this.sura, required this.mostRecentKey});
}
