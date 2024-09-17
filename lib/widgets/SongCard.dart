import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/const/Color.dart';
import 'package:music_box/const/TextStyle.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../controller/PlayerController.dart';

class SongCard extends StatelessWidget {
  final index;
  final SongModel songModel;

  const SongCard({super.key, required this.index, required this.songModel});

  @override
  Widget build(BuildContext context) {
    var playerController = Get.put(PlayerController());
    return Obx(
      () => ListTile(
        leading: QueryArtworkWidget(
          id: songModel.id,
          type: ArtworkType.AUDIO,
          nullArtworkWidget: const Icon(Icons.music_note_rounded,
              color: Colors.black54, size: 50),
        ),
        title: InkWell(
          onTap: () {
            print("Playing song..");
            playerController.playAudio(songModel, index);
            // Get.to(() => PlayerView());
          },
          splashColor: Colors.transparent,
          child: Text(
            songModel.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
            style: ourTextStyle(
                fontSize: 14,
                color: (playerController.isPlaying.value &&
                        playerController.playSongId.value == songModel.id)
                    ? primaryColor
                    : darkColor,
                fontFamily: (playerController.isPlaying.value &&
                        playerController.playSongId.value == songModel.id)
                    ? bold
                    : semiBold,
                letterSpacing: 0.9),
          ),
        ),
        subtitle: InkWell(
          onTap: () {
            print("Playing song..");
            playerController.playAudio(songModel, index);
            // Get.to(() => PlayerView());
          },
          splashColor: Colors.transparent,
          child: Text(
            songModel.artist!,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
            style: ourTextStyle(
                fontSize: 10,
                fontFamily: light,
                color: darkColor,
                letterSpacing: 1),
          ),
        ),
        trailing: const Icon(Icons.more_horiz_rounded),
      ),
    );
  }
}
