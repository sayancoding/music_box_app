import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/controller/SongController.dart';
import 'package:music_box/views/AlbumDetailsView.dart';

class AlbumsListView extends StatelessWidget {
  const AlbumsListView({super.key});

  @override
  Widget build(BuildContext context) {
    var songController = Get.put(SongController());
    print(songController.albums);
    return FutureBuilder<void>(
        future: songController.fetchAlbums(),
        builder: (BuildContext context, snapshot) {
          return ListView.builder(
            itemCount: songController.albums.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(songController.albums[index].album),
                subtitle: Text(songController.albums[index].artist!),
                leading: const CircleAvatar(
                  child: Icon(Icons.album_rounded),
                ),
                onTap: () {
                  // Navigate to album details screen
                  print('Tapped on alum index ${songController.albums[index]}');
                  Get.to(() => AlbumDetailsView(
                        albumId: songController.albums[index].id,
                        albumIdex: index,
                        albumName: songController.albums[index].album,
                      ));
                },
              );
            },
          );
        });
  }
}
