import 'package:flutter/material.dart';
import 'package:islamy/home/quran/sura_detailles_screen.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';

class ItemSuraDetails extends StatelessWidget {
  String content;
  int index;

  ItemSuraDetails({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Text(
      "$content (${index + 1})",
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: provider.isDarkMode()?
        MyTheme.youllwColor
            :
        MyTheme.blackColor,

      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
