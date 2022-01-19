import 'package:flutter/material.dart';
import 'package:movie_app/presentation/resources/values-manager.dart';
import 'package:progress_indicator_button/progress_button.dart';

class MainButton extends StatelessWidget {
  final Function(AnimationController)  onPressed;
  final String text;
  final Color color, textColor,  borderColor;

  MainButton({
    this.text,
    this.onPressed,
    this.textColor,
    this.borderColor,
    this.color,});
  @override
  Widget build(BuildContext context) {
    // TODO: implement custom properties
    return ProgressButton(
      color: color,
      borderRadius: BorderRadius.circular(AppMargin.m56),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontSize: 14.5,
          fontFamily: 'Euclid',
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
