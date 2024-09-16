import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/const/Color.dart';
import 'package:music_box/controller/SongController.dart';

class AlbumDetailsView extends StatelessWidget {

  final albumId;
  final albumIdex;

  const AlbumDetailsView({super.key,required this.albumId,required this.albumIdex});

  @override
  Widget build(BuildContext context) {
    var songController = Get.put(SongController());

    return Scaffold(
      backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: whiteColor,
            foregroundColor: Colors.black,
          ),
      body: FutureBuilder<void>(
        future: songController.fetchSongOfAlbum(albumId,albumIdex),
        builder: (BuildContext context, snapshot) {
          return Container(
            decoration: BoxDecoration(color: whiteColor),
            child: ListView.builder(
              itemCount: songController.songsOfAlbum.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    
                    ListTile(
                      title: Text(songController.songsOfAlbum[index].title),
                      // subtitle: Text(songController.songsOfAlbum[index].artist!),
                      // leading: const CircleAvatar(child: Icon(Icons.album_rounded),),
                      onTap: () {
                        // Navigate to album details screen
                        print('Tapped on alum index ${songController.songsOfAlbum[index]}');
                      },
                    ),
                  ],
                );
              },
            ),
          );
        }),
    );
  }
}