import 'package:flutter/material.dart';
import 'package:green_future/theme/theme.dart';
import 'package:provider/provider.dart';
import 'models/provider_logic.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'customWidgets/custom_container.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<AppStateProvider>(
              create: (context) => AppStateProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Home(),
          ),
        )),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(8),
      color: Colors.green.shade100.withOpacity(0.5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(alignment: Alignment.center, children: [
        Container(
          //width: 200,
          //height: 200,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.transparent.withOpacity(0.5),
          child: CachedNetworkImage(
              imageUrl:
                  'https://www.dropbox.com/scl/fi/arod9wuyget5dc7p8v58f/desks.jpg?rlkey=rha22qw3u10ay8iww79n2qkub&dl=1',
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                    color: Colors.lightGreenAccent,
                  )
              //color:,
              ),
        ),
        HomeScreen()
      ]),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Pallet(text: 'book'),
              Pallet(
                text: 'contact',
              ),
              Pallet(text: 'media'),
              Pallet(
                text: 'success stories',
                width: 0.14,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Green Future',
            style: TextStyle(
              fontFamily: 'Horizon',
              fontWeight: FontWeight.bold,
              fontSize: 30,
              foreground: Paint()
                ..shader = LinearGradient(
                  colors: [
                    Colors.green.shade700,
                    Colors.blue.shade300,
                    Colors.green.shade700,
                  ],
                ).createShader(Rect.fromCenter(
                  center: Offset(0, 0),
                  width: 0,
                  height: 0,
                )),
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.green.shade600,
                  offset: Offset(0, 0),
                ),
                Shadow(
                  blurRadius: 10.0,
                  color: Color.fromARGB(255, 182, 27, 217).withOpacity(.8),
                  offset: Offset(0, 0),
                ),
                // Add more shadows/colors as needed
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.green.shade900.withOpacity(0.4),
              ),
              width: MediaQuery.of(context).size.width * 0.55,
              height: MediaQuery.of(context).size.width * 0.35,
              child: EventsWidget())
        ],
      ),
    );
  }
}

class EventsWidget extends StatelessWidget {
  const EventsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                'Upcoming Event',
                style: TextStyle(
                    fontFamily: 'Horizon', fontSize: 10, color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '10',
                          style: TextStyle(fontFamily: 'Horizon', fontSize: 16),
                        ),
                        Text(
                          'Wed',
                          style: TextStyle(fontFamily: 'Horizon', fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Text(
                    'The Lucky Series Workshop',
                    style: TextStyle(
                        fontFamily: 'Horizon',
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                width: 290,
                height: 290,
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 65,
                      width: 165,
                      alignment: Alignment.center,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      //color: Colors.green.shade600.withOpacity(0.7),
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'Horizon'),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Opacity(
                        opacity: 0.95,
                        child: CachedNetworkImage(
                            imageUrl:
                                'https://www.dropbox.com/scl/fi/jwl8mxwbk6l4z3ekm208x/cryil.png?rlkey=875edjzslw2th97cxdouvupmb&dl=1',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                                  color: Colors.lightGreenAccent,
                                )
                            //color:,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 290,
                height: 290,
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8)),
                child: CalenderHeatMap(),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CalenderHeatMap extends StatelessWidget {
  const CalenderHeatMap({super.key});

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      datasets: {
        DateTime(2024, 1, 6): 3,
        DateTime(2024, 10, 7): 5,
        DateTime(2024, 17, 8): 7,
        DateTime(2024, 27, 9): 13,
        DateTime(2024, 30, 13): 5,
      },
      size: 28,
      colorMode: ColorMode.opacity,
      showColorTip: false,
      showText: true,
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: 35)),
      scrollable: true,
      fontSize: 10,
      colorsets: {
        1: Colors.green.withOpacity(0.1),
        3: Colors.green.withOpacity(0.3),
        5: Colors.green,
        7: Colors.green,
        9: Colors.green.withOpacity(1),
        11: Colors.green.shade400,
        13: Colors.green.shade200,
      },
      onClick: (value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.toString())));
      },
    );
  }
}
