import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/home/hadeth/item_hadeth_name.dart';
import 'package:islamy/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethTap extends StatefulWidget {
  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<Hadeth> ahadthList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (ahadthList.isEmpty) {
      loadFile();
    }

    return Column(children: [
      Center(
        child: Image.asset("assets/images/ahadeth_image.png"),
      ),
      Divider(
        color: provider.isDarkMode()
            ? MyTheme.youllwColor
            : MyTheme.primaryLightColor,
      ),
      Text(
        AppLocalizations.of(context)!.hadeth_name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      Divider(
        color: provider.isDarkMode()?
        MyTheme.youllwColor
            :
        MyTheme.primaryLightColor,
        thickness: 3,
      ),
      ahadthList.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: MyTheme.primaryLightColor,
              ),
            )
          : Expanded(
              child: ListView.builder(
                itemCount: ahadthList.length,
                itemBuilder: (context, index) {
                  return ItemHadethName(
                    hadeth: ahadthList[index],
                  );
                },
              ),
            )
    ]);
  }

  void loadFile() async {
    String hadethContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadthList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
