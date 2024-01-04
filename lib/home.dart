import 'package:flutter/material.dart';
import 'package:goeasy/booking/bike.dart';
// import 'package:goeasy/screens/booking/booking_home.dart';
// import 'package:goeasy/screens/loadingscreens/registration_successful.dart';
// import 'package:goeasy/screens/registration/personal_vehicle.dart';
// import 'package:goeasy/screens/registration/vechileregister.dart';

class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _homeState();
}

class _homeState extends State<home> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    bike(),
    AboutPage(),
    SettingsPage(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'My rides'),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/vechile_register.png",
                width: 24,
                height: 24,
              ),
              label: 'Register'),
        ],
        selectedItemColor: Colors.black,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Page'),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('About Page'),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Page'),
    );
  }
}
