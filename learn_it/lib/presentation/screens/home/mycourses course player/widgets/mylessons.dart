import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/mycourses%20course%20player/mycourseplayer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyLesson extends StatelessWidget {
  const MyLesson({
    super.key,
    required this.description,
    required this.url,
    required this.document,
    required this.player, required this.courseid,
  });

  final String description;
  final String courseid;
  final String url;
  final bool player;
  final Map<String, dynamic> document;
  @override
  Widget build(BuildContext context) {
    final vidioId = YoutubePlayer.convertUrlToId(url);
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blue.shade50, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: SizedBox(
                    height: 70,
                    width: 90,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://img.youtube.com/vi/$vidioId/0.jpg',
                          fit: BoxFit.fill,
                        ))),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      description,
                      style: const TextStyle(
                          fontSize: 16, fontFamily: 'PoppinsMedium'),
                    ),
                    const Text('6:10 mins')
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.play_circle,
                  size: 45,
                  color: Colors.blue.shade500,
                ),
                onPressed: () {
                  player == true
                      ? Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyCourseplay(
                              courseid: courseid,
                              id: vidioId,
                              heading: description,
                              document: document,
                            ),
                          ))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyCourseplay(
                              courseid: courseid,
                              id: vidioId,
                              heading: description,
                              document: document,
                            ),
                          ));
                },
                padding: EdgeInsets.zero,
              )
            ]),
      ),
    );
  }
}
