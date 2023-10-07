import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/hadeeth_model.dart';
import 'package:islami_app/my_theme_data.dart';

import '../ahadeeth_details.dart';

class AahadeethTab extends StatefulWidget {
  AahadeethTab({super.key});

  @override
  State<AahadeethTab> createState() => _AahadeethTabState();
}

class _AahadeethTabState extends State<AahadeethTab> {
  List<HadeethModel> all_ahadeeth = [];

  @override
  Widget build(BuildContext context) {
    if (all_ahadeeth.isEmpty) {
      loadHadth();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset("assets/images/ahadeth_image.png"),
        Divider(
          thickness: 3,
          color: MyThemeData.primaryColor,
        ),
        Text(
          "الأحاديث",
          textAlign: TextAlign.center,
        ),
        Divider(
          thickness: 3,
          color: MyThemeData.primaryColor,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AhadeethDetails.route,
                      arguments: all_ahadeeth[index],
                    );
                  },
                  child: Text(
                    all_ahadeeth[index].title,
                    textAlign: TextAlign.center,
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                    color: MyThemeData.primaryColor,
                    thickness: 1,
                  ),
              itemCount: all_ahadeeth.length),
        )
      ],
    );
  }

  loadHadth() async {
    rootBundle.loadString("assets/files/ahadeth.txt").then((ahadeeth) {
      List<String> ahadeth_list = ahadeeth.split("#");
      for (int i = 0; i < ahadeth_list.length; i++) {
        String hadeethOne = ahadeth_list[i];
        List<String> hadethOneLines = hadeethOne.trim().split("\n");
        String title = hadethOneLines[0];
        hadethOneLines.removeAt(0);
        List<String> content = hadethOneLines;
        HadeethModel hadeethModel = HadeethModel(title, content);
        all_ahadeeth.add(hadeethModel);
        setState(() {});
      }
    }).catchError((e) {
      print(e.toString());
    });
  }
}
