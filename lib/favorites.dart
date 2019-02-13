import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
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
              child: ListView(children: <Widget>[
                ListTile(
                  title: Text('Favorite'),
                ),
                ListTile(
                  title: Text('Album'),
                ),
                ListTile(
                  title: Text('Phone'),
                )
              ]),
            ),
            Tab(
              child: ListView(children: <Widget>[
                ListTile(
                  title: Text('Favorite'),
                ),
                ListTile(
                  title: Text('Album'),
                ),
                ListTile(
                  title: Text('Phone'),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}