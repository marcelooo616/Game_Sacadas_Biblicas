import 'package:audioplayers/audioplayers.dart';
import 'package:projetct_quiz_god/src/models/services/AmbientMusicSerice.dart';

class AmbientMusicaServiceImpl implements AmbientMusicService{

  AudioPlayer player = AudioPlayer();
  bool isPlaying = false;

  @override
  void mixVolume(double volume) async{
    // TODO: implement mixVolume
    await player.setVolume(volume);
  }

  @override
  void runAudio(String path) async {
    // TODO: implement runAudio
    print("Iniciando metodo! status: " + isPlaying.toString());
    if(isPlaying){
      print("musicas ja esta rolando voltar status: " + isPlaying.toString());
    }else{
      try {
        print("inicinado musica pimeira vez status: " + isPlaying.toString() );
        await player.play(
          AssetSource(path),
          volume: 7, // Volume (0.0 a 1.0)
        );
        isPlaying = true;
      } catch (error) {
        print(error.toString());
      }
      player.onPlayerComplete.listen((event) {
        // Independentemente da música estar tocando ou não, redefina isPlaying para false
        isPlaying = false;
        print("Reprodução da música finalizada. Status: " + isPlaying.toString());
      });
    }
  }


  @override
  void stopAudio() async{
    // TODO: implement stopAudio
    await player.pause();
  }

  @override
  void resumeAudio() async {
    // TODO: implement resumeAudio
    await player.resume();
  }



}