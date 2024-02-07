import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Clima',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            backgroundColor: Color.fromARGB(255, 2, 56, 94),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 2, 56, 94),
                  Color.fromARGB(255, 2, 23, 39)
                ],
              ),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Text(
                  'Pronóstico hora a hora',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Card(
                  color: Color(0xff001d35),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Column>[
                        Column(
                          children: <Widget>[
                            Text(
                              '16°C',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 20),
                            Icon(
                              Icons.mode_night,
                              color: Colors.white,
                            ),
                            Text(
                              'Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              '18°C',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 20),
                            Icon(
                              Icons.mode_night,
                              color: Colors.white,
                            ),
                            Text(
                              '6:00 AM',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              '19°C',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 20),
                            Icon(
                              Icons.sunny_snowing,
                              color: Colors.orange,
                            ),
                            Text(
                              '7:00 AM',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              '19°C',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 20),
                            Icon(
                              Icons.sunny,
                              color: Colors.yellow,
                            ),
                            Text(
                              '8:00 AM',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              '20°C',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 20),
                            Icon(
                              Icons.sunny,
                              color: Colors.yellow,
                            ),
                            Text(
                              '9:00 AM',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: MyListView(),
                ),
              ],
            ),
          )),
    );
  }
}

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildCard(context, 'Monday', Icons.wb_sunny, 28),
        _buildCard(context, 'Tuesday', Icons.wb_cloudy, 25),
        _buildCard(context, 'Wednesday', Icons.wb_sunny, 30),
        _buildCard(context, 'Thursday', Icons.wb_cloudy, 24),
        _buildCard(context, 'Friday', Icons.wb_cloudy, 24),
        _buildCard(context, 'Saturday', Icons.wb_cloudy, 24),
        _buildCard(context, 'Sunday', Icons.wb_cloudy, 24),
        _buildCard(context, 'Monday', Icons.wb_sunny, 28),
        _buildCard(context, 'Tuesday', Icons.wb_cloudy, 25),
        _buildCard(context, 'Wednesday', Icons.wb_sunny, 30),
        _buildCard(context, 'Thursday', Icons.wb_cloudy, 24),
        _buildCard(context, 'Friday', Icons.wb_cloudy, 24),
        _buildCard(context, 'Saturday', Icons.wb_cloudy, 24),
        _buildCard(context, 'Sunday', Icons.wb_cloudy, 24),
        // Agrega más elementos de lista según sea necesario
      ],
    );
  }

  Widget _buildCard(
      BuildContext context, String day, IconData icon, int temperature) {
    return Card(
      color: Color(0xff001d35),
      child: ListTile(
        title: Text(
          day,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              color: icon == Icons.wb_sunny ? Colors.yellow : Colors.grey,
            ),
            SizedBox(width: 8),
            Text(
              '$temperature°C',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
        onTap: () {
          ScaffoldMessenger.of(context)
              .hideCurrentSnackBar(); // Oculta el Snackbar actual
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Day: $day, Temperature: $temperature°C'),
              duration: Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }
}
