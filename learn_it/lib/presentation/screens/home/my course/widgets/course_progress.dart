import 'package:flutter/material.dart';
import 'package:learn_it/core/colors.dart';
import 'package:learn_it/presentation/screens/home/my%20course/functions/navigations/tomycourse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Coursecard extends StatefulWidget {
  const Coursecard(
      {super.key,
      required this.documentsnapshot,
      required this.color,
      required this.videoid});
  final Map<String, dynamic> documentsnapshot;

  final int color;
  final String videoid;

  @override
  State<Coursecard> createState() => _CoursecardState();
}

class _CoursecardState extends State<Coursecard> {
  List<String> watchedVideos = [];
  int watched = 1;
  @override
  void initState() {
    super.initState();
    _loadWatchedVideos();
  }

  void _loadWatchedVideos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      watchedVideos =
          prefs.getStringList('watchedVideos${widget.videoid}') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    getColor(widget.color);
    return GestureDetector(
      onTap: () => onMycourse(context, widget.documentsnapshot),
      child: Container(
        height: 210,
        width: 160,
        decoration: BoxDecoration(
            color: containerclr, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 80,
                width: 110,
                child: Text(
                  widget.documentsnapshot['title'],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  color: catgtextclr,
                  backgroundColor: Colors.white,
                  value: watchedVideos.length/widget.documentsnapshot['links'].length,
                  minHeight: 6,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'completed',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        '${watchedVideos.length.toString()}/${widget.documentsnapshot['lectures']}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: (() {
                        // onMycourse(context);
                      }),
                      icon: Icon(
                        Icons.play_circle,
                        color: catgtextclr,
                        size: 50,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
