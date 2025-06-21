import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  EdgeInsets get customPadding => EdgeInsets.only(
    left: screenWidth / 13,
    top: screenHeight / 50,
    right: screenWidth / 13,
    bottom: screenHeight / 20,
  );
}
