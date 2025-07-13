
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(HurufApp());
}

class HurufApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Huruf',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> hurufList = List.generate(26, (i) => String.fromCharCode(65 + i));
  final AudioPlayer player = AudioPlayer();

  void playHuruf(String huruf) {
    player.play(AssetSource('audio/huruf/\$huruf.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(title: Text('Belajar Huruf')),
      body: GridView.count(
        crossAxisCount: 4,
        padding: EdgeInsets.all(10),
        children: hurufList.map((huruf) {
          return GestureDetector(
            onTap: () => playHuruf(huruf),
            child: Card(
              color: Colors.white,
              child: Center(
                child: Text(
                  huruf,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
