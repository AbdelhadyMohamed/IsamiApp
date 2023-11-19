import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'RadioModel.dart';

class RadioWidget extends StatelessWidget {
  final Radios radioItem;

  final AudioPlayer player;

  const RadioWidget(this.radioItem, this.player, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(radioItem.name ?? ""),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    player.play(UrlSource(radioItem.url!));
                  },
                  icon: Icon(
                    Icons.play_arrow_sharp,
                    color: Theme.of(context).primaryColor,
                  )),
              IconButton(
                  onPressed: () {
                    player.pause();
                  },
                  icon:
                      Icon(Icons.pause, color: Theme.of(context).primaryColor)),
            ],
          )
        ],
      ),
    );
  }
}
