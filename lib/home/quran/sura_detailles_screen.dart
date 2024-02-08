import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/home/quran/item_sura_details.dart';
import 'package:islamy/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "suraDetailsScreenRoute";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Stack(children: [
      provider.isDarkMode()
          ? Image.asset(
              "assets/images/darkback.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )
          : Image.asset(
              "assets/images/background.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
      Positioned(
          right: 0.10 * MediaQuery.of(context).size.width,
          top: 0.17 * MediaQuery.of(context).size.height,
          child: Row(
            children: [
              Text(
                "سورة ${args.name}",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: provider.isDarkMode()
                          ? MyTheme.youllwColor
                          : MyTheme.blackColor,
                    ),
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.play_circle_filled_sharp,
                color: provider.isDarkMode()
                    ? MyTheme.youllwColor
                    : MyTheme.blackColor,
              ),
            ],
          )),
      Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: provider.isDarkMode()
                      ? MyTheme.whiteColor
                      : MyTheme.blackColor,
                ),
          ),
        ),
        body: verses.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: MyTheme.primaryLightColor.withOpacity(.1),
                ),
              )
            : Container(
                padding: const EdgeInsets.all(50),
                margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.12,
                  horizontal: MediaQuery.of(context).size.width * 0.03,
                ),
                decoration: BoxDecoration(
                    color: provider.isDarkMode()
                        ? MyTheme.primaryDarktColor
                        : MyTheme.whiteColor,
                    borderRadius: BorderRadius.circular(25)),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: provider.isDarkMode()
                          ? MyTheme.youllwColor
                          : MyTheme.primaryLightColor,
                      thickness: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ItemSuraDetails(
                      index: index,
                      content: verses[index],
                    );
                  },
                  itemCount: verses.length,
                ),
              ),
      )
    ]);
  }

  Future loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split("\n");
    for (int i = 0; i < lines.length; i++) {}
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
