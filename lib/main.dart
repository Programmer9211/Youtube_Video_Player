import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final YoutubePlayerController youtubePlayerController =
      YoutubePlayerController(
    initialVideoId:
        YoutubePlayer.convertUrlToId("https://youtu.be/uru-4RomjEU")!,
  );

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: youtubePlayerController,
      ),
      builder: (context, player) {
        return Scaffold(
          body: Column(
            children: [
              player,
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter Video URL",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  youtubePlayerController.load(
                    YoutubePlayer.convertUrlToId(_textEditingController.text)!,
                  );
                },
                child: Text("Play Video"),
              ),
            ],
          ),
        );
      },
    );
  }
}
