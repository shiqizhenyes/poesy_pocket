import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:poesy_pocket/localization/p_localizations.dart';
import 'package:poesy_pocket/localization/p_locations_delegate.dart';
import 'package:poesy_pocket/stich/stich.dart';
import 'package:poesy_pocket/util/w_colors.dart';
import 'package:poesy_pocket/widget/NText.dart';
import 'package:sf/sf.dart';

void main() {
  runApp(MyApp());
  if(Platform.isAndroid) {
    SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    );
    SystemChrome.setSystemUIOverlayStyle(uiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "藏诗",
      theme: ThemeData(
        primaryColor: Colors.white,
        backgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: [
        PLocationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('en', 'UK'),
        const Locale.fromSubtags(languageCode: 'zh'),
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'),
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'),
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'HK')
      ],
      home: MyHomePage(title: "藏诗"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  int _counter = 0;
  TabController _tabController;
  List<Widget> _tabs;
  var _tabsContent;
  List<Widget> _tabarViews;

  @override
  void initState() {
    super.initState();
  }

  ///
  /// FloatingActionButton(
  //         onPressed: () {
  //
  //         },
  //         backgroundColor: WColors.blue6d,
  //         child: NText(PLocations.of(context).smooth, textStyle: TextStyle(
  //           color: Colors.white, fontSize: 24.$dp
  //         ),),
  //       )
  @override
  Widget build(BuildContext context) {
    sf.init(context).fit(375, 750);
    _tabsContent = [
      PLocations.of(context).stich,
      PLocations.of(context).meet,
      PLocations.of(context).poetry,
      PLocations.of(context).ritualMusic
    ];
    _tabController = TabController(length: _tabsContent.length, vsync: this);
    _tabs = List<Widget>();
    _tabarViews = List<Widget>();
    _tabsContent.forEach((content) {
      _tabs.add(Tab(text: content,));
      _tabarViews.add(Stich());
    });
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(onPressed: () {}, child: Icon(Icons.menu)),
        title: NText(widget.title, textStyle: TextStyle(),),
        elevation: 0,
        actions: [
          FlatButton(onPressed: () {}, child: Icon(Icons.more_vert))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TabBar(tabs: _tabs,
              controller: _tabController,
              indicatorColor: Colors.black,
              indicatorWeight: 2.$dp,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.only(left: 20.$dp, right: 20.$dp),
            ),
            Expanded(child: TabBarView(children: _tabarViews, controller: _tabController,))
          ],
        ),
      ),
    );
  }
}
