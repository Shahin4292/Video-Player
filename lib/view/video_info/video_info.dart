import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/res/color/colors.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      videoInfo = json.decode(value);
    });
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

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
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back_ios,
                            size: 20, color: AppColor.secondViewIconColor),
                      ),
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
              child: Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, top: 30),
                child: Column(
                  spacing: 10,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Circuit 1: Legs Toning",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColor.circuitsColor)),
                        Row(
                          spacing: 5,
                          children: [
                            Icon(Icons.loop,
                                size: 20, color: AppColor.loopColor),
                            Text("3 sec",
                                style: TextStyle(
                                    fontSize: 15, color: AppColor.setsColor)),
                          ],
                        )
                      ],
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: videoInfo.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  debugPrint(index.toString());
                                },
                                child: Container(
                                  height: 135,
                                  child: Column(
                                    spacing: 16,
                                    children: [
                                      Row(
                                        spacing: 10,
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        videoInfo[index]
                                                            ["thumbnail"]),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            spacing: 10,
                                            children: [
                                              Text(
                                                videoInfo[index]["title"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                videoInfo[index]["time"],
                                                style: TextStyle(
                                                    color: Colors.grey[500]),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color: Color(0xFFeaeefc),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text("15s rest",
                                                  style: TextStyle(
                                                      color:
                                                          Color(0xFF839fed))),
                                            ),
                                          ),
                                          SizedBox(width: 3),
                                          Row(
                                            children: [
                                              for (int i = 0; i < 70; i++)
                                                i.isEven
                                                    ? Container(
                                                        width: 3,
                                                        height: 1,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xFF839fed),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2)))
                                                    : Container(
                                                        width: 3,
                                                        height: 1,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2)))
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }))
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
