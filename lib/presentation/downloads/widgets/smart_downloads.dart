import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
        kwidth,
        Text("Smart Download")
      ],
    );
  }
}
