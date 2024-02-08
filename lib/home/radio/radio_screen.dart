import 'package:flutter/material.dart';
import 'package:islamy/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class RadioTap extends StatelessWidget {
  const RadioTap({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Spacer(
        flex: 2,
      ),
      Center(
        child: Image.asset("assets/images/radio_image.png"),
      ),
      Spacer(
        flex: 1,
      ),
      Text(AppLocalizations.of(context)!.quran_radio,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: provider.isDarkMode()
                    ? MyTheme.whiteColor
                    : MyTheme.blackColor,
              )),
      Spacer(
        flex: 1,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_previous,
                color: provider.isDarkMode()
                    ? MyTheme.youllwColor
                    : MyTheme.primaryLightColor,
                size: 40,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow_rounded,
                color: provider.isDarkMode()
                    ? MyTheme.youllwColor
                    : MyTheme.primaryLightColor,
                size: 50,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_next,
                color: provider.isDarkMode()
                    ? MyTheme.youllwColor
                    : MyTheme.primaryLightColor,
                size: 40,
              )),
        ],
      ),
      Spacer(
        flex: 2,
      )
    ]);
  }
}
