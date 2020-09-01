
import 'package:flutter/widgets.dart';

class NText extends Text {
  NText(String data, {this.textStyle}) : super(data, style: textStyle);

  final TextStyle textStyle;

  @override
  TextStyle get style => textStyle.copyWith(
      fontFamily: "NotoSerifSC"
  );

}