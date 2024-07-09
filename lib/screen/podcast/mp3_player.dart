import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:winners/shared/openDrawer.dart';
import 'package:winners/shared/themes.dart';
import 'package:winners/shared/widget/BackgroundImage.dart';
import 'package:winners/utils/timeFormate.dart';

class Mp3PlayerScreen extends StatefulWidget {
  @override
  State<Mp3PlayerScreen> createState() => _Mp3PlayerScreenState();
}

class _Mp3PlayerScreenState extends State<Mp3PlayerScreen> {
  // final audioPlayer = AudioPlayer();
  late AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState() {
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    setAudio();
    super.initState();
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    String url =
        'https://cdn.trendybeatz.com/audio/Timiraj-Heavens-Chant-1-(TrendyBeatz.com).mp3';
    await audioPlayer.setSourceUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const BackgroundImage(
          image: 'assets/images/ft_church.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Flexible(
                flex: 2,
                child: Center(
                    child: Image(
                  image: AssetImage('assets/images/login.png'),
                  fit: BoxFit.cover,
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "At the End it Shall Speak",
                  style: regular24pt,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "Message title",
                style: kBodyText,
              ),
              Slider(
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                  await audioPlayer.resume();
                },
                min: 0,
                max: duration.inSeconds.toDouble(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formateTime(position),
                      style: regular12pt,
                    ),
                    Text(
                      formateTime(duration - position),
                      style: regular12pt,
                    )
                  ],
                ),
              ),
              CircleAvatar(
                radius: 30,
                child: IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 35,
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.resume();
                    }
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
