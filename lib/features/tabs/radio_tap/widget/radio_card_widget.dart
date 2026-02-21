import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/resources/assets_manger.dart';
import 'package:islami/core/resources/color_manger.dart';

class RadioCardWidget extends StatefulWidget {
  const RadioCardWidget({super.key});

  @override
  State<RadioCardWidget> createState() => _RadioCardWidgetState();
}

class _RadioCardWidgetState extends State<RadioCardWidget> {
  bool isPlaying = false;
  bool isVolumeOn = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(AssetsManger.radioCard),
        ),
        color: ColorManger.gold,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: REdgeInsets.only(top: 13),
        child: Column(
          children: [
            Text(
              'Radio Ibrahim Al-Akdar',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    isPlaying = !isPlaying;
                    setState(() {});
                  },
                  icon: Icon(
                    isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    size: 60.sp,
                    color: ColorManger.black,
                  ),
                ),

                IconButton(
                  onPressed: () {
                    isVolumeOn = !isVolumeOn;
                    setState(() {});
                  },
                  icon: Icon(
                    isVolumeOn
                        ? Icons.volume_off_rounded
                        : Icons.volume_up_rounded,
                    size: 40.sp,
                    color: ColorManger.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
