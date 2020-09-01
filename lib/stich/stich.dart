
import 'package:flutter/material.dart';
import 'package:poesy_pocket/localization/p_localizations.dart';
import 'package:poesy_pocket/util/w_colors.dart';
import 'package:poesy_pocket/widget/NText.dart';
import 'package:sf/sf.dart';


class Stich extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StichState();
}

class _StichState extends State<Stich> with TickerProviderStateMixin {


  List<Widget> _poesyImages;
  PageController _pageController;


  @override
  void initState() {
    super.initState();
  }


  Widget _poesyContent() {
    return Positioned(
      child: Container(
        margin: EdgeInsets.only(left: 16.$dp, right: 16.$dp),
        padding: EdgeInsets.all(16.$dp),
        height: 300,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.$dp),
            boxShadow: [
              BoxShadow(
                  color: WColors.grayEC,
                  offset: Offset(-6, 6),
                  blurRadius: 4.$dp
              )
            ]
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                NText("鸟鸣涧", textStyle: TextStyle(
                  fontSize: 18.$dp,
                ),),
                SizedBox(height: 20.$dp,),
                NText("人闲桂花落，", textStyle: TextStyle(
                    fontSize: 24.$dp,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 20.$dp,),
                NText("夜静春山空。", textStyle: TextStyle(
                    fontSize: 24.$dp,
                    fontWeight: FontWeight.bold
                ),)
              ],
            )
          ],
        ),
      ),
      top: 220.$dp, left: 0, right: 0,
    );
  }


  /// 
  @override
  Widget build(BuildContext context) {
    _poesyImages = List();
    for(int i = 0; i < 6; i++) {
      _poesyImages.add(SizedBox(
        child: Container(
          margin: EdgeInsets.only(left: 5.$dp, right: 5.$dp),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.$dp),
            child: Image(image: AssetImage("assets/images/picture1.jpeg"), fit: BoxFit.fitWidth,),
          ),
        ),
      ));
    }

    _pageController = PageController(viewportFraction: 0.9);

    return Container(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          _poesyContent(),
          Positioned(
            child: Container(
              height: 200.$dp,
              child: PageView(
                children: _poesyImages,
                controller: _pageController,
                onPageChanged: (index) {
                },
              ),
            ),
            top: 16.$dp, left: 0, right: 0,
          ),
        ],
      ),
    );
  }

}