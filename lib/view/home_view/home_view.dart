import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/color/colors.dart';
import '../video_info/video_info.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List info = [];

  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      setState(() {
        info = json.decode(value);
      });
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
      backgroundColor: AppColor.homeViewBackground,
      body: Container(
        padding: EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Row(
              children: [
                Text("Training",
                    style: TextStyle(
                        fontSize: 30,
                        color: AppColor.homeViewTitle,
                        fontWeight: FontWeight.w700)),
                Spacer(),
                Icon(Icons.arrow_back_ios,
                    size: 20, color: AppColor.homeViewIcons),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.calendar_today_outlined,
                    size: 20, color: AppColor.homeViewIcons),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 20, color: AppColor.homeViewIcons)
              ],
            ),
            Row(
              children: [
                Text("Your program",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColor.homeViewSubtitle,
                        fontWeight: FontWeight.w700)),
                Spacer(),
                Text("Details",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColor.homeViewDetail,
                        fontWeight: FontWeight.w700)),
                SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    Get.to(() => VideoInfo());
                  },
                  child: Icon(Icons.arrow_forward,
                      size: 20, color: AppColor.homeViewIcons),
                )
              ],
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 220,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 10),
                        blurRadius: 20,
                        color: AppColor.gradientSecond.withOpacity(0.3)),
                  ],
                  gradient: LinearGradient(colors: [
                    AppColor.gradientFirst.withOpacity(0.8),
                    AppColor.gradientSecond.withOpacity(0.9),
                  ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80),
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 3,
                    children: [
                      Text("Next workout",
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColor.homeViewContainerTextSmall)),
                      Text("Legs Toning",
                          style: TextStyle(
                              fontSize: 25,
                              color: AppColor.homeViewContainerTextSmall,
                              fontWeight: FontWeight.w600)),
                      Text("and Glutes Workout",
                          style: TextStyle(
                              fontSize: 25,
                              color: AppColor.homeViewContainerTextSmall)),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.timer_outlined,
                                  color: AppColor.homeViewContainerTextSmall,
                                  size: 20),
                              SizedBox(width: 10),
                              Text("60 min",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          AppColor.homeViewContainerTextSmall)),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => VideoInfo());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColor.gradientFirst,
                                        blurRadius: 10,
                                        offset: Offset(4, 8))
                                  ]),
                              child: Icon(Icons.play_circle_fill,
                                  color: AppColor.homeViewContainerTextSmall,
                                  size: 60),
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            ),
            Container(
              height: 180,
              // color: Colors.red,
              width: MediaQuery.sizeOf(context).width,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => VideoInfo());
                },
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      margin: EdgeInsets.only(top: 30),
                      height: 120,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 40,
                                offset: Offset(8, 10),
                                color:
                                    AppColor.gradientSecond.withOpacity(0.3)),
                            BoxShadow(
                                blurRadius: 10,
                                offset: Offset(-1, -5),
                                color: AppColor.gradientSecond.withOpacity(0.3))
                          ],
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/images/card.jpg"),
                              fit: BoxFit.fill)),
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.sizeOf(context).width,
                      margin: EdgeInsets.only(right: 200, bottom: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/images/figure.png"))),
                    ),
                    Container(
                      height: 100,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: 150, top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        children: [
                          Text("You are doing well",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColor.homeViewDetail,
                                  fontWeight: FontWeight.bold)),
                          RichText(
                              text: TextSpan(
                                  text: "Keep it up\n",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.homeViewPlanColor,
                                  ),
                                  children: [
                                TextSpan(text: "stick to your plan")
                              ]))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text("Area of focus",
                style: TextStyle(
                    fontSize: 25,
                    color: AppColor.homeViewTitle,
                    fontWeight: FontWeight.w500)),
            Expanded(
              child: OverflowBox(
                maxWidth: MediaQuery.sizeOf(context).width,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      itemCount: (info.length.toDouble() / 2).toInt(),
                      itemBuilder: (context, index) {
                        int a = 2 * index;
                        int b = 2 * index + 1;
                        return Row(
                          children: [
                            Container(
                              height: 170,
                              width:
                                  (MediaQuery.sizeOf(context).width - 90) / 2,
                              margin: EdgeInsets.only(left: 30, bottom: 15),
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(info[a]["img"])),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(5, 5),
                                        blurRadius: 3,
                                        color: AppColor.gradientSecond
                                            .withOpacity(0.1)),
                                    BoxShadow(
                                        offset: Offset(-5, -5),
                                        blurRadius: 3,
                                        color: AppColor.gradientSecond
                                            .withOpacity(0.1))
                                  ]),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(info[a]["title"],
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColor.homeViewTitle)),
                              ),
                            ),
                            Container(
                              height: 170,
                              width:
                                  (MediaQuery.sizeOf(context).width - 90) / 2,
                              margin: EdgeInsets.only(left: 30, bottom: 15),
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(info[b]["img"])),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(5, 5),
                                        blurRadius: 3,
                                        color: AppColor.gradientSecond
                                            .withOpacity(0.1)),
                                    BoxShadow(
                                        offset: Offset(-5, -5),
                                        blurRadius: 3,
                                        color: AppColor.gradientSecond
                                            .withOpacity(0.1))
                                  ]),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(info[b]["title"],
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColor.homeViewTitle)),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
