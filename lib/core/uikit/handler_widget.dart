import 'package:flutter/material.dart';

class HandlerWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;
  final double borderRadius;
  final EdgeInsets? margin;

  const HandlerWidget({
    super.key,
    this.width = 60,
    this.height = 5,
    this.color,
    this.borderRadius = 5,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin ?? const EdgeInsets.only(top: 10, bottom: 6),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Theme.of(context).hintColor,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
