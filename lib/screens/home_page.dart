import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:surah/model/surah_arabic.dart';
import 'package:surah/model/surah_model.dart';
import 'package:surah/service/all_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _controller = ScrollController();
  AudioPlayer audioPlayer = AudioPlayer();
  List plays = List.generate(300, (index) => false);
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((event) {
      for (var item in plays) {
        plays[item] = event == PlayerState.PLAYING;
      }
    });

    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text(
          'Baqara surasi',
          style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (e) async {
                if (e == 1) {
                } else if (e == 2) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text(
                            "Bu loyiha Foziljonov Abdulloh tomonidan 2022-yilda ishlab chiqildi",
                          ),
                        );
                      });
                } else if (e == 3) {}
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text("O'qish rejimi"),
                      value: 1,
                    ),
                    const PopupMenuItem(
                      child: Text("Sura haqida"),
                      value: 2,
                    ),
                    const PopupMenuItem(
                      child: Text("Sozlamalar"),
                      value: 3,
                    )
                  ])
        ],
      ),
      body: Scrollbar(
        controller: _controller,
        thickness: 10,
        child: FutureBuilder(
            future: Future.wait([
              SurahService().fetchSurahArabic(),
              SurahService().fetchSurahUzbek(),
            ]),
            builder: (context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              if (snapshot.hasData) {
                List<SurahModelUzbek>? snapUz = snapshot.data![1];
                List<SurahArabic> snapAr = snapshot.data![0];
                return ListView.builder(
                    itemBuilder: (_, __) {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SelectableText(
                                  snapAr[__].text.toString(),
                                  style: const TextStyle(fontSize: 22),
                                  textAlign: TextAlign.end,
                                ),
                                const SizedBox(height: 10),
                                SelectableText(
                                  snapUz![__].text.toString(),
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      color: Colors.green[900],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          snapAr[__].numberInSurah.toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Wrap(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.green[900],
                                          child: IconButton(
                                            onPressed: () async {
                                              if (plays[__]) {
                                                await audioPlayer.pause().then(
                                                    (value) => setState(() {
                                                          plays[__] = plays[__]
                                                              ? false
                                                              : true;
                                                        }));
                                              } else {
                                                String url =
                                                    snapAr[__].audio.toString();
                                                await audioPlayer
                                                    .play(url)
                                                    .then(
                                                      (value) => setState(
                                                        () {
                                                          plays[__] = plays[__]
                                                              ? false
                                                              : true;
                                                        },
                                                      ),
                                                    );
                                              }
                                            },
                                            icon: plays[__]
                                                ? const Icon(Icons.pause)
                                                : const Icon(Icons.play_arrow),
                                            color: Colors.orange.shade100,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(height: 1, color: Colors.black45),
                        ],
                      );
                    },
                    itemCount: snapAr.length);
              }
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }),
      ),
    );
  }
}
