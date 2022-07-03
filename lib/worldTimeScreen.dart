import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'controler/timeZoneControler.dart';

class WorldTimeScreen extends StatelessWidget {
  const WorldTimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timeZoneControler =
        ModalRoute.of(context)!.settings.arguments as TimeZoneControler;
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: mediaQuery.height * 0.05),
          child: Text(
            'WORLD TIME',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(
            top: mediaQuery.height * 0.05,
            left: mediaQuery.height * 0.05,
          ),
          child: GestureDetector(
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).iconTheme.color,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: mediaQuery.height * 0.1),
        color: Theme.of(context).primaryColor,
        width: mediaQuery.width,
        height: mediaQuery.height,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(mediaQuery.height * 0.01),
                  width: mediaQuery.width * 0.3,
                  height: mediaQuery.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    border: Border.all(
                      color: Color(0xFF002359),
                      width: 2,
                    ),
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: Center(
                    child: Text(
                      timeZoneControler.countryCurrentHour.toString(),
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(mediaQuery.height * 0.01),
                  child: Text(
                    ':',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(mediaQuery.height * 0.01),
                  width: mediaQuery.width * 0.3,
                  height: mediaQuery.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    border: Border.all(
                      color: Color(0xFF002359),
                      width: 2,
                    ),
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: Center(
                    child: Text(
                      timeZoneControler.countryCurrentMinit.toString(),
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: mediaQuery.height * 0.05),
              child: Text(
                timeZoneControler.fromatedCountryName
                    .toString()
                    .split(',')
                    .last,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                timeZoneControler.fromatedCountryName
                    .toString()
                    .split(',')
                    .first,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '${timeZoneControler.todayName},  GMT ${timeZoneControler.gmtTime}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Text(
              timeZoneControler.todayFullDate.toString(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
