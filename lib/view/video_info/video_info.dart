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
              padding: EdgeInsets.only(top: 70, left: 30, right: 30),
              width: MediaQuery.sizeOf(context).width,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 40,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios,
                          size: 20, color: AppColor.secondViewIconColor),
                      Icon(Icons.info_outline,
                          size: 25, color: AppColor.secondViewIconColor),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Legs Toning",
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColor.secondViewTitleColor,
                              fontWeight: FontWeight.w600)),
                      Text("and Glutes Workout",
                          style: TextStyle(
                              fontSize: 25,
                              color: AppColor.secondViewTitleColor)),
                    ],
                  ),
                  Row(
                    spacing: 20,
                    children: [
                      Container(
                        width: 98,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  AppColor.secondViewContainerGradient1stColor,
                                  AppColor.secondViewContainerGradient2ndColor
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 5,
                          children: [
                            Icon(Icons.timer_outlined,
                                color: AppColor.secondViewIconColor, size: 20),
                            Text("68 min",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.secondViewIconColor)),
                          ],
                        ),
                      ),
                      Container(
                        width: 230,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  AppColor.secondViewContainerGradient1stColor,
                                  AppColor.secondViewContainerGradient2ndColor
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 5,
                          children: [
                            Icon(Icons.handyman_outlined,
                                color: AppColor.secondViewIconColor, size: 20),
                            Text("Resistent band, kettebell",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.secondViewIconColor)),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
            ))
          ],
        ),
      ),
    );
  }
}
