import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:surah/Cubit/cubit/text_cubit.dart';
import 'package:surah/components.dart';
import 'package:surah/model/surah_arabic.dart';
import 'package:surah/model/surah_model.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:surah/screens/about_surah.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _controller = ScrollController();

  AudioPlayer audioPlayer = AudioPlayer();
  bool plays = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  List<SurahArabic>? snapAr;
  List<SurahModelUzbek>? snapUz;
  @override
  void initState() {
    super.initState();
    snapAr = Arabic.map((e) => SurahArabic.fromJson(e)).toList();
    snapUz = surah.map((e) => SurahModelUzbek.fromJson(e)).toList();
    audioPlayer.onPlayerStateChanged.listen((event) {
      plays = event == PlayerState.PLAYING;
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
          'Бақара сураси',
          style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (e) async {
                if (e == 1) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutSurah()));
                } else if (e == 2) {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return BottomSheet(
                          onClosing: () {},
                          builder: (BuildContext context) {
                            return BlocBuilder<TextCubit, double>(
                                builder: (context, state) {
                              return SizedBox(
                                height: 250,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 250,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(
                                              textSizeUzbek[index][0],
                                              style: TextStyle(
                                                  fontSize: textSizeUzbek[index]
                                                      [1]),
                                            ),
                                            trailing: Text(
                                              textSizeUzbek[index][1]
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: textSizeUzbek[index]
                                                      [1]),
                                            ),
                                            onTap: () {
                                              context
                                                  .read<TextCubit>()
                                                  .setUzfontsize(
                                                      textSizeUzbek[index][1]);
                                            },
                                          );
                                        },
                                        itemCount: textSizeUzbek.length,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                          });
                    },
                  );
                } else if (e == 3) {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return BottomSheet(
                          onClosing: () {},
                          builder: (BuildContext context) {
                            return BlocBuilder<TextCubit, double>(
                                builder: (context, state) {
                              return SizedBox(
                                height: 300,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 300,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(
                                              textSizeArabic[index][0],
                                              style: TextStyle(
                                                  fontSize:
                                                      textSizeArabic[index][1]),
                                            ),
                                            trailing: Text(
                                              textSizeArabic[index][1]
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                      textSizeArabic[index][1]),
                                            ),
                                            onTap: () {
                                              context
                                                  .read<TextCubit>()
                                                  .setArfontsize(
                                                      textSizeArabic[index][1]);
                                            },
                                          );
                                        },
                                        itemCount: textSizeArabic.length,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                          });
                    },
                  );
                } else if (e == 4) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text(
                            "Бу дастур 2022-йилда Фозилжонов Абдуллох томонидан ишлаб чикилди.Дастурда Шайх МухаммадСодык МухаммадЮсуф хазратларининг тафсирларидан  ва  Мишари Рашид Альафасининг тиловатыдан фойдаланилди.",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        );
                      });
                }else if (e == 5) {
                    showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return BottomSheet(
                          onClosing: () {},
                          builder: (BuildContext context) {
                            return BlocBuilder<TextCubit, double>(
                                builder: (context, state) {
                              return SizedBox(
                                height: 300,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 300,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(
                                              textSizeTranskripsiya[index][0],
                                              style: TextStyle(
                                                  fontSize:
                                                      textSizeTranskripsiya[index][1]),
                                            ),
                                            trailing: Text(
                                              textSizeTranskripsiya[index][1]
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                      textSizeTranskripsiya[index][1]),
                                            ),
                                            onTap: () {
                                              context
                                                  .read<TextCubit>()
                                                  .setTranskripsiya(
                                                      textSizeTranskripsiya[index][1]);
                                            },
                                          );
                                        },
                                        itemCount: textSizeArabic.length,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                          });
                    },
                  );
                }
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text("Сура хакида"),
                      value: 1,
                    ),
                    const PopupMenuItem(
                      child: Text("Дастур хакида"),
                      value: 4,
                    ),
                    const PopupMenuItem(
                      child: Text("Узбек хажми "),
                      value: 2,
                    ),
                    const PopupMenuItem(
                      child: Text("Арабий хажми "),
                      value: 3,
                    ),
                    const PopupMenuItem(
                      child: Text("Транскрипсия хажми "),
                      value: 5,
                    )
                  ])
        ],
      ),
      body: Scrollbar(
        showTrackOnHover: true,
        controller: _controller,
        thickness: 10,
        child: BlocBuilder<TextCubit, double>(
          builder: (context, state) {
            var cubit = context.watch<TextCubit>();
            return ListView.builder(
                itemBuilder: (_, __) {
                  ArabicNumbers arabicNumber = ArabicNumbers();
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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: CircleAvatar(
                                backgroundColor: Colors.green[900],
                                child: IconButton(
                                  onPressed: () async {
                                    FlutterClipboard.copy(
                                            snapAr![__].text.toString())
                                        .then((value) {
                                      Fluttertoast.showToast(
                                        msg: "Copied",
                                        toastLength: Toast.LENGTH_LONG,
                                        fontSize: cubit.arfontsize,
                                      );
                                    });
                                  },
                                  icon: const Icon(Icons.copy),
                                  color: Colors.orange.shade100,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: SelectableText(
                                snapAr![__].text.toString(),
                                style: TextStyle(
                                  fontSize: cubit.arfontsize,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SelectableText(
                              snapUz![__].chapter.toString(),
                              style: TextStyle(
                                  fontSize: cubit.transkripsiyasize,
                                  color: Colors.black.withOpacity(0.5)),
                                  textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 10),
                            SelectableText(
                              snapUz![__].text.toString(),
                              style: TextStyle(
                                fontSize: cubit.uzfontsize,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Visibility(
                                  visible: snapAr![__].numberInSurah == 0
                                      ? false
                                      : true,
                                  child: Card(
                                    color: Colors.green[900],
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 6),
                                      child: Text(
                                        "${snapAr![__].numberInSurah.toString()} | ${arabicNumber.convert(snapAr![__].numberInSurah.toString())}",
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.green[900],
                                        child: IconButton(
                                          onPressed: () async {
                                            if (plays) {
                                              await audioPlayer
                                                  .pause()
                                                  .then((value) => setState(() {
                                                        plays = plays
                                                            ? false
                                                            : true;
                                                      }));
                                            } else {
                                              String url =
                                                  snapAr![__].audio.toString();
                                              await audioPlayer.play(url).then(
                                                    (value) => setState(
                                                      () {
                                                        plays = plays
                                                            ? false
                                                            : true;
                                                      },
                                                    ),
                                                  );
                                            }
                                          },
                                          icon: const Icon(Icons.play_arrow),
                                          color: Colors.orange.shade100,
                                        ),
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.green[900],
                                        child: IconButton(
                                          onPressed: () async {
                                            FlutterClipboard.copy(
                                                    snapUz![__].text.toString())
                                                .then((value) {
                                              Fluttertoast.showToast(
                                                msg: "Copied",
                                                toastLength: Toast.LENGTH_LONG,
                                                fontSize: 20,
                                              );
                                            });
                                          },
                                          icon: const Icon(Icons.copy),
                                          color: Colors.orange.shade100,
                                        ),
                                      ),
                                    ],
                                  ),
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
                itemCount: snapAr!.length);
          },
        ),
      ),
      floatingActionButton: Container(
        height: 110,
        margin: const EdgeInsets.only(left: 30),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Slider(
                    value: position.inSeconds.toDouble(),
                    min: 0.0,
                    max: duration.inSeconds.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        seekToSecond(value.toInt());
                        value = value;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(position.toString().split('.').first),
                      Text(duration.toString().split('.').first),
                    ],
                  ),
                )
              ],
            ),
            CircleAvatar(
              backgroundColor: Colors.green[900],
              child: IconButton(
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  if (plays) {
                    await audioPlayer.pause().then((value) => setState(() {
                          plays = plays ? false : true;
                        }));
                  } else {
                    String url = "https://server8.mp3quran.net/afs/002.mp3";
                    await audioPlayer.play(url).then(
                          (value) => setState(
                            () {
                              plays = plays ? false : true;
                            },
                          ),
                        );
                  }
                },
                icon: plays
                    ? const Icon(Icons.pause)
                    : const Icon(Icons.play_arrow),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    audioPlayer.seek(newDuration);
  }
}
