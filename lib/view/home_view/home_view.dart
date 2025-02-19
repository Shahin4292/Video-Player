import 'package:flutter/material.dart';
import 'package:video_player/res/color/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homeViewBackground,
      body: Container(
        padding: EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
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
                Icon(Icons.arrow_forward,
                    size: 20, color: AppColor.homeViewIcons)
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
                        bottomRight: Radius.circular(10))))
          ],
        ),
      ),
    );
  }
}
