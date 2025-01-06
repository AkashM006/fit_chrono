import 'package:flutter/material.dart';

class CustomSpinnerWidget extends StatelessWidget {
  const CustomSpinnerWidget({super.key});

  @override
  Widget build(BuildContext context) => const CircularProgressIndicator(
        strokeWidth: 2,
      );
}
