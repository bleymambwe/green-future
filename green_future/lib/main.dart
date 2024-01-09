import 'package:flutter/material.dart';
import 'package:green_future/theme/theme.dart';
import 'package:provider/provider.dart';
import 'models/provider_logic.dart';

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
          child: Image.network(
            'https://www.dropbox.com/scl/fi/arod9wuyget5dc7p8v58f/desks.jpg?rlkey=rha22qw3u10ay8iww79n2qkub&dl=1',
            fit: BoxFit.cover,
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
          Pallet(width: 0.55, height: 0.35, child: EventsWidget())
        ],
      ),
    );
  }
}

class EventsWidget extends StatelessWidget {
  const EventsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            ClipRRect(
              child: Image.network(
                'https://www.dropbox.com/scl/fi/rx2j2djofxf7sj2ouir3i/ahmed_and_cyril_cropped.jpg?rlkey=pxys9ir4tcj7xl1mswsdjnsmn&dl=1',
                //width: 300,
                // height: 400,
              ),
            )
          ],
        )
      ],
      //color: Colors.red,
    );
  }
}
