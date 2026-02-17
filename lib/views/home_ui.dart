import 'package:flutter/material.dart';
import 'bmi_ui.dart';
import 'abourt_ui.dart';
import 'bmr_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    BmiUI(),
    AboutUI(),
    BmrUI(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Body Health Calculator"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.red,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "BMI",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "About",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: "BMR",
          ),
        ],
      ),
    );
  }
}
