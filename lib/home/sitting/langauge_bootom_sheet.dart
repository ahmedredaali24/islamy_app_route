import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/my_theme.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class LangugeBottomSheet extends StatefulWidget {
  const LangugeBottomSheet({super.key});

  @override
  State<LangugeBottomSheet> createState() => _LangugeBottomSheetState();
}

class _LangugeBottomSheetState extends State<LangugeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color:provider.isDarkMode()
            ? MyTheme.primaryDarktColor
            : MyTheme.whiteColor,
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                provider.changeLanguage("en");
              },
              child: provider.appLanguage == "en"
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.english)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.english)),
          SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {
                provider.changeLanguage("ar");
              },
              child: provider.appLanguage == "ar"
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.arabic)),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color:provider.isDarkMode()
                  ? MyTheme.youllwColor
                  : MyTheme.primaryLightColor, fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.check,
          size: 30,
          color:provider.isDarkMode()
              ? MyTheme.youllwColor
              : MyTheme.primaryLightColor,
        )
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Text(text, style: Theme.of(context).textTheme.titleSmall);
  }
}
