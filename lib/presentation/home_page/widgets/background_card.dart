import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home_page/widgets/custon_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 600,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(mainImage),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButtom(icon: Icons.add, title: "My List "),
              _playbutton(),
              const CustomButtom(icon: Icons.info_outline, title: "Info")
            ],
          ),
        )
      ],
    );
  }

  TextButton _playbutton() {
    return TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kwhitecolor)),
        icon: const Icon(
          Icons.play_arrow,
          color: kblackColor,
          size: 30,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Text(
            "Play",
            style: TextStyle(
              fontSize: 20,
              color: kblackColor,
            ),
          ),
        ));
  }
}
