import 'package:flutter/material.dart';
import 'package:surah/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSurah extends StatelessWidget {
  AboutSurah({Key? key}) : super(key: key);
  final Uri _url = Uri.parse(
      "https://aniq.uz/yangiliklar/baqara-surasi-nega-aynan-baqara-deb-nomlangan");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text(
          'Бақара сураси',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              aboutSurah,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: Row(
              children: [
                const Text(
                  "Манба: ",
                  style: TextStyle(fontSize: 20),
                ),
                InkWell(
                    child: const Text(
                      'аник.уз ',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    onTap: () => _launchUrl()),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.orange.shade100,
    );
  }

  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}
