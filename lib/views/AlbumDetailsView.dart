import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/const/Color.dart';
import 'package:music_box/controller/PlayerController.dart';
import 'package:music_box/controller/SongController.dart';
import 'package:music_box/views/PlayerView.dart';
import 'package:music_box/widgets/SongCard.dart';

class AlbumDetailsView extends StatelessWidget {
  final albumId;
  final albumIdex;
  final albumName;
  final songCount;

  const AlbumDetailsView(
      {super.key,
      required this.albumId,
      required this.albumIdex,
      required this.albumName,
      this.songCount});

  @override
  Widget build(BuildContext context) {
    var songController = Get.put(SongController());
    var playController = Get.put(PlayerController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: whiteColor,
        foregroundColor: Colors.black,
        title: Text(albumName),
      ),
      body: FutureBuilder<void>(
          future: songController.fetchSongOfAlbum(albumId, albumIdex),
          builder: (BuildContext context, snapshot) {
            return Container(
              decoration: BoxDecoration(color: whiteColor),
              child: ListView.builder(
                itemCount: songController.songsOfAlbum.length,
                itemBuilder: (context, index) {
                  return SongCard(
                      index: index,
                      songModel: songController.songsOfAlbum[index]);
                },
              ),
            );
          }),
          floatingActionButton: Obx(
            ()=> Container(
              child: (playController.isPlaying.value)? FloatingActionButton(
                  backgroundColor: primaryColor,
                  foregroundColor: whiteColor,
                  shape: const CircleBorder(),
                  onPressed: () {
                    print("floating acton button is clicked");
                    Get.to(()=>const PlayerView());
                  },
                  child: Icon(Icons.play_arrow_rounded),
                ):null,
            ),
          )
    );
  }
}
