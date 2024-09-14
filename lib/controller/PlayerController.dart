import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  final audioQuery = OnAudioQuery();
  final audioPlayer = AudioPlayer();

  var playIndex = 0.obs;
  var isPlaying = false.obs;

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

  playAudio(String? path,int index){
    playIndex.value = index;
    isPlaying.value = true;
    audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(path!)));
    audioPlayer.play();
  }
  pauseAudio(){
    audioPlayer.pause();
    // isPlaying.value = false;
  }
}
