import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/resources/color_manger.dart';
import 'package:islami/features/tabs/radio_tap/data/model/sura_reciters_model.dart';

class BottomSheetButton extends StatefulWidget {
  final Function(QuranSurahModel surah) onSurahSelected;
  const BottomSheetButton({super.key, required this.onSurahSelected});

  @override
  State<BottomSheetButton> createState() => _BottomSheetButtonState();
}

class _BottomSheetButtonState extends State<BottomSheetButton> {
  QuranSurahModel selectedSurah = quranSurahs[1];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: showSurahBottomSheet,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: double.infinity,
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: ColorManger.gold,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            const Icon(Icons.menu_book_rounded),

            SizedBox(width: 10.w),

            Expanded(
              child: Text(
                selectedSurah.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const Icon(Icons.keyboard_arrow_down_rounded),
          ],
        ),
      ),
    );
  }

  Future<void> showSurahBottomSheet() async {
    final result = await showModalBottomSheet<QuranSurahModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * .7,
          decoration: const BoxDecoration(
            color: Color(0xffE2BE7F),
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 16),

              Container(
                width: 50.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                'اختر السورة',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 16.h),

              Expanded(
                child: ListView.separated(
                  itemCount: quranSurahs.length,
                  separatorBuilder: (_, __) => Divider(height: 1.h),
                  itemBuilder: (context, index) {
                    final surah = quranSurahs[index];

                    return ListTile(
                      title: Text(
                        surah.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Navigator.pop(context, surah);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    if (result != null) {
      setState(() {
        selectedSurah = result;
      });
      widget.onSurahSelected(result);
    }
  }
}
