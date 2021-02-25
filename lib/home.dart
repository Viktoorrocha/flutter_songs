import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "assets/audios/");
  bool primeiraExecucao = true;

  _executar() async {
    if (primeiraExecucao) {
      audioPlayer = await audioCache.play("musica.mp3");
      primeiraExecucao = false;
    } else {
      audioPlayer.resume();
    }
  }

  _parar() async {
    int resultado = await audioPlayer.stop();
    if (resultado == 1) {}
  }

  pausar() async {
    int resultado = await audioPlayer.pause();
    if (resultado == 1) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Executando Sons"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                    child: Image.asset("assets/imagens/executar.png"),
                    onTap: () {
                      _executar();
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                    child: Image.asset("assets/imagens/pausar.png"),
                    onTap: () {
                      _executar();
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                    child: Image.asset("assets/imagens/parar.png"),
                    onTap: () {
                      _executar();
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
