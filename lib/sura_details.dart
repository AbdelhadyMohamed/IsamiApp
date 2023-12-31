import 'package:flutter/material.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/providers/sura_details_provider.dart';
import 'package:islami_app/sura_model.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  static const String route = "SuraDetails";

  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;

    return ChangeNotifierProvider(
      create: (context) => SuraDetailsProvider()..loadFile(args.index),
      builder: (context, child) {
        var provider = Provider.of<SuraDetailsProvider>(context);
        var provider2 = Provider.of<MyProvider>(context);

        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    provider2.theme == ThemeMode.light
                        ? "assets/images/background.png"
                        : "assets/images/bg.png",
                  ),
                  fit: BoxFit.fill)),
          child: Scaffold(
            appBar: AppBar(
              iconTheme: provider2.theme == ThemeMode.light
                  ? MyThemeData.lightTheme.iconTheme
                  : MyThemeData.darkTheme.iconTheme,
              title: Text(
                args.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.background),
              ),
            ),
            body: Card(
              elevation: 14,
              margin: EdgeInsets.all(18),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.background)),
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
                      "${provider.verses[index]}(${index + 1})",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.background),
                    ),
                  );
                },
                itemCount: provider.verses.length,
              ),
            ),
          ),
        );
      },
    );
  }
}
