import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongController extends GetxController {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  List<SongModel> _songs = [];
  List<AlbumModel> _albums = [];
  List<SongModel> _songsOfAlbum = [];

  var selectedAlbum = AlbumModel({}).obs;

  Future<void> fetchSongs() async {
    final songs = await _audioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        sortType: null);
    _songs = songs;
    update();
  }

  Future<void> fetchAlbums() async {
    final albums = await _audioQuery.queryAlbums(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        sortType: null);
    _albums = albums;
    update();
  }

  Future<void> fetchSongOfAlbum(albumId,index) async {
    final songsOfAlbum =
        await _audioQuery.queryAudiosFrom(AudiosFromType.ALBUM_ID,albumId);
    _songsOfAlbum = songsOfAlbum;
    selectedAlbum.value = _albums[index];
    update();
  }

  List<SongModel> get songs => _songs;
  List<AlbumModel> get albums => _albums;
  List<SongModel> get songsOfAlbum => _songsOfAlbum;
}
