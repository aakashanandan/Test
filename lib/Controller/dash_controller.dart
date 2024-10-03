import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DashController extends GetxController{

  TextEditingController search = TextEditingController();


  double minValue = 0.0;
  double maxValue = 100.0;


  static const double containerHeight = 50.0;
  static const double containerWidth = 65.0;


  int? selectedValue  = 0;


}