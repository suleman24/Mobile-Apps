import 'package:flutter/material.dart';


class repeatcontainer extends StatelessWidget {
  repeatcontainer({required this.colors,this.cardwidget, this.onpressed});
  final Color colors;
  final Widget? cardwidget;

  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardwidget,
        decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.circular(15.0)
        ),
      ),
    );
  }
}

