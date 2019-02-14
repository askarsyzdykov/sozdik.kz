import 'package:flutter/material.dart';
import 'package:my_app/models/word.dart';

class FavoritesScreen extends StatelessWidget {
  final _words = [
    Word("Слово 0", "ru", "kk"),
    Word("Слово 1", "ru", "kk"),
    Word("Слово 2", "ru", "kk"),
    Word("Слово 3", "ru", "kk"),
    Word("Слово 4", "ru", "kk"),
    Word("Слово 5", "ru", "kk"),
    Word("Слово 6", "ru", "kk"),
    Word("Слово 7", "ru", "kk"),
    Word("Слово 8", "ru", "kk"),
    Word("Слово 9", "ru", "kk"),
    Word("Слово 10", "ru", "kk"),
    Word("Слово 11", "ru", "kk"),
    Word("Слово 12", "ru", "kk"),
    Word("Слово 13", "ru", "kk"),
    Word("Слово 14", "ru", "kk"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: new PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: new Container(
              color: Theme.of(context).primaryColor,
              child: new TabBar(
                labelColor: Colors.white,
                tabs: [
                  Tab(text: "FROM KAZAKH"),
                  Tab(text: "FROM RUSSIAN"),
                ],
              ),
            )),
        body: TabBarView(
          children: [
            Tab(
              child: ListView.builder(
                itemCount: _words.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Tap on ' + _words[index].toString()),
                      ));
                    },
                    child: ListTile(
                      title: Text((_words[index].toString())),
                    ),
                  );
                },
              ),
            ),
            Tab(
              child: ListView.builder(
                itemCount: _words.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Tap on ' + _words[index].toString()),
                      ));
                    },
                    child: ListTile(
                      title: Text((_words[index].toString())),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
