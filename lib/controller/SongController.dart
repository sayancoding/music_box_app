import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongController extends GetxController {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  List<SongModel> _songs = [];

  Future<void> fetchSongs() async {
    final songs = await _audioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        sortType: SongSortType.TITLE);
    _songs = songs;
    update();
  }

  List<SongModel> get songs => _songs;
}
