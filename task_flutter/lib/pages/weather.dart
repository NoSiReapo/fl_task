import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Погода'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset('images/weather.jpg'),
          Divider(height: 20,),
          Padding(padding: EdgeInsets.only(left: 20)),
          Text('Здесь должна была быть по сути основная идея', style: TextStyle(color: Colors.amberAccent),),
          Text('но все поломалось', style: TextStyle(color: Colors.amberAccent))
        ],
      ),
    );
  }
}
