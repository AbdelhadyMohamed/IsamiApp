import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/api_manager.dart';
import 'package:islami_app/radio_widget.dart';

import '../RadioModel.dart';

class RadioTab extends StatelessWidget {
  RadioTab({super.key});

  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 3, child: Image.asset("assets/images/radio_image.png")),
        Expanded(
            flex: 2,
            child: FutureBuilder(
                future: ApiManager.getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text("error"));
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  RadioModel? radioModel = snapshot.data;
                  List<Radios>? radioDataList = radioModel?.radios;
                  return ListView.builder(
                      physics: const PageScrollPhysics(),
                      itemCount: radioDataList?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          RadioWidget(radioDataList![index], player));
                }))
      ],
    );
  }
}
