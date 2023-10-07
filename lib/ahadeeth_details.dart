import 'package:flutter/material.dart';
import 'package:islami_app/hadeeth_model.dart';

import 'my_theme_data.dart';

class AhadeethDetails extends StatelessWidget {
  static const String route = "ahadeeth_details";

  AhadeethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadeethModel;
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            iconTheme: MyThemeData.lightTheme.iconTheme,
            title: Text(
              args.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Card(
            elevation: 14,
            margin: EdgeInsets.all(18),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: MyThemeData.primaryColor)),
            child: Padding(
              padding: EdgeInsets.all(25),
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  endIndent: 40,
                  indent: 40,
                ),
                itemBuilder: (context, index) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "${args.content[index]}",
                      textAlign: TextAlign.center,
                    ),
                  );
                },
                itemCount: args.content.length,
              ),
            ),
          ),
        ));
  }
}
