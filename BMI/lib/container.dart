import 'package:flutter/material.dart';


class repeatcontainer extends StatelessWidget {
  repeatcontainer({required this.colors,required this.cardwidget});
  final Color colors;
  final Widget cardwidget;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: cardwidget,
      decoration: BoxDecoration(
          color: Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(15.0)
      ),
    );
  }
}

