import 'package:flutter/material.dart';
import 'package:my_app/dictionary.dart';
import 'package:my_app/favorites.dart';
import 'package:my_app/history.dart';
import 'package:my_app/settings.dart';
import 'package:my_app/sozdik_app_bar.dart';
import 'package:my_app/translator.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _selectedIndex = 0;
  final _widgetOptions = [
    DictionaryScreen(),
    HistoryScreen(),
    FavoritesScreen(),
    TranslatorScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SozdikAppBar(),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: new FloatingActionButton(
          backgroundColor: const Color(0xFF797777),
          child: new Icon(Icons.search),
          onPressed: fabPressed),
      bottomNavigationBar: new BottomNavigationBar(
          fixedColor: Colors.deepPurple,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: [
            new BottomNavigationBarItem(
                icon: const Icon(Icons.swap_horiz),
                title: new Text('Dictionary')),
            new BottomNavigationBarItem(
                icon: const Icon(Icons.history), title: new Text('History')),
            new BottomNavigationBarItem(
                icon: const Icon(Icons.star), title: new Text('Favorites')),
            new BottomNavigationBarItem(
              icon: const Icon(Icons.translate),
              title: new Text('Translator'),
            ),
            new BottomNavigationBarItem(
              icon: const Icon(Icons.build),
              title: new Text('Settings'),
            )
          ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void buttonPressed() {}

  void fabPressed() {}
}
