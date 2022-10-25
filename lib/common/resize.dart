import 'package:flutter/material.dart';

class Resize {
  double _edgeInsetsScaleFactor = 1;
  double _textScaleFactor = 1;
  double _iconScaleFactor = 1;
  double _appBarScaleFactor = 1;
  double _floatingActionButtonScaleFactor = 1;
  double _checkBoxScaleFactor = 1;
  double _switchScaleFactor = 1;
  double _sizeBoxScaleFactor = 1;
  int _minLines = 4;
  double _calendarScaleFactor = 1;
  double _dropDownButtonScaleFactor = 1;

  double get textScaleFactor => _textScaleFactor;
  double get iconScaleFactor => _iconScaleFactor;
  double get appBarScaleFactor => _appBarScaleFactor;
  double get floatingActionButtonScaleFactor =>
      _floatingActionButtonScaleFactor;
  double get checkBoxScaleFactor => _checkBoxScaleFactor;
  double get switchScaleFactor => _switchScaleFactor;
  double get sizeBoxScaleFactor => _sizeBoxScaleFactor;
  int get minLines => _minLines;
  double get calendarScaleFactor => _calendarScaleFactor;
  double get dropDownButtonScaleFactor => _dropDownButtonScaleFactor;

  void init(Size size) {
    if (size.width < 800) {
      return;
    }
    if (size.width >= 1200) {
      _edgeInsetsScaleFactor = 3.15;
      _textScaleFactor = 3.5;
      _iconScaleFactor = 3.5;
      _appBarScaleFactor = 3.4;
      _floatingActionButtonScaleFactor = 3.5;
      _checkBoxScaleFactor = 4;
      _switchScaleFactor = 4;
      _sizeBoxScaleFactor = 2.5;
      _minLines = 8;
      _calendarScaleFactor = 3;
      _dropDownButtonScaleFactor = 2;
    } else {
      _edgeInsetsScaleFactor = 2.15;
      _textScaleFactor = 2.5;
      _iconScaleFactor = 2.5;
      _appBarScaleFactor = 2.4;
      _floatingActionButtonScaleFactor = 2.5;
      _checkBoxScaleFactor = 2.5;
      _switchScaleFactor = 2.5;
      _sizeBoxScaleFactor = 1.5;
      _minLines = 6;
      _calendarScaleFactor = 2;
      _dropDownButtonScaleFactor = 1.5;
    }
  }

  EdgeInsets calculateEdgeInsets(EdgeInsets edgeInsets) =>
      edgeInsets * _edgeInsetsScaleFactor;
}
