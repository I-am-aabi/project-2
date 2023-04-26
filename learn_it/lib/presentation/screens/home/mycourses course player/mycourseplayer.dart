import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/course%20preview/widgets/floatingaction.dart';
import 'package:learn_it/presentation/screens/home/course%20preview/widgets/lesson.dart';
import 'package:learn_it/presentation/screens/home/mycourses%20course%20player/widgets/mylessons.dart';
import 'package:learn_it/presentation/screens/home/widgets/heading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyCourseplay extends StatefulWidget {
  const MyCourseplay(
      {super.key,
      required this.id,
      required this.heading,
      required this.document,
      required this.courseid});
  final String? id;
  final String courseid;
  final String heading;
  final Map<String, dynamic> document;

  @override
  State<MyCourseplay> createState() => _MyCourseplayState();
}

class _MyCourseplayState extends State<MyCourseplay> {
  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.id!,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
    ),
  );
  List<String> watchedVideos = [];
  @override
  void initState() {
    super.initState();
    _loadWatchedVideos();
  }

  void _loadWatchedVideos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    watchedVideos =
        prefs.getStringList('watchedVideos${widget.courseid}') ?? [];
  }

  void _onVideoEnd(YoutubeMetaData metaData) async {
    if (!watchedVideos.contains(metaData.videoId)) {
      watchedVideos.add(metaData.videoId);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList('watchedVideos${widget.courseid}', watchedVideos);
      print(watchedVideos);
    }
  }

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
              child: ListView(
                children: [
                  YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    aspectRatio: 16 / 9,
                    onEnded: _onVideoEnd,
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
                        return MyLesson(
                            courseid: widget.courseid,
                            player: true,
                            document: widget.document,
                            description: widget.document['discriptions'][index],
                            url: widget.document['links'][index]);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: widget.document['links'].length),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: Buyfltbtn(
              visible: false,
              videoid: widget.document['videoid'],
              price: widget.document['price'],
              title: widget.document['title']),
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
