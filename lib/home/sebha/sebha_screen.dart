import 'package:flutter/material.dart';
import 'package:islamy/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class SebhaTap extends StatefulWidget {
  const SebhaTap({Key? key});

  @override
  _SebhaTapState createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  int counter = 0;
  double turns = 0;

  void incrementCounter() {
    setState(() {
      if (counter < 34) {
        counter++;
      } else if (counter < 67) {
        counter++;
      } else if (counter < 100) {
        counter++;
      } else if (counter == 100) {
        counter = 0;
      }
      turns += 1 / 30;
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 0.20 * MediaQuery.of(context).size.width,
          top: 0.12 * MediaQuery.of(context).size.height,
          child: InkWell(
            onTap: incrementCounter,
            child: AnimatedRotation(
              turns: turns,
              duration: Duration(seconds: 1),
              child:provider.isDarkMode()
                  ? Image.asset(
                "assets/images/dark_body_of_seb7a.png",
                fit: BoxFit.fill,
              ):Image.asset(
                "assets/images/body_of_seb7a.png",
                fit: BoxFit.fill,
              )
            ),
          ),
        ),
        Positioned(
          right: 0.347 * MediaQuery.of(context).size.width,
          top: 0.0332 * MediaQuery.of(context).size.height,
          child:provider.isDarkMode()
              ? Image.asset("assets/images/dark_head_of_seb7a.png")
              :Image.asset("assets/images/head_of_seb7a.png")
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 7,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 0.5 * MediaQuery.of(context).size.width),
                child: Text(
                  AppLocalizations.of(context)!.tsbeh,style: TextStyle(
                  color: provider.isDarkMode()
                    ? MyTheme.whiteColor
                    : MyTheme.blackColor,
                ),
                ),
              ),
              Spacer(),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: 25),
                color: provider.isDarkMode()
                    ? MyTheme.primaryDarktColor
                    : MyTheme.primaryLightColor,
                onPressed: incrementCounter,
                child: Text(
                  "$counter",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: provider.isDarkMode()
                      ? MyTheme.whiteColor
                      : MyTheme.blackColor,
                  ),
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                decoration: BoxDecoration(
                  color: provider.isDarkMode()
                      ? MyTheme.youllwColor
                      : MyTheme.primaryLightColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  getSubhanallahText(),
                  style: TextStyle(color: MyTheme.whiteColor),
                ),
              ),
              Spacer()
            ],
          ),
        )
      ],
    );
  }

  String getSubhanallahText() {
    if (counter < 34) {
      return "سبحان الله";
    } else if (counter < 67) {
      return "الحمد لله";
    } else if (counter < 100) {
      return "الله أكبر";
    } else {
      return "لا إله إلا الله";
    }
  }
}
