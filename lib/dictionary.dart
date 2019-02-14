import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class DictionaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 1.4;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black.withOpacity(0.8);

  static onTap(index) {
    print("$index selected.");
  }

  final List<Widget> _pages = <Widget>[
    new FlutterLogo(style: FlutterLogoStyle.horizontal, colors: Colors.red),
    new FlutterLogo(style: FlutterLogoStyle.stacked, colors: Colors.red),
    new FlutterLogo(style: FlutterLogoStyle.horizontal, colors: Colors.green),
    new FlutterLogo(style: FlutterLogoStyle.horizontal, colors: Colors.green),
    new FlutterLogo(style: FlutterLogoStyle.horizontal, colors: Colors.green),
    new FlutterLogo(style: FlutterLogoStyle.horizontal, colors: Colors.green),
    new FlutterLogo(style: FlutterLogoStyle.horizontal, colors: Colors.green),
    new FlutterLogo(style: FlutterLogoStyle.horizontal, colors: Colors.green),
    new FlutterLogo(style: FlutterLogoStyle.horizontal, colors: Colors.green),
    new FlutterLogo(style: FlutterLogoStyle.horizontal, colors: Colors.green),
  ];

  Widget _buildPageItem(BuildContext context, int index) {
    return new Page(page: _pages[index], index: index);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new IconTheme(
        data: new IconThemeData(color: _kArrowColor),
        child: new Stack(
          children: <Widget>[
            new PageView.builder(
              physics: new AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildPageItem(context, index % _pages.length);
              },
            ),
            new Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: new Container(
                padding: const EdgeInsets.all(10.0),
                child: new Center(
                  child: new DotsIndicator(
                    controller: _controller,
                    itemCount: _pages.length,
                    color: Colors.grey[800].withOpacity(0.5),
                    onPageSelected: (int page) {
                      _controller.animateToPage(
                        page,
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final page;
  final index;

  Page({
    @required this.page,
    @required this.index,
  });

  onTap() {
    print("${this.index} selected.");
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          this.page,
          new Material(
            type: MaterialType.transparency,
            child: new InkWell(onTap: this.onTap),
          ),
        ],
      ),
    );
  }
}
