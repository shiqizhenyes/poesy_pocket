
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
  var currentPageValue = 0.0;


  @override
  void initState() {
    super.initState();
  }


  Widget _poesyContent() {
    return Positioned(
      child: Container(
        margin: EdgeInsets.only(left: 40.$dp, right: 40.$dp),
        padding: EdgeInsets.only(left: 16.$dp, top: 40.$dp, right: 16.$dp,
            bottom: 16.$dp),
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
      top: 260.$dp, left: 0, right: 0,
    );
  }

  /// 
  @override
  Widget build(BuildContext context) {
    _poesyImages = List();
    for(int i = 0; i < 6; i++) {
      _poesyImages.add(SizedBox(
        child: Container(
          margin: EdgeInsets.only(left: 0.$dp, right: 0.$dp),
          padding: EdgeInsets.only(left: 0.$dp, right: 0.$dp),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.$dp),
            child: Image(image: AssetImage("assets/images/picture1.jpeg"),
              fit: BoxFit.fitHeight, ),
          ),
        ),
      ));
    }

    _pageController = PageController(viewportFraction: 0.9);
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page;
      });
    });
    return Container(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          _poesyContent(),
          Positioned(
            child: Container(
              height: 250.$dp,
              child: PageView.builder(
                itemBuilder: (context, index) {
                  if (index == currentPageValue.floor()) {
                    // print("center + ${index} $currentPageValue");
                    // print("center + ${(index - currentPageValue - 0.06)}");
                    // currentPageValue + 0.6
                    return Transform.scale(scale: 0.99,
                      child: _poesyImages[index],);
                  } else if (index == currentPageValue.floor() + 1) {
                    // print("right + $index $currentPageValue");
                    // print("right + ${index - currentPageValue}");
                    // print("right ${((currentPageValue) <= 0.94 ?
                    // 0.94 : (index - currentPageValue))}");
                    print("right ${1 - (index - currentPageValue)}");
                    ///  currentPageValue 0 1
                    ///
                    /// index - currentPageValue  1 0
                    ///1 ->
                    return Transform.scale(scale: 0.94,
                      child: _poesyImages[index],);

                  } else {
                    return Transform.scale(scale: 0.94,
                      child: _poesyImages[index],);
                  }
                },
                itemCount: _poesyImages.length,
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