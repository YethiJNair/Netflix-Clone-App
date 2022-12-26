import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home_page/widgets/custon_button_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';

class EveronesWatchingWidget extends StatelessWidget {
  final String postePath;
  final String movieName;
  final String description;
  const EveronesWatchingWidget({
    Key? key,
    required this.postePath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(
          movieName,
          style: const TextStyle(
              fontSize: 20, color: kwhitecolor, fontWeight: FontWeight.bold),
        ),
        kheight,
        Text(
          description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16,
            color: kGreyColor,
          ),
        ),
        khHeight50,
        VideoWidget(
          url: postePath,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtom(
              icon: Icons.share,
              title: "Share",
              iconSize: 25,
              fontSize: 16,
            ),
            kwidth,
            CustomButtom(
              icon: Icons.add,
              title: "My List",
              iconSize: 25,
              fontSize: 16,
            ),
            kwidth,
            CustomButtom(
              icon: Icons.play_arrow_rounded,
              title: "Play",
              iconSize: 25,
              fontSize: 16,
            ),
            kwidth,
          ],
        )
      ],
    );
  }
}
