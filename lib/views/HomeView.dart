import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:music_box/const/TextStyle.dart';
import 'package:music_box/const/color.dart';
import 'package:music_box/controller/PlayerController.dart';
import 'package:music_box/views/AlbumListView.dart';
import 'package:music_box/views/PlayerView.dart';
import 'package:music_box/views/SongListView.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());

    return Obx(
      () => DefaultTabController(
        length: 7,
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromRGBO(253, 253, 255, 1),
                Color.fromRGBO(233, 233, 233, 0.973),
              ])),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 2.0, right: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.sort_rounded,
                              color: darkColor,
                            ),
                          ),
                          InkWell(
                            child: Icon(Icons.search_rounded, color: darkColor),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 14.0, left: 2.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hi Sayan,",
                                  style: ourTextStyle(
                                      color: primaryColor,
                                      fontSize: 22.0,
                                      fontFamily: bold,
                                      letterSpacing: 1.0)),
                              Text("What would you like to listen ?",
                                  style: ourTextStyle(
                                      fontSize: 12.0,
                                      fontFamily: light,
                                      letterSpacing: 0.5))
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: TabBar(
                          isScrollable: true,
                          labelStyle: ourTextStyle(
                              fontFamily: semiBold,
                              fontSize: 16.0,
                              color: primaryColor,
                              letterSpacing: 1.0),
                          indicator: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 2.0, color: primaryColor)),
                          ),
                          dividerColor: Colors.transparent,
                          tabAlignment: TabAlignment.start,
                          tabs: const [
                            Tab(text: "Recent"),
                            Tab(
                              text: "Songs",
                            ),
                            Tab(
                              text: "Playlist",
                            ),
                            Tab(
                              text: "Album",
                            ),
                            Tab(
                              text: "Artiest",
                            ),
                            Tab(
                              text: "Folder",
                            ),
                            Tab(
                              text: "Favorite",
                            ),
                          ]),
                    ),
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TabBarView(
                        children: [
                          Text(
                            "Recent",
                            style: ourTextStyle(),
                          ),
                          const SongListView(),
                          Text(
                            "Playlist",
                            style: ourTextStyle(),
                          ),
                        const AlbumsListView(),
                          Text(
                            "Artiest",
                            style: ourTextStyle(),
                          ),
                          Text(
                            "Folder",
                            style: ourTextStyle(),
                          ),
                          Text(
                            "Favorites",
                            style: ourTextStyle(),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              )),
              floatingActionButton: (controller.isPlaying.value)? FloatingActionButton(
                backgroundColor: primaryColor,
                foregroundColor: whiteColor,
                shape: const CircleBorder(),
                onPressed: () {
                  print("floating acton button is clicked");
                  Get.to(()=>const PlayerView());
                },
                child: Icon(Icons.play_arrow_rounded),
              ):null),
        ),
      ),
    );
  }
}
