import 'package:flutter/material.dart';
import 'package:islamy/home/hadeth/hadeth_screen.dart';
import 'package:islamy/home/quran/quran_screen.dart';
import 'package:islamy/home/radio/radio_screen.dart';
import 'package:islamy/home/sebha/sebha_screen.dart';
import 'package:islamy/home/sitting/sitting.dart';
import 'package:islamy/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "home_page_route";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
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
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.qruan,
                    icon: const ImageIcon(
                        AssetImage("assets/images/moshaf_blue.png"))),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.hadeth,
                    icon: ImageIcon(AssetImage(
                        "assets/images/quran-quran-svgrepo-com.png"))),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.sebha,
                    icon:
                        ImageIcon(AssetImage("assets/images/sebha_icon.png"))),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.radio,
                    icon:
                        ImageIcon(AssetImage("assets/images/radio_icon.png"))),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.sitting,
                    icon: Icon(Icons.settings)),
              ],
            ),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTap(),
    HadethTap(),
    SebhaTap(),
    RadioTap(),
    Sitting()
  ];
}
