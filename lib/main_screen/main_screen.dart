import 'package:flutter/material.dart';
import 'package:interactive_bottom_sheet/interactive_bottom_sheet.dart';
import 'package:trimly/main_screen/widgets/explore_screen/explore_screen.dart';
import 'package:trimly/main_screen/widgets/explore_screen/widgets/location_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Map<String, String>> entries = [
    {
      "name": "Prince Barbershop",
      "shortAddress": "Taman Sri Serdang, 43300 Seri Kembangan, Selangor",
      "image": "assets/images/prince-barbershop.jpg",
      "rating": "4.1"
    },
    {
      "name": "Real Barbershop",
      "shortAddress": "Taman Kajang Putra, 43000 Kajang, Selangor",
      "image": "assets/images/real-barbershop.jpg",
      "rating": "4.7"
    }
  ];
  final List<int> colorCodes = <int>[600, 500, 100, 200];
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Explore(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 40, ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Bookings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      bottomSheet: (_selectedIndex == 1) ? bottomSheetItem() : null,
    );
  }

  Widget bottomSheetItem() {
    return InteractiveBottomSheet(
      options: const InteractiveBottomSheetOptions(),
      child: SizedBox(
          height: MediaQuery.of(context).size.height -
              kToolbarHeight -
              kBottomNavigationBarHeight -
              20,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return LocationCard(
                      heroTag: entries[index]["name"]!,
                      displayImage: entries[index]["image"]!,
                      businessName: entries[index]["name"]!,
                      rating: entries[index]["rating"]!,
                      shortAddress: entries[index]["shortAddress"]!);
                }),
          )),
    );
  }
}
