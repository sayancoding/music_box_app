import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/const/Color.dart';
import 'package:music_box/const/TextStyle.dart';
import 'package:music_box/controller/PlayerController.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());

    return Container(
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
          appBar: AppBar(
            foregroundColor: Colors.black,
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Container(
                      width: 220,
                      height: 220,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white60),
                      child: QueryArtworkWidget(
                        id: controller.currentSongModel.id,
                        type: ArtworkType.AUDIO,
                        nullArtworkWidget: const Icon(
                          Icons.music_note_rounded,
                          size: 120,
                        ),
                      )),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.currentSongModel.title,
                    textAlign: TextAlign.center,
                    style: ourTextStyle(
                        fontSize: 20, fontFamily: semiBold, letterSpacing: 1),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    controller.currentSongModel.artist!,
                    style: ourTextStyle(
                        fontSize: 14, fontFamily: regular, letterSpacing: 1),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              SizedBox(
                height: 28,
              ),
              Expanded(
                  child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.playlist_add_circle),
                      Icon(Icons.favorite_outline_rounded),
                      Icon(Icons.alarm_add_rounded),
                      Icon(Icons.more_horiz_rounded),
                    ],
                  ),
                  Obx(
                    () => Container(
                      margin: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text(controller.position.value),
                          Expanded(
                              child: Slider(
                                  min: 0.0,
                                  max: controller.maxVal.value,
                                  activeColor: primaryColor,
                                  thumbColor: primaryColor,
                                  value: controller.currentVal.value,
                                  allowedInteraction: SliderInteraction.slideOnly,
                                  onChanged: (newValue) {
                                    controller.currentVal.value = newValue;
                                    controller.seekAudio();
                                  })),
                          Text(controller.duration.value),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.shuffle_rounded),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                color: darkColor,
                                icon: const Icon(
                                  Icons.skip_previous_rounded,
                                  size: 30,
                                )),
                            (controller.isPlaying.value == true)
                                ? IconButton(
                                    onPressed: () {
                                      controller.pauseAudio();
                                    },
                                    color: darkColor,
                                    icon: const Icon(
                                      Icons.pause_circle_filled_rounded,
                                      size: 60,
                                    ))
                                : IconButton(
                                    onPressed: () {
                                      controller.resumeAudio();
                                    },
                                    color: darkColor,
                                    icon: const Icon(
                                      Icons.play_circle_fill_rounded,
                                      size: 60,
                                    )),
                            IconButton(
                                onPressed: () {
                                  controller.playNextSong();
                                },
                                color: darkColor,
                                icon: const Icon(
                                  Icons.skip_next_rounded,
                                  size: 30,
                                ))
                          ],
                        ),
                        Icon(Icons.list_rounded),
                      ],
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      );
  }
}
