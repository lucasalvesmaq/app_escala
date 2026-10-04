import 'package:flutter/material.dart';
import 'screens/menu.dart';
import 'screens/logbook.dart';
import 'screens/salary.dart';
import 'utils/theme.dart';

void main() {
  runApp(const EscalaVooApp());
}

class EscalaVooApp extends StatelessWidget {
  const EscalaVooApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escala de Voo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const NavigationScreen(),
    );
  }
}

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    MenuScreen(),
    SalaryScreen(),
    LogbookScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Menu',
          ),
          NavigationDestination(
            icon: Icon(Icons.calculate),
            label: 'Salário',
          ),
          NavigationDestination(
            icon: Icon(Icons.book),
            label: 'Logbook',
          ),
        ],
      ),
    );
  }
}
