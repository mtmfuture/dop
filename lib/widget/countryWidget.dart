import 'package:dop/worldTimeScreen.dart';
import 'package:flutter/material.dart';
import '../controler/timeZoneControler.dart';

class CountryWidget extends StatefulWidget {
  const CountryWidget(this.country);

  final String country;

  @override
  State<CountryWidget> createState() => _CountryWidgetState();
}

class _CountryWidgetState extends State<CountryWidget> {
  TimeZoneControler timeZoneControler = TimeZoneControler();
  @override
  void initState() {
    super.initState();
    // timeZoneControler.formatedCountryName(widget.country);
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    timeZoneControler.formatedCountryName(widget.country);
    return InkWell(
      key: UniqueKey(),
      onTap: () async {
        await timeZoneControler
            .getSelectedCountryTimeZone(
                timeZoneControler.fromatedCountryName.toString())
            .then((_) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WorldTimeScreen(),
              settings: RouteSettings(
                arguments: timeZoneControler,
              ),
            ),
          );
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: mediaQuery.width * 0.01,
            horizontal: mediaQuery.width * 0.08),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        width: mediaQuery.width * 0.8,
        height: mediaQuery.height * 0.07,
        child: Stack(clipBehavior: Clip.none, children: [
          Positioned(
            right: -mediaQuery.width * 0.035,
            top: mediaQuery.width * 0.035,
            child: Container(
              width: mediaQuery.height * 0.035,
              height: mediaQuery.height * 0.035,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                color: Theme.of(context).accentColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: mediaQuery.height * 0.015,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
          ),
          Container(
              width: mediaQuery.width,
              height: mediaQuery.height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: mediaQuery.width * 0.05,
                    ),
                    child: Text(
                      timeZoneControler.fromatedCountryName.toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}
