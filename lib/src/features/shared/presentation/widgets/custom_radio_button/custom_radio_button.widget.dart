import 'package:flutter/material.dart';

class CustomRadioButtonWidget<T> extends StatelessWidget {
  const CustomRadioButtonWidget({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
  });

  final T value;
  final T groupValue;
  final void Function(T? value)? onChanged;
  final Widget label;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => onChanged?.call(value),
        child: Row(
          children: [
            Radio(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            label,
          ],
        ),
      );
}
