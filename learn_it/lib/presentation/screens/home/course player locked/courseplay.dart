import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/course%20preview/widgets/floatingaction.dart';
import 'package:learn_it/presentation/screens/home/course%20preview/widgets/lesson.dart';
import 'package:learn_it/presentation/screens/home/widgets/heading.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Courseplay extends StatefulWidget {
  const Courseplay(
      {super.key,
      required this.id,
      required this.heading,
      required this.document, required this.locked});
  final String? id;
  final String heading;
  final Map<String, dynamic> document;
  final bool locked;

  @override
  State<Courseplay> createState() => _CourseplayState();
}

class _CourseplayState extends State<Courseplay> {
  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.id!,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
    ),
  );

  // @override
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, Orientation orientation) {
      if (orientation == Orientation.portrait) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    aspectRatio: 16 / 9,
                  ),
                  Heading(heading: widget.heading),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 10),
                    child: Text(
                      'Next in queue',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Lesson(
                          locked: true,
                            document: widget.document,
                           
                            description: widget.document['discriptions']
                                [index + 1],
                            url: widget.document['links'][index + 1]);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: widget.document['links'].length - 1),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: const Buyfltbtn(),
        );
      } else {
        return YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          aspectRatio: 16 / 9,
        );
      }
    });
  }
}
