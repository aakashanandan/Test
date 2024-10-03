import 'package:flutter/material.dart';

class RadioWidget extends StatelessWidget {
  final String title;
  final int value;
  final int groupValue;
  final Function(int?) onChanged;

  const RadioWidget({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Radio<int>(
          value: value,
          groupValue: groupValue,
          onChanged: (int? newValue) {
            onChanged(newValue);
          },
        ),
      ],
    );
  }
}
