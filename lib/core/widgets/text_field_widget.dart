import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manger.dart';
import 'package:islami/core/resources/color_manger.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({super.key, required this.onChange});
  Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      style: TextStyle(color: ColorManger.ofwhite, fontSize: 16),
      decoration: InputDecoration(
        prefixIcon: ImageIcon(
          AssetImage(IconManger.quranTextField),

          color: ColorManger.gold,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorManger.gold),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorManger.gold),
        ),
        labelText: 'Sura Name',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: ColorManger.ofwhite,
        ),
      ),
    );
  }
}
