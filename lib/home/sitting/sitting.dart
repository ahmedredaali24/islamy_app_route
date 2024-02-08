import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/home/sitting/theme_bootom_sheet.dart';
import 'package:islamy/my_theme.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import 'langauge_bootom_sheet.dart';

class Sitting extends StatefulWidget {
  const Sitting({super.key});

  @override
  State<Sitting> createState() => _SittingState();
}

class _SittingState extends State<Sitting> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.1 * MediaQuery.of(context).size.height,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: .01 * MediaQuery.of(context).size.height,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: provider.isDarkMode()
                      ? MyTheme.youllwColor
                      : MyTheme.primaryLightColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      provider.appLanguage == "en"
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.bodyMedium),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: .05 * MediaQuery.of(context).size.height,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: .01 * MediaQuery.of(context).size.height,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color:  provider.isDarkMode()
    ? MyTheme.youllwColor
        : MyTheme.primaryLightColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      provider.isDarkMode()
                          ? AppLocalizations.of(context)!.dark
                          : AppLocalizations.of(context)!.light,
                      style: Theme.of(context).textTheme.bodyMedium),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: (context),
        builder: (context) {
          return LangugeBottomSheet();
        });
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }
}
