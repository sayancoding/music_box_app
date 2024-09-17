
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  final audioQuery = OnAudioQuery();
  final audioPlayer = AudioPlayer();

  var playIndex = 0.obs;
  var playSongId = 0.obs;
  var isPlaying = false.obs;
  var currentSongModel = SongModel({}).obs;

  var duration = "".obs;
  var position = "".obs;

  var maxVal = 0.0.obs;
  var currentVal = 0.0.obs;


  @override
  void onInit() {
    super.onInit();
    checkPermission();
  }

  checkPermission() async {
    print("Getting Audio Permission..");
    var permission = Permission.audio.request();
    if (await permission.isGranted) {
      print("Granting Audio Permission..");
    } else {
      checkPermission();
    }
  }

  updatePosition() {
    audioPlayer.durationStream.listen((d) {
      duration.value = d.toString().split(".")[0];
      maxVal.value = d!.inSeconds.toDouble();
    });
    audioPlayer.positionStream.listen((p) {
      position.value = p.toString().split(".")[0];
      currentVal.value = p.inSeconds.toDouble();
      if(currentVal.value >= maxVal.value - 1.0){
        isPlaying.value = false;
        audioPlayer.pause();
      }
    });
  }

  playAudio(SongModel? songModel, int index) {
    currentSongModel.value = songModel!;
    playIndex.value = index;
    playSongId.value = songModel.id;
    isPlaying.value = true;
    audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(songModel.uri!)));
    updatePosition();
    audioPlayer.play();
  }

  pauseAudio() {
    audioPlayer.pause();
    isPlaying.value = false;
  }

  resumeAudio() {
    isPlaying.value = true;
    audioPlayer.play();
  }

  seekAudio() {
    audioPlayer.seek(Duration(seconds: currentVal.value.toInt()));
  }

  playNextSong() async {
    playIndex.value = playIndex.value + 1;
    final songs = await audioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        sortType: null);
    playAudio(songs[playIndex.value], playIndex.value);
  }

  playPrevSong() async {
    if (playIndex.value > 0) {
      playIndex.value = playIndex.value - 1;
      final songs = await audioQuery.querySongs(
          ignoreCase: true,
          orderType: OrderType.ASC_OR_SMALLER,
          uriType: UriType.EXTERNAL,
          sortType: null);
      playAudio(songs[playIndex.value], playIndex.value);
    }
  }
}
