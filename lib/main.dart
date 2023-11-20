import 'package:flutter/material.dart';
import 'package:silver_workshop_weather_app/constants.dart';
import 'package:silver_workshop_weather_app/data.dart';
import 'package:silver_workshop_weather_app/weekly_forecast.dart';

void main() {
  runApp(const HorizonsApp());
}

class HorizonsApp extends StatelessWidget {
  const HorizonsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // This is the theme of your application.
      theme: ThemeData.dark(),
      // Scrolling in Flutter behaves differently depending on the
      // ScrollBehavior. By default, ScrollBehavior changes depending
      // on the current platform. For the purposes of this scrolling
      // workshop, we're using a custom ScrollBehavior so that the
      // experience is the same for everyone - regardless of the
      // platform they are using.
      scrollBehavior: const ConstantScrollBehavior(),
      title: 'Horizons Weather',
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.cyan,
              stretch: true,
              onStretchTrigger: () async {
                // Server.getMore;
                print('get more data');
              },
              centerTitle: true,
              pinned: true,
              floating: true,
              snap: true,
              expandedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.fadeTitle,
                  StretchMode.zoomBackground
                ],
                centerTitle: true,
                title: const Text('Weekly weather report'),
                background: DecoratedBox(
                  position: DecorationPosition.foreground,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: [Colors.cyan, Colors.transparent])),
                  child: Image.network(
                    headerImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const WeeklyForecastList(),
          ],
        ),
      ),
    );
  }
}
