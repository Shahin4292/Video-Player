import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../res/color/colors.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool _isPlaying = false;
  bool _playArea = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: _playArea == false
                ? BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                        AppColor.gradientFirst.withOpacity(0.9),
                        AppColor.gradientSecond
                      ],
                        begin: FractionalOffset(8.8, 0.4),
                        end: Alignment.topRight))
                : BoxDecoration(color: AppColor.gradientSecond),
            child: Column(children: [
              _playArea == false
                  ? Container(
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
                                    size: 20,
                                    color: AppColor.secondViewIconColor),
                              ),
                              Icon(Icons.info_outline,
                                  size: 25,
                                  color: AppColor.secondViewIconColor),
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
                                          AppColor
                                              .secondViewContainerGradient1stColor,
                                          AppColor
                                              .secondViewContainerGradient2ndColor
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 5,
                                  children: [
                                    Icon(Icons.timer_outlined,
                                        color: AppColor.secondViewIconColor,
                                        size: 20),
                                    Text("68 min",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                AppColor.secondViewIconColor)),
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
                                          AppColor
                                              .secondViewContainerGradient1stColor,
                                          AppColor
                                              .secondViewContainerGradient2ndColor
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 5,
                                  children: [
                                    Icon(Icons.handyman_outlined,
                                        color: AppColor.secondViewIconColor,
                                        size: 20),
                                    Text("Resistent band, kettebell",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                AppColor.secondViewIconColor)),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  : Container(
                      child: Column(
                      children: [
                        Container(
                          height: 100,
                          padding:
                              EdgeInsets.only(top: 50, left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Icon(Icons.arrow_back_ios,
                                    size: 20,
                                    color: AppColor.secondViewIconColor),
                              ),
                              Icon(Icons.info_outline,
                                  size: 20,
                                  color: AppColor.secondViewIconColor),
                            ],
                          ),
                        ),
                        _playView(context),
                        _controlView(context),
                      ],
                    )),
              // _playView(context),
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(70))),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              right: 30, left: 30, top: 30),
                          child: Column(spacing: 10, children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Circuit 1: Legs Toning",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.circuitsColor)),
                                  Row(spacing: 5, children: [
                                    Icon(Icons.loop,
                                        size: 20, color: AppColor.loopColor),
                                    Text("3 sec",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: AppColor.setsColor)),
                                  ])
                                ]),
                            Expanded(child: _listView())
                          ]))))
            ])));
  }

  String convertTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value?.volume ?? 0) > 0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0);
    final secs = convertTwo(remained % 60.0.toInt());
    return Container(
      height: 45,
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.only(bottom: 5),
      color: AppColor.gradientSecond,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              if (noMute) {
                _controller?.setVolume(0);
              } else {
                _controller?.setVolume(1.0);
              }
              setState(() {});
            },
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        offset: Offset(0.0, 0.0),
                        blurRadius: 4.0,
                        color: Color.fromARGB(50, 0, 0, 0))
                  ]),
                  child: Icon(noMute ? Icons.volume_up : Icons.volume_off,
                      color: Colors.white, size: 30),
                )),
          ),
          TextButton(
              onPressed: () async {
                final index = _isPlayingIndex - 1;
                if (index > 0 && videoInfo.length >= 0) {
                  _initializeVideo(index);
                } else {
                  Get.snackbar("Video List", "",
                      snackPosition: SnackPosition.BOTTOM,
                      icon: Icon(Icons.face, size: 30, color: Colors.white),
                      backgroundColor: AppColor.gradientSecond,
                      colorText: Colors.white,
                      messageText: Text("No more video ahead!",
                          style: TextStyle(color: Colors.white, fontSize: 20)));
                }
              },
              child: Icon(Icons.fast_rewind, size: 36, color: Colors.white)),
          TextButton(
              onPressed: () async {
                if (_isPlaying) {
                  setState(() {
                    _isPlaying = false;
                  });
                  _controller?.pause();
                } else {
                  setState(() {
                    _isPlaying = true;
                  });
                  _controller?.play();
                }
              },
              child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 36, color: Colors.white)),
          TextButton(
              onPressed: () async {
                final index = _isPlayingIndex + 1;
                if (index <= videoInfo.length - 1) {
                  _initializeVideo(index);
                } else {
                  Get.snackbar("Video List", "",
                      snackPosition: SnackPosition.BOTTOM,
                      icon: Icon(Icons.face, size: 30, color: Colors.white),
                      backgroundColor: AppColor.gradientSecond,
                      colorText: Colors.white,
                      messageText: Text("you have finished the all video!",
                          style: TextStyle(color: Colors.white, fontSize: 20)));
                }
              },
              child: Icon(Icons.fast_forward, size: 36, color: Colors.white)),
          Text(
            "$mins:$secs",
            style: TextStyle(color: Colors.white, shadows: <Shadow>[
              Shadow(
                  offset: Offset(0.0, 1.0),
                  blurRadius: 4.0,
                  color: Color.fromARGB(150, 0, 0, 0))
            ]),
          )
        ],
      ),
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
              child: Text(
            "Please Wait....",
            style: TextStyle(fontSize: 20, color: Colors.white),
          )));
    }
  }

  var _onUpdateControllerTime;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;

  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;
    final controller = _controller;
    if (controller == null) {
      debugPrint("Controller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("Controller not initialized");
      return;
    }
    _duration ??= _controller?.value.duration;
    // if (_duration == null) {
    //   _duration = _controller?.value.duration;
    // }
    var duration = _duration;
    if (duration == null) return;

    var position = await controller.position;
    _position = position;

    final playing = controller.value.isPlaying;
    if (playing) {
      if (_disposed) return;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() /
            duration.inMilliseconds.ceilToDouble();
      });
    }
    _isPlaying = playing;
  }

  _initializeVideo(int index) {
    final controller =
        VideoPlayerController.network(videoInfo[index]["videoUrl"]);
    final old = _controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    _controller = controller;
    setState(() {});
    controller.initialize().then((_) {
      old?.dispose();
      _isPlayingIndex = index;
      controller.addListener(_onControllerUpdate);
      controller.play();
      setState(() {});
    });
  }

  _listView() {
    return ListView.builder(
        itemCount: videoInfo.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _initializeVideo(index);
              debugPrint(index.toString());
              setState(() {
                if (_playArea == false) {
                  _playArea = true;
                }
              });
            },
            child: _buildCard(index),
          );
        });
  }

  _buildCard(int index) {
    return Container(
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
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(videoInfo[index]["thumbnail"]),
                        fit: BoxFit.cover)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    videoInfo[index]["title"],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    videoInfo[index]["time"],
                    style: TextStyle(color: Colors.grey[500]),
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
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text("15s rest",
                      style: TextStyle(color: Color(0xFF839fed))),
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
                                color: Color(0xFF839fed),
                                borderRadius: BorderRadius.circular(2)))
                        : Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2)))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
