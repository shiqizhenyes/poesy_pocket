
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:poesy_pocket/entity/concentration.dart';
import 'package:poesy_pocket/localization/p_localizations.dart';
import 'package:poesy_pocket/widget/NText.dart';
import 'package:sf/sf.dart';

class Meet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MeetState();
}

class _MeetState extends State<Meet> with TickerProviderStateMixin {


  PageController _pageController;

  Widget _recommendPoesyWidget() {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(top: 16.$dp),
        height: 250.$dp,
        child: Image.asset("assets/images/fo.jpg", fit: BoxFit.contain,),
      ),
    );
  }


  List<Widget> _poesiesView;
  List<Concentration> _concentrationList;

  _initConcentrationPoesies() {
    _concentrationList = [
      Concentration(title: "莲蕊有香尘", playCount: 2001),
      Concentration(title: "树林幽鸟恋", playCount: 2003),
      Concentration(title: "封软扁舟稳", playCount: 4003),
    ];
    _poesiesView = List<Widget>();
    _concentrationList.forEach((value) {
      var image = "assets/images/he.jpg";
      if (value.title == "树林幽鸟恋") {
        image = "assets/images/shulin.jpg";
      }
      _poesiesView.add(Container(
        padding: EdgeInsets.only(left: 5.$dp, right: 5.$dp),
        child: Stack(
          children: [
            Image.asset(image),
            Positioned(
              child: Container(
                color: Colors.black,
                height: 80.$dp,
                padding: EdgeInsets.only(left: 10.$dp, top: 10.$dp,
                  right: 10.$dp, bottom: 10.$dp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NText(value.title, textStyle: TextStyle(
                      color: Colors.white, fontSize: 16.$sp,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 10.$dp,),
                    NText(PLocations.of(context).hasPlay + PLocations.of(context).colon +
                        value.playCount.toString(), textStyle: TextStyle(
                        color: Colors.white54, fontSize: 14.$sp
                    ),)
                  ],
                ),
              ),
              bottom: 0, left: 0, right: 0,
            ),
          ],
        ),
      ));
    });
  }


  @override
  Widget build(BuildContext context) {
    _initConcentrationPoesies();
    return Column(
      children: [
        _recommendPoesyWidget(),
        SizedBox(height: 20.$dp,),
        NText(PLocations.of(context).readAloudPoesyForYou, textStyle: TextStyle(
          fontSize: 24.$sp, letterSpacing: 2, fontWeight: FontWeight.bold
        ),),
        NText(PLocations.of(context).concentration, textStyle: TextStyle(
            fontSize: 20.$sp,  letterSpacing: 2, fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 16.$dp,),
        Container(
          height: 180.$dp,
          child: Center(
            child: ListView.builder(itemBuilder: (context, index) {
              return _poesiesView[index];
            }, itemCount: _poesiesView.length, scrollDirection: Axis.horizontal,),
          ),
        )
      ],
    );
  }

}