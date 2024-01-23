import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/angerlist.dart';
import 'package:flutter_application_1/screen/animal.dart';
import 'package:flutter_application_1/screen/dashboard.dart';
import 'package:flutter_application_1/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  Future<void> _onItemTapped(int index) async {
    if (index == 3) {
      await clearShared();
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      }
    } else {
      _selectedIndex = index;
      setState(() {});
    }
  }

  Future<void> clearShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: switch (_selectedIndex) {
        0 => const DashboardScreen(),
        1 => const AngarList(),
        2 => Animal(),
        3 => const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              Text("Çıkış yapılıyor")
            ],
          ),
        _ => const SizedBox(),
      }),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Angerlist',
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Angerlist',
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.label),
            label: 'Exit',
            backgroundColor: Colors.teal,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
