import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/widgets/textwidget.dart';

import '../Controller/dash_controller.dart';

class CustomContainer extends StatelessWidget {

  DashController controller = Get.find();

  final String text;
  final Color textColor;
  final Color backgroundColor;
  final FontWeight fontWeight;
  final double fontSize;

   CustomContainer({
    Key? key,
    required this.text,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.fontWeight = FontWeight.w500,
    this.fontSize = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DashController.containerHeight,
      width: DashController.containerWidth,
      color: backgroundColor,
      child: Center(
        child: CustomText(
          text: text,
          color: textColor,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
