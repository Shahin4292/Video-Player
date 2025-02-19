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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Training",
                    style: TextStyle(
                        fontSize: 30,
                        color: AppColor.homeViewTitle,
                        fontWeight: FontWeight.w700)),
                Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.arrow_back_ios,
                        size: 20, color: AppColor.homeViewIcons),
                    Icon(Icons.calendar_today_outlined,
                        size: 20, color: AppColor.homeViewIcons),
                    Icon(Icons.arrow_forward_ios,
                        size: 20, color: AppColor.homeViewIcons),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
