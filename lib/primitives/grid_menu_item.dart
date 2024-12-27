import 'package:flutter/material.dart';

class GridMenuItem {
  final IconData iconData;
  final String label;
  final String pagePath;

  GridMenuItem (this.iconData, this.label, [this.pagePath = ""]);

  void goToRote( BuildContext context ){
    try {
      Navigator.pushNamed(context, pagePath);
    }
    catch (e) {
      rethrow;
    }
  }
}