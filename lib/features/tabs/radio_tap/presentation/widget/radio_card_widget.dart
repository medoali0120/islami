import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/resources/assets_manger.dart';
import 'package:islami/core/resources/color_manger.dart';

class RadioCardWidget extends StatefulWidget {
  const RadioCardWidget({super.key, this.name, this.url});
  final String? name;
  final String? url;
  @override
  State<RadioCardWidget> createState() => _RadioCardWidgetState();
}

class _RadioCardWidgetState extends State<RadioCardWidget> {
  final player = AudioPlayer();
  String? currentPlayUrl;
  double currentVolume = 2;
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
              widget.name ?? '',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    await play(widget.url ?? '');
                    setState(() {});
                  },
                  icon: Icon(
                    (isPlaying)
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded,
                    size: 60.sp,
                    color: ColorManger.black,
                  ),
                ),

                // IconButton(
                //   onPressed: () {
                //     setState(() {
                //       setVolume(isVolumeOn ? 2 : 0);
                //     });
                //   },
                //   icon: Icon(
                //     isVolumeOn
                //         ? Icons.volume_up_rounded
                //         : Icons.volume_off_rounded,
                //     size: 40.sp,
                //     color: ColorManger.black,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> play(String url) async {
    if (currentPlayUrl == url) {
      isPlaying ? await player.pause() : await player.resume();
      isPlaying = !isPlaying;
    } else {
      await player.stop();
      currentPlayUrl = url;
      await player.play(UrlSource(url), volume: currentVolume);
      isPlaying = true;
    }
  }

  // Future<void> setVolume(double volume) async {
  //   currentVolume = volume;
  //   await player.setVolume(volume);
  //   isVolumeOn = !isVolumeOn;
  // }
}
