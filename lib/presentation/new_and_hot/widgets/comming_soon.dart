import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home_page/widgets/custon_button_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/video_widget.dart';

class CommingSoon extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  const CommingSoon({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: const TextStyle(
                  fontSize: 16,
                  color: kGreyColor,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
                  letterSpacing: 5,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(url: posterPath),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // const Spacer(),
                  Row(
                    children: const [
                      CustomButtom(
                        icon: Icons.notifications,
                        title: "Remind me",
                        fontSize: 12,
                        iconSize: 20,
                      ),
                      kwidth,
                      CustomButtom(
                        icon: Icons.info,
                        title: "Info",
                        fontSize: 13,
                        iconSize: 20,
                      ),
                      kwidth
                    ],
                  )
                ],
              ),
              kheight,
              Text("Comming on $day $month"),
              kheight,
              Text(
                movieName,
                style: const TextStyle(
                    fontSize: 18,
                    color: kwhitecolor,
                    fontWeight: FontWeight.bold),
              ),
              kheight,
              Text(
                description,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  color: kGreyColor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
