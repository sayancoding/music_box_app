import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/controller/PlayerController.dart';
import 'package:music_box/widgets/SongCard.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongListView extends StatelessWidget {
  const SongListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());

    return FutureBuilder<List<SongModel>>(
        future: controller.audioQuery.querySongs(
            ignoreCase: true,
            orderType: OrderType.ASC_OR_SMALLER,
            uriType: UriType.EXTERNAL,
            sortType: SongSortType.TITLE),
        builder: (BuildContext context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data?.isEmpty == true) {
            return const Center(
              child: Text("No Songs found"),
            );
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return SongCard(songModel: snapshot.data![index],);
                });
          }
        });
    // return const Text("Songs");
  }
}
