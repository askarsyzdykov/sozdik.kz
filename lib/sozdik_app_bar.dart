import 'package:flutter/material.dart';

class SozdikAppBar extends StatefulWidget {
  static _SozdikAppBarState of(BuildContext context) => context.ancestorStateOfType(const TypeMatcher<_SozdikAppBarState>());

  @override
  _SozdikAppBarState createState() => _SozdikAppBarState();
}

class _SozdikAppBarState extends State<SozdikAppBar>
    with SingleTickerProviderStateMixin {
  TextEditingController _searchQuery;
  LocalHistoryEntry _searchEntry;

  bool _isSearching = false;
  bool _theatersOpen = false;

  @override
  void initState() {
    super.initState();

    _searchEntry = LocalHistoryEntry(onRemove: _stopSearching);
    _searchQuery = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _toggleTheaters() async {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
      _setTheatersOpenFlag(false);
    } else {
      _setTheatersOpenFlag(true);

      // await Navigator.push(context, TheaterSelectorPopup());
      // _setTheatersOpenFlag(false);
    }
  }

  void _setTheatersOpenFlag(bool open) {
    setState(() {
      _theatersOpen = open;
    });
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return [
        IconButton(
          color: Colors.white70,
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQuery == null || _searchQuery.text.isEmpty) {
              // Stop searching.
              Navigator.pop(context);
              return;
            }

            _clearSearchQuery();
          },
        ),
      ];
    }

    return [
      IconButton(
        color: Colors.white70,
        icon: const Icon(Icons.search),
        onPressed: startSearch,
      ),
    ];
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQuery,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Search movies & showtimes...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white30),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: _updateSearchQuery,
    );
  }

  void _updateSearchQuery(String newQuery) {
    // final store = StoreProvider.of<AppState>(context);
    // store.dispatch(SearchQueryChangedAction(newQuery));
  }

  void startSearch() {
    ModalRoute.of(context).addLocalHistoryEntry(_searchEntry);

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQuery.clear();
      _updateSearchQuery(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      leading: _isSearching ? const BackButton() : null,
      title: _isSearching ? _buildSearchField() : _Title(_toggleTheaters),
      actions: _buildActions(),
    );
  }
}

class _Title extends StatelessWidget {
  _Title(this.toggleTheaters);
  final VoidCallback toggleTheaters;

  @override
  Widget build(BuildContext context) {
    // final subtitle = StoreConnector<AppState, Theater>(
    //   converter: (store) => store.state.theaterState.currentTheater,
    //   builder: (BuildContext context, Theater currentTheater) {
    //     return Text(
    //       currentTheater?.name ?? '',
    //       style: const TextStyle(
    //         fontSize: 12.0,
    //         color: Colors.white70,
    //       ),
    //     );
    //   },
    // );

    final title = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('sozdik.kz'),
        // subtitle,
      ],
    );

    return GestureDetector(
      onTap: toggleTheaters,
      child: Row(
        children: [
          title,
        ],
      ),
    );
  }
}
