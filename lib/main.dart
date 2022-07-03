import 'dart:async';

import 'package:dop/controler/timeZoneControler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'theme/themeConstants.dart';
import 'theme/themeManger.dart';
import 'utility/CountriesList.dart';
import 'widget/countryWidget.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeState>(
    create: (context) => ThemeState(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DOP',
      theme: Provider.of<ThemeState>(context).theme == ThemeType.DARK
          ? ThemeSetting.darkTheme
          : ThemeSetting.lightTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String tickTak = ":";
  late Timer timer;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (t) {
      if (t.tick % 2 == 0) {
        tickTak = " ";
      } else {
        tickTak = ":";
      }
      setState(() {});
    });

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    TimeZoneControler localTimeZone = TimeZoneControler();
    localTimeZone.getCurrentCountryLocalTimeZone();

    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        width: mediaQuery.width,
        height: mediaQuery.height,
        child: Stack(clipBehavior: Clip.none, children: [
          Container(
            width: mediaQuery.width,
            height: mediaQuery.height * 0.25,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Günaydın, Özgür!',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              localTimeZone.todayCurrentHour.toString(),
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                width: 10,
                                child: Text(
                                  tickTak.toString(),
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                              ),
                            ),
                            Text(
                              localTimeZone.todayCurrentMinit.toString(),
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ],
                        ),
                        Text(
                          localTimeZone.localTimeDMMMMEEEE.toString(),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            String currentTheme =
                                Provider.of<ThemeState>(context, listen: false)
                                    .theme
                                    .toString();

                            if (currentTheme == "ThemeType.LIGHT") {
                              Provider.of<ThemeState>(context, listen: false)
                                  .theme = ThemeType.DARK;
                              SystemChrome.setSystemUIOverlayStyle(
                                const SystemUiOverlayStyle(
                                  statusBarColor: Colors.transparent,
                                  statusBarIconBrightness: Brightness.light,
                                ),
                              );
                            } else {
                              Provider.of<ThemeState>(context, listen: false)
                                  .theme = ThemeType.LIGHT;
                              SystemChrome.setSystemUIOverlayStyle(
                                const SystemUiOverlayStyle(
                                  statusBarColor: Colors.transparent,
                                  statusBarIconBrightness: Brightness.dark,
                                ),
                              );
                            }
                            setState(() {});
                          },
                          child: Container(
                            child: Container(
                              width: mediaQuery.height * 0.06,
                              height: mediaQuery.height * 0.06,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFFB6C5DE),
                                  width: 3,
                                ),
                                color: Provider.of<ThemeState>(context).theme ==
                                        ThemeType.DARK
                                    ? Color(0xFFFFFFFF)
                                    : Color(0xFF002359),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  Provider.of<ThemeState>(context).theme ==
                                          ThemeType.DARK
                                      ? 'assets/svg/sun.svg'
                                      : 'assets/svg/moon.svg',
                                  color: Theme.of(context).accentColor,
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.only(
                top: mediaQuery.height * 0.3,
              ),
              width: mediaQuery.width,
              height: mediaQuery.height * 0.75,
              child: ListView.builder(
                itemCount: CountriesList.searchCountriesList.length == 0
                    ? CountriesList.countriesList.length
                    : CountriesList.searchCountriesList.length,
                itemBuilder: ((context, index) => CountryWidget(
                      CountriesList.searchCountriesList.length == 0
                          ? CountriesList.countriesList[index]
                          : CountriesList.searchCountriesList[index],
                    )),
              )

              // SingleChildScrollView(
              //   child: Column(
              //       key: UniqueKey(),
              //       children: CountriesList.searchCountriesList.length == 0
              //           ? CountriesList.countriesList
              //               .map((country) => CountryWidget(country, mediaQuery))
              //               .toList()
              //           : CountriesList.searchCountriesList
              //               .map((country) => CountryWidget(country, mediaQuery))
              //               .toList()),
              // ),
              ),
          Positioned(
            height: mediaQuery.height * 0.16,
            width: mediaQuery.width,
            top: mediaQuery.height * 0.17,
            child: Padding(
              padding: EdgeInsets.all(mediaQuery.width * 0.10),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    'assets/svg/search.svg',
                    color: Color(0xFF002359),
                    height: 5,
                    width: 5,
                    fit: BoxFit.scaleDown,
                  ),
                  labelText: 'Arama',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                onChanged: CountriesList.seachCountryList,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
