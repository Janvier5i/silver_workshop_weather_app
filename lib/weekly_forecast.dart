import 'package:flutter/material.dart';
import 'package:silver_workshop_weather_app/daily_forecast.dart';
import 'package:silver_workshop_weather_app/data.dart';

class WeeklyForecastList extends StatelessWidget {
  const WeeklyForecastList({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime currentDate = DateTime.now();
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        final DailyForecast dailyForecast = Server.getDailyForecastByID(index);
        return Card(
          child: Row(
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    DecoratedBox(
                      position: DecorationPosition.foreground,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: <Color>[
                            Colors.grey[800]!,
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Image.network(
                        dailyForecast.imageId,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Center(
                      child: Text(
                        dailyForecast.getDate(currentDate.day).toString(),
                        style: textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dailyForecast.getWeekday(currentDate.weekday),
                        style: textTheme.headlineSmall,
                      ),
                      Text(dailyForecast.description),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${dailyForecast.highTemp} | ${dailyForecast.lowTemp} F',
                  style: textTheme.titleSmall,
                ),
              ),
            ],
          ),
        );
      }, childCount: 7),
    );
  }
}
