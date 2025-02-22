import 'package:flutter/material.dart';
import 'package:video_player/res/color/colors.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColor.gradientFirst.withOpacity(0.9),
          AppColor.gradientSecond
        ], begin: FractionalOffset(8.8, 0.4), end: Alignment.topRight)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 70,left: 30,right: 30),
              width: MediaQuery.sizeOf(context).width,
              height: 300,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios, size: 25, color: AppColor.secondViewIconColor),
                      Icon(Icons.info_outline,
                          size: 25, color: AppColor.secondViewIconColor),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
