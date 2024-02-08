import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/home/hadeth/hadeth_screen.dart';
import 'package:islamy/home/quran/item_sura_details.dart';
import 'package:islamy/my_theme.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadthDetailsScreen extends StatefulWidget {
  static const String routeName = "hadthDetailsScreenRoute";

  @override
  State<HadthDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<HadthDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

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
          top: 0.16 * MediaQuery.of(context).size.height,
          child: Row(
            children: [
              Text(
                args.title,
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
                Icons.menu_book,
                color: provider.isDarkMode()
                    ? MyTheme.youllwColor
                    : MyTheme.blackColor,
              ),
            ],
          )),
      Scaffold(
        appBar: AppBar(
          title: Text(
            "islamy",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: provider.isDarkMode()
                      ? MyTheme.whiteColor
                      : MyTheme.blackColor,
                ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
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
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Text(
                args.content[index],
                style: TextStyle(
                  color: provider.isDarkMode()
                      ? MyTheme.youllwColor
                      : MyTheme.blackColor,
                ),
              );
            },
            itemCount: args.content.length,
          ),
        ),
      )
    ]);
  }
}
