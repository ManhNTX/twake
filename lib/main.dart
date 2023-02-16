import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:twake/core/presentation/resources/styles_config.dart';
import 'package:twake/feature/authorization/splash/presentation/splash_page.dart';
import 'package:twake/main/main_bindings.dart';
import 'package:twake/main/pages/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MainBindings().dependencies();

  runApp(
    GetMaterialApp(
      theme: StylesConfig.lightTheme,
      darkTheme: StylesConfig.darkTheme,
      // themeMode: themeMode,
      title: 'Twake',
      localizationsDelegates: [
        // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('fr'),
        const Locale('fi'),
        const Locale('es'),
        const Locale('it'),
        const Locale('de'),
        const Locale('ru'),
        const Locale('zh'),
        const Locale('nb'),
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        const Locale.fromSubtags(languageCode: 'nb', scriptCode: 'NO'),
      ],
      // locale: Locale(language),
      getPages: AppPages.pages,
      initialRoute: SplashPage.routeName,
      debugShowCheckedModeBanner: false,
    ),
  );
}