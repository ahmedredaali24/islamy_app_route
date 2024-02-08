import 'package:flutter/material.dart';
import 'package:islamy/home/quran/sura_detailles_screen.dart';
import 'package:islamy/my_theme.dart';
import 'package:islamy/providers/app_config_provider.dart';

import 'home/hadeth/hadeth_detailles_screen.dart';
import 'home/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadthDetailsScreen.routeName: (context) => HadthDetailsScreen()
      },
      theme: MyTheme.lightMode,
      themeMode: provider.appTheme,
      darkTheme: MyTheme.darkMode,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
