import 'package:askun_delivery_app/UI%20Screen/Splash%20Screen/splashscreen.dart';
import 'package:askun_delivery_app/UI%20Screen/categories/dailyneeds/groceirspage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'utilites/constant.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('hi', 'HI'), Locale('te', 'TE')],
      path: 'assets/lang',
      saveLocale: false,
      useOnlyLangCode: true,
      fallbackLocale: const Locale('te', 'TE'),
      child: Local(),
    );
  }
}


class Local extends StatelessWidget {
  const Local({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
        title: 'Ask you needs',
        theme: ThemeData(
            primaryColor:primaryColor,
            appBarTheme: AppBarTheme(
                backgroundColor:primaryColor,
                iconTheme: IconThemeData(
                  color: whiteColor,
                ),
                actionsIconTheme: IconThemeData(
                  color: whiteColor,
                )
            ),

        ),
        home:  const GroceriesPage()
    );
  }
}
