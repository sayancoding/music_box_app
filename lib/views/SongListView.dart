import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/controller/SongController.dart';
import 'package:music_box/widgets/SongCard.dart';

class SongListView extends StatelessWidget {
  const SongListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var songController = Get.put(SongController());

    return FutureBuilder<void>(
          future: songController.fetchSongs(),
          builder: (BuildContext context, snapshot) {
            return Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              child: ListView.builder(
                itemCount: songController.songs.length,
                itemBuilder: (context, index) {
                  return SongCard(
                      index: index,
                      songModel: songController.songs[index]);
                },
              ),
            );
          });
  }
}
