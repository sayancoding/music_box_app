import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/const/Color.dart';
import 'package:music_box/const/TextStyle.dart';
import 'package:music_box/controller/PlayerController.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongCard extends StatelessWidget {
  final SongModel songModel;

  const SongCard({
    super.key,
    required this.songModel,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());

    return Obx(
      () => Container(
        margin: const EdgeInsets.only(bottom: 2),
        padding: const EdgeInsets.only(left: 10, top: 8, right: 10, bottom: 8),
        height: 64,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: whiteColor,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(249, 230, 229, 229),
                blurRadius: 2.0,
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                QueryArtworkWidget(
                  id: songModel.id,
                  type: ArtworkType.AUDIO,
                  nullArtworkWidget: const Icon(Icons.music_note_rounded,
                      color: Colors.black54, size: 50),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    print("Playing song..");
                    controller.playAudio(songModel.uri, songModel.id);
                  },
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          songModel.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: ourTextStyle(
                              fontSize: 14,
                              color: (controller.isPlaying.value &&
                                      controller.playIndex.value ==
                                          songModel.id)
                                  ? primaryColor
                                  : darkColor,
                              fontFamily: (controller.isPlaying.value &&
                                      controller.playIndex.value ==
                                          songModel.id)
                                  ? bold
                                  : semiBold,
                              letterSpacing: 0.9),
                        ),
                        Text(
                          "${songModel.artist}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: ourTextStyle(
                              fontSize: 10,
                              fontFamily: light,
                              color: darkColor,
                              letterSpacing: 1),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Icon(Icons.more_horiz_rounded)
          ],
        ),
      ),
    );
  }
}
